#pragma once


#define LG_SLOT_SIZE 16
#define SLOT_SIZE (1 << 16)
#define NUM_SLOTS 64

#define PA_WIDTH 32     // must be 32 or greater
#define VA_WIDTH 40     // must be greater than PA

#define USE_INTERRUPT true


#include <iostream>
#include <iomanip>

#ifdef COSIM
    #include "../lib/FPGACoreLib_CoSim.h"
#else
    #include "../../driver/include/FPGACoreLib.h"
    #pragma comment(lib, "../../driver/bin/FPGACoreLib.lib")
    #include "../../driver/include/FPGAManagementLib.h"
#endif

#include "command.h"


class FPGA_slot {
    private:

        FPGA_HANDLE fpgaHandle;
        size_t num;

        DWORD* pInputBuffer;
        DWORD* pOutputBuffer;

    public:

        FPGA_slot(FPGA_HANDLE fpgaHandle, size_t num)
            : fpgaHandle(fpgaHandle), num(num)
        {
            if (num >= NUM_SLOTS)
                throw std::out_of_range{ "slot number must be 0-63" };
            FPGA_GetInputBufferPointer(fpgaHandle, num, &pInputBuffer);
            FPGA_GetOutputBufferPointer(fpgaHandle, num, &pOutputBuffer);
        }

        ~FPGA_slot() {
            FPGA_DiscardOutputBuffer(fpgaHandle, num);
        }

        void write(size_t idx, DWORD data) {
            if (idx >= SLOT_SIZE / sizeof(DWORD))
                throw std::out_of_range{""};
            pInputBuffer[idx] = data;
        }

        DWORD read(size_t idx) {
            if (idx >= SLOT_SIZE / sizeof(DWORD))
                throw std::out_of_range{""};
            return pOutputBuffer[idx];
        }

        void writePCIE(size_t idx, PCIEData data) {
            if (idx >= SLOT_SIZE / sizeof(PCIEData))
                throw std::out_of_range{""};
            ((PCIEData*)pInputBuffer)[idx] = data;
        }

        PCIEData readPCIE(size_t idx) {
            if (idx >= SLOT_SIZE / sizeof(PCIEData))
                throw std::out_of_range{""};
            return ((PCIEData*)pInputBuffer)[idx];
        }

        void send(size_t size) {
            FPGA_SendInputBuffer(fpgaHandle, num, size, USE_INTERRUPT);
        }

        size_t receive() {
            DWORD size;
            FPGA_WaitOutputBuffer(fpgaHandle, num, &size, USE_INTERRUPT);
            return size;
        }
};

class FPGA {
    private:

        FPGA_HANDLE fpgaHandle;

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

    public:

        FPGA() {
            // When in cosimulation mode using Modelsim, buffers must be flushed immediately
            #ifdef COSIM
                setbuf(stdout, NULL);
            #endif

            // Open handle to FPGA
            FPGA_CreateHandle(&fpgaHandle, 0, 0x0, NULL, NULL);
            // Enable PCIe
            enablePCIe(fpgaHandle);
        }

        ~FPGA() {
            // Disable PCIe
            disablePCIe(fpgaHandle);
            // Close handle
            FPGA_CloseHandle(fpgaHandle);
        }

        FPGA_slot getSlot(size_t num) {
            return FPGA_slot{ fpgaHandle, num };
        }
};
