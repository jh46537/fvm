#pragma once

#include <Windows.h>
#include "FPGACoreLib.h"

#ifdef FPGACOMLIB_COMPILE
#define  _CDLLEXPORT_ extern "C" __declspec(dllexport)
#else
#define _CDLLEXPORT_ extern "C" __declspec(dllimport)
#endif

//
// Queryable statistics for health monitoring
//
            
#define FPGA_STAT_CYCLES_LOWER                      8
#define FPGA_STAT_CYCLES_UPPER                      9
#define FPGA_STAT_CRC_ERRORS                        10 
#define FPGA_STAT_DRAM_0_SINGLE_ERRORS              11
#define FPGA_STAT_DRAM_0_DOUBLE_ERRORS              12
#define FPGA_STAT_DRAM_0_UNCORRECTED_ERRORS         13

//
// Soft reset types
//
#define FPGA_SOFT_RESET_ROLE                        14

//
// This function retrieves the total number of shell registers.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_GetNumberShellRegisters(_In_ FPGA_HANDLE fpgaHandle, _Out_ DWORD *numShellRegs);

//
// This function allows users to read shell registers.  It is both multithreaded- and multiprocesss-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ReadShellRegister(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD registerNumber, _Out_ DWORD *readValue);

//
// This function allows users to write shell registers. It is both multithreaded- and multiprocess-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_WriteShellRegister(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD registerNumber, _In_ DWORD writeValue);

//
// This functions returns whether the loaded FPGA image is a Golden image or not.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_IsGoldenImage(_In_ FPGA_HANDLE fpgaHandle, _Out_ BOOL *isGolden, _Out_ DWORD *roleID, _Out_ DWORD *roleVersion);

//
// This function returns the RSU Image ID 
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ReadRsuImageId(_In_ FPGA_HANDLE fpgaHandle, _Out_ PDWORD pImageId);

//
// This function forces FPGA reconfiguration. It is not multithreaded- or multiprocess-safe.
// The act of re-configuration will cause the existing FPGA handles to be closed.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_Reconfig(_In_ FPGA_HANDLE *fpgaHandles, _In_ DWORD numHandles, _In_ BOOL reconfigToGolden);

//
// This function is used to update the flash images on the FPGA. It can either be used to update the golden or app image.
// Writing to the golden image requires explicitly passing in FPGA_HANDLE_FLAG_WRITEGOLDEN during handle creation.
// WARNING: writing a bad golden image to the FPGA is a career-limiting move and can cause irreparable damage.
//
// This function is protected by an internal mutex against other calls to 'FPGA_WriteFlashImage*' and 'FPGA_CaptureFlashImage*'.
// The 'timeoutInMs' argument determines how long (in milliseconds) the function waits for acquiring the mutex.  The default wait time is set
// according to the worst-case flash write time multiplied by 2 (5 minutes). Setting timeoutInMs to INFINITE removes the timeout.
// When a timeout is triggered, this function returns FPGA_STATUS_FLASH_MUTEX_TIMEOUT.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_WriteFlashImageEx(_In_ FPGA_HANDLE fpgaHandle, _In_ BOOL writeToGolden, _In_ const char * RpdFilename, _In_ DWORD timeoutInMs = DEFAULT_FLASH_ACCESS_TIMEOUT_IN_MILLISECONDS);

//
// This function is preserved for backwards compatibility. Unlike FPGA_WriteFlashImageEx, this function requires an
// exclusive handle.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_WriteFlashImage(_In_ FPGA_HANDLE fpgaHandle, _In_ BOOL writeToGolden, _In_ const char * RpdFilename);

//
// This function is used to read the flash images from the FPGA to a file. It can either be used to read the golden or app image.
//
// This function is protected by an internal mutex against other calls to 'FPGA_WriteFlashImage*' and 'FPGA_CaptureFlashImage*'.
// The 'timeoutInMs' argument determines how long the function waits (in milliseconds) for acquiring the mutex.  The default wait time is set
// according to the worst-case flash write time multiplied by 2 (5 minutes). Setting timeoutInMs to INFINITE removes the timeout.
// When a timeout is triggered, this function returns FPGA_STATUS_FLASH_MUTEX_TIMEOUT.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_CaptureFlashImageEx(_In_ FPGA_HANDLE fpgaHandle, _In_ BOOL isGolden, _In_ const char * RpdFilename, _In_ DWORD timeoutInMs = DEFAULT_FLASH_ACCESS_TIMEOUT_IN_MILLISECONDS);

//
// This function is preserved for backwards compatibility. Unlike FPGA_CaptureFlashImageEx, this function requires an
// exclusive handle.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_CaptureFlashImage(_In_ FPGA_HANDLE fpgaHandle, _In_ BOOL isGolden, _In_ const char * RpdFilename);

//
// Disable non-maskable interrupt error reporting.  Needed during FPGA reconfiguration. It is not multithreaded- or multiprocess-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_DisableNMI(_In_ FPGA_HANDLE fpgaHandle);

//
// Sanity check: FPGA reconfig often fails simply because the FPGA vendor/device ID changed after reconfig
// Will need to use RSU -rootportReload first in order to restore the ability to open an FPGA handle
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ReadVendorDeviceId(_In_ FPGA_HANDLE fpgaHandle, _Out_ DWORD *vendorId, _Out_ DWORD *deviceId);

//
// Disables and re-enables instances of only the port filter driver that are believed to be upstream of the FPGA.
// May not target all needed instances, but this should definitely not target network or GPU or other things that
// sometimes make FPGA_CycleRootportEnabledNoDriver() crash the machine.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ReviveRootportNoDriver();

//
// Disables and re-enables all instances of the root port filter driver.
// Useful if the FPGA device fails to start after reconfig, potentially saves a reboot
//
_CDLLEXPORT_ FPGA_STATUS FPGA_CycleRootportEnabledNoDriver();

//
// Disables and re-enables the FPGA in device manager with no driver installed (?).  It is not multithreaded- or multiprocess-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_CycleDeviceEnabledNoDriver();

//
// Used in JTAG-based reconfiguration. Call this function before JTAG reconfiguration to disable AER and error reporting. It is not multithreaded- or multiprocess-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_PrepForReconfig(_In_ FPGA_HANDLE *fpgaHandles, _In_ DWORD numHandles);

//
// Used in JTAG-based reconfiguration. Call this function after JTAG reconfiguration to re-enable AER and error reporting. It is not multithreaded- or multiprocess-safe.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ResetAfterReconfig(_In_ FPGA_HANDLE *fpgaHandles, _In_ DWORD numHandles);

//
// Retrieves FPGA shell statistics.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_ReadStatistic(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD statType, _Out_ DWORD64 *value);

//
// This function enables or disables network bypass mode
// Setting 'forceBypass' to TRUE will disable the soft shell network and cause all network traffic to go through the shell bridge.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_SetNetworkBypass(_In_ FPGA_HANDLE fpgaHandle, _In_ BOOL forceBypass);

//
// Trigger soft reset.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_TriggerSoftReset(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD resetType);

//
// Attempt to set the slot size and number of slots. Will fail if requested settings are invalid or cannot be attained.
// Bytes per slot must be a multiple of 4096. Number of slots cannot be larger than that supported by hardware.
//
_CDLLEXPORT_ FPGA_STATUS FPGA_SetSlotSize(_In_ FPGA_HANDLE *fpgaHandles, _In_ DWORD numHandles, _In_ DWORD bytesPerSlot, _In_ DWORD numSlots);

#undef _CDLLEXPORT_