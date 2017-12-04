#include <iostream>

#ifdef COSIM
    #include "../lib/FPGACoreLib_CoSim.h"
#else
    #include "../../driver/include/FPGACoreLib.h"
    #pragma comment(lib, "../../driver/bin/FPGACoreLib.lib")
    #include "../../driver/include/FPGAManagementLib.h"
#endif


#define SLOT_SIZE (64 * 1024)
#define NUM_SLOTS 64


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

int main(int argc, char** argv) {
    // When in cosimulation mode using Modelsim, buffers must be flushed immediately
    #ifdef COSIM
        setbuf(stdout, NULL);
    #endif

    FPGA_HANDLE fpgaHandle;
    DWORD* pInputBuffer;
    DWORD* pOutputBuffer;
    DWORD bufferId = 17;
    DWORD sendBytes = 112;
    DWORD recvBytes;

    // Open handle to FPGA
    FPGA_CreateHandle(&fpgaHandle, 0, 0x0, NULL, NULL);

    // Enable PCIe
    enablePCIe(fpgaHandle);

    // Grab pinned input and output buffers
    FPGA_GetInputBufferPointer(fpgaHandle, bufferId, &pInputBuffer);
    FPGA_GetOutputBufferPointer(fpgaHandle, bufferId, &pOutputBuffer);

    // Write 112B (7 packets) of random data into input buffer
    for (DWORD i = 0; i < sendBytes / sizeof(DWORD); ++i) {
        pInputBuffer[i] = rand();
        std::cout << pInputBuffer[i] << " ";
    }
    std::cout << std::endl;

    bool useInterrupt = true;
    // Send the data to the FPGA
    FPGA_SendInputBuffer(fpgaHandle, bufferId, sendBytes, useInterrupt);
    // Wait for the response to come back
    FPGA_WaitOutputBuffer(fpgaHandle, bufferId, &recvBytes, useInterrupt);

    // Print response contents
    for (DWORD i = 0; i < recvBytes / sizeof(DWORD); ++i) {
        std::cout << pOutputBuffer[i] << " ";
    }
    std::cout << std::endl;

    // Discard the buffer
    FPGA_DiscardOutputBuffer(fpgaHandle, bufferId);

    // Disable PCIe
    disablePCIe(fpgaHandle);

    // Close handle
    FPGA_CloseHandle(fpgaHandle);
}
