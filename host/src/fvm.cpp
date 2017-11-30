/*
Name: LoopbackStressTest.cpp
Description: Catapult PCIe loopback stress test, demonstrates basic Catapult functionality

Copyright (c) Microsoft Corporation

All rights reserved.

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the ""Software""), to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/


#include <concurrent_queue.h>
#include <concrt.h>
#include <ppl.h>
#include <assert.h>

#ifdef COSIM
#include "../lib/FPGACoreLib_CoSim.h"
#else
#include "../../driver/include/FPGACoreLib.h"
#pragma comment(lib, "../../driver/bin/FPGACoreLib.lib")
#include "../../driver/include/FPGAManagementLib.h"
#endif

#include "../lib/FPGA_PCIeJobDispatcher.h"

typedef uint32_t PCIePayload;

typedef struct {
	bool eom;
	PCIePayload payload;
} PCIeSendPayload;


#define PCIE_HIP_NUM 0x0

#define MAX_BUF_SIZE_BYTES 65536
#define USE_INTERRUPT false

#define CONFIG_DRAM_CHAN0 600
#define CONFIG_DRAM_CHAN1 700
#define CONFIG_DRAM_INTERLEAVED 800

typedef enum {
	SINGLE_INORDER = 0,
	SINGLE_OOO = 1,
	PARALLEL = 2,
	PARALLEL_DECOUPLED = 3
} TestMode;



// Enable PCIe (default disabled)
void enablePCIe(FPGA_HANDLE fpgaHandle) {
	DWORD pcie = -1;
	FPGA_ReadShellRegister(fpgaHandle, 0, &pcie);

	// set control_register[6]
	pcie = pcie | (1 << 6);
	FPGA_WriteShellRegister(fpgaHandle, 0, pcie);
}

// Disable PCIe
void disablePCIe(FPGA_HANDLE fpgaHandle) {
	DWORD pcie = -1;
	FPGA_ReadShellRegister(fpgaHandle, 0, &pcie);

	// clear control_register[6]
	pcie = pcie & ~(1 << 6);
	FPGA_WriteShellRegister(fpgaHandle, 0, pcie);
}

int main(int argc, char* argv[]) {
	if (argc != 5) {
		printf(".\\LoopbackStressTest.exe <Total transfer size, in MB> <Number of slots> <Job size, in KB, max 64> <Mode>\n\n");
		printf("Modes:\n");
		printf("0: Single-thread, in-order job completion\n");
		printf("1: Single-thread, out-of-order job completion\n");
		printf("2: Multi-threaded\n");
		printf("3: Multi-threaded, decoupled job dispatch/completition\n\n");
		printf("Example: .\\LoopbackStressTest.exe 4 8 64 0\n\n");
		exit(1);
	}
	uint64_t totalData = (uint64_t)atoi(argv[1]) * 1024 * 1024;
	uint32_t numSlots = atoi(argv[2]);
	uint32_t jobSize = atoi(argv[3]) * 1024;
	TestMode mode = (TestMode)atoi(argv[4]);
	uint64_t jobsPerSlot = totalData / (jobSize*numSlots);

	printf("Running loopback test in mode %d, transferring %lld bytes over %d slots, launching %lld jobs, each transferring %d bytes\n",
		mode, totalData, numSlots, jobsPerSlot, jobSize);

	FPGA_HANDLE fpgaHandle;

	// When in cosimulation mode using Modelsim, buffers must be flushed immediately
#ifdef COSIM
	setbuf(stdout, NULL);
#endif

	// Open handle to FPGA 
	printf("Opening handle...\n");
	FPGA_CreateHandle(&fpgaHandle, PCIE_HIP_NUM, 0x0, NULL, NULL);

	// Configure hardware settings
	//FPGA_WriteSoftRegister(fpgaHandle, CONFIG_DRAM_INTERLEAVED, 0);
	FPGA_WriteSoftRegister(fpgaHandle, CONFIG_DRAM_CHAN0, 0);

	// Enable PCIe (default disabled)
	enablePCIe(fpgaHandle);
	DWORD reg = -1;
	FPGA_ReadShellRegister(fpgaHandle, 0, &reg);
	printf("Control register value: 0x%08x\n", reg);

	// Configure scheduler with maximum thread count
	uint32_t numThreads = 0;
	switch (mode) {
	case SINGLE_INORDER:
	case SINGLE_OOO:
		numThreads = 2;
		break;
	case PARALLEL:
		numThreads = numSlots + 1;
		break;
	case PARALLEL_DECOUPLED:
		numThreads = numSlots * 2 + 1;
		break;
	default:
		printf("Invalid mode\n");
		exit(1);
	}
	printf("Spawning %d threads\n", numThreads);

	Concurrency::SchedulerPolicy sp(1, Concurrency::MaxConcurrency, numThreads);
	Concurrency::Scheduler* scheduler = Concurrency::Scheduler::Create(sp);
	scheduler->Attach();

	// Instantiate FPGA PCIe job dispatcher
	FPGA_PCIeJobDispatcher* dispatcher = new FPGA_PCIeJobDispatcher(fpgaHandle, numSlots);

	// Allocate slot input/output buffers
	uint32_t** inputBufs = new uint32_t*[numSlots];
	uint32_t** outputBufs = new uint32_t*[numSlots];
	for (uint32_t i = 0; i < numSlots; i++) {
		inputBufs[i] = new uint32_t[MAX_BUF_SIZE_BYTES / sizeof(uint32_t)];
		outputBufs[i] = new uint32_t[MAX_BUF_SIZE_BYTES / sizeof(uint32_t)];
	}

	// Initialize slot input buffers
	uint32_t counter = 0;
	for (uint32_t i = 0; i < numSlots; i++) {
		for (uint32_t j = 0; j < jobSize / sizeof(uint32_t); j++) {
			inputBufs[i][j] = counter++;
		}
	}
	printf("Starting test\n");

	// Start performance counters
	uint64_t freq, startTime, endTime;
	QueryPerformanceFrequency((LARGE_INTEGER*)&freq);	//cycles per second
	QueryPerformanceCounter((LARGE_INTEGER*)&startTime);

	bool failed = false;

	switch (mode) {
	case SINGLE_INORDER:
		printf("Running single-threaded test with in-order job completion\n");
		for (uint64_t i = 0; i < jobsPerSlot; i++) {
			for (uint32_t j = 0; j < numSlots; j++) {
				dispatcher->sendJob(j, inputBufs[j], outputBufs[j], jobSize);
			}

			for (uint32_t j = 0; j < numSlots; j++) {
				uint32_t recvJobSize;
				while (!dispatcher->recvJob(j, recvJobSize)) {
					concurrency::wait(0);
				}

				// Check results
				assert(recvJobSize == jobSize);
				for (uint32_t k = 0; k < recvJobSize / sizeof(uint32_t); k++) {
					if (!failed && outputBufs[j][k] != inputBufs[j][k]) {
						printf("Job %lld: inputBufs[%d][%d] = %d, ", i, j, k, inputBufs[j][k]);
						printf("outputBufs[%d][%d] = %d\n", j, k, outputBufs[j][k]);
						failed = true;
					}
					//assert(outputBufs[j][k] == inputBufs[j][k]);
				}
			}
		}
		break;

	case SINGLE_OOO:

		printf("Running single-threaded test with out-of-order job completion\n");
		for (uint64_t i = 0; i < jobsPerSlot; i++) {
			for (uint32_t j = 0; j < numSlots; j++) {
				dispatcher->sendJob(j, inputBufs[j], outputBufs[j], jobSize);
			}

			uint32_t dones = 0;
			while (dones != numSlots) {
				for (uint32_t j = 0; j < numSlots; j++) {
					uint32_t recvJobSize;
					if (dispatcher->recvJob(j, recvJobSize)) {
						assert(recvJobSize == jobSize);
						dones++;
					}
				}
			}
		}
		break;

	case PARALLEL:

		printf("Running multi-threaded test\n");
		concurrency::parallel_for<DWORD>(0, numSlots, [&](DWORD slot) {
			for (uint64_t i = 0; i < jobsPerSlot; i++) {
				dispatcher->sendJob(slot, inputBufs[slot], outputBufs[slot], jobSize);

				uint32_t recvJobSize;
				while (!dispatcher->recvJob(slot, recvJobSize)) {
					concurrency::wait(0);
				}
				assert(recvJobSize == jobSize);
			}

		});
		break;

	case PARALLEL_DECOUPLED:

		printf("Running multi-threaded test with decoupled job dispatch/completion\n");
		concurrency::parallel_for<DWORD>(0, numSlots, [&](DWORD slot) {
			concurrency::parallel_for<DWORD>(0, 2, [&](DWORD x) {
				// Slot job dispatch thread
				if (x == 0) {
					for (uint64_t i = 0; i < jobsPerSlot; i++) {
						dispatcher->sendJob(slot, inputBufs[slot], outputBufs[slot], jobSize);
					}
				}
				// Slot job completion thread
				else {
					for (uint64_t i = 0; i < jobsPerSlot; i++) {
						uint32_t recvJobSize;
						while (!dispatcher->recvJob(slot, recvJobSize)) {
							concurrency::wait(0);
						}
						assert(recvJobSize == jobSize);
					}
				}
			});
		});
		break;
	}

	QueryPerformanceCounter((LARGE_INTEGER*)&endTime);
	double actualTestTime = (endTime - startTime) / ((double)(freq));
	double sizeMB = double(totalData) / (1024.0 * 1024.0);
	printf("Loopback stress test transferred %.1lf MB in %.3lf seconds: %.3lf MB/s\n", sizeMB, actualTestTime, sizeMB / actualTestTime);

	// Shut down FPGA job dispatcher

	printf("Deleting FPGA_PCIeJobDispatcher, waiting for work to drain...\n");
	dispatcher->shutdown();
	delete dispatcher;

	// Close handle.
	FPGA_CloseHandle(fpgaHandle);

	return 0;
}
