#pragma once

#include <Windows.h>
#include <cstdio>

#ifdef FPGACOMLIB_COMPILE
#define  _CDLLEXPORT_ extern "C" __declspec(dllexport)
#else
#define _CDLLEXPORT_ extern "C" __declspec(dllimport)
#endif

//
// An opaque handle required for any FPGA API calls.
//
struct FPGA_HANDLE__{ int unused; }; typedef struct FPGA_HANDLE__ *FPGA_HANDLE;

//
// Library major version is bumped on breaking changes to API users.
// Minor version bumps on non-breaking changes such as performance, feature-add, or bug fixes.
//
#define LIB_MAJOR_VERSION 3
#define LIB_MINOR_VERSION 40

#define VERSION_DEFINITIONS_FILE       "FPGAVersionDefinitions.ini"
#define DEFAULT_VERSION_MANIFEST_FILE  "FPGADefaultVersionManifest.ini"

//
// Flag definition for use in FPGA handle creation.
// Unused positions are reserved for future use.
//

#define FPGA_HANDLE_FLAG_NONE           0x0000000u
#define FPGA_HANDLE_FLAG_VERBOSE        0x0000001u
#define FPGA_HANDLE_FLAG_DIAGNOSTICS    0x0000002u
#define FPGA_HANDLE_FLAG_EXCLUSIVE      0x0001000u  // Must be passed to use functions in FPGAManagementLib.h (e.g., flash write, reconfig).
#define FPGA_HANDLE_FLAG_WRITEGOLDEN    0x0002000u  // Must be passed in when updating the golden image.


//
// Error code definitions.
//

typedef DWORD FPGA_STATUS;

#define FPGA_STATUS_SUCCESS                         0
#define FPGA_STATUS_NULL_POINTER_GIVEN              1
#define FPGA_STATUS_MEMORY_NOT_ALLOCATED            2
#define FPGA_STATUS_ILLEGAL_ENDPOINT_NUMBER         3
#define FPGA_STATUS_ERROR_OPENING_DEVICE            4   
#define FPGA_STATUS_ERROR_NULL_DEVICE_HANDLE        5
#define FPGA_STATUS_FAILED_TO_CREATE_MUTEX          6
#define FPGA_STATUS_FAILED_TO_ALLOCATE_ISR          7
#define FPGA_STATUS_FAILED_TO_CREATE_EVENT          8
#define FPGA_STATUS_ERROR_ENABLING_INTERRUPTS       9
#define FPGA_STATUS_INVALID_BUFFER_SIZE             10
#define FPGA_STATUS_INVALID_BUFFER_COUNT            11
#define FPGA_STATUS_INVALID_REGISTER_COUNT          12
#define FPGA_STATUS_INSUFFICIENT_BUFFERS_ALLOCATED  13
#define FPGA_STATUS_HEAP_FREE_FAILED                14
#define FPGA_STATUS_ILLEGAL_SIZE                    15
#define FPGA_STATUS_BAD_SIZE_RETURNED               16
#define FPGA_STATUS_INVALID_RETURNED_SLOT           17
#define FPGA_STATUS_ILLEGAL_BUFFER_NUMBER           18
#define FPGA_STATUS_ILLEGAL_REGISTER_NUMBER         19
#define FPGA_STATUS_INCOMPATIBLE_HARDWARE           20
#define FPGA_STATUS_VERSION_MANIFEST_ERROR          21
#define FPGA_STATUS_UNABLE_TO_ACCESS_SYSDIR         22
#define FPGA_STATUS_UNABLE_TO_READ_DRIVER_VERSION   23
#define FPGA_STATUS_UNDEFINED_VERSION_KEY           24
#define FPGA_STATUS_MEMCPY_ERROR                    25
#define FPGA_STATUS_INCOMPATIBLE_SOFTWARE           26
#define FPGA_STATUS_INCOMPATIBLE_HEADER             27
#define FPGA_STATUS_UNIMPLEMENTED                   28
#define FPGA_STATUS_LOCK_FAILURE                    29
#define FPGA_STATUS_DMA_BUFFER_ERROR                30
#define FPGA_STATUS_WAIT_TIMEOUT                    31
#define FPGA_STATUS_RECONFIG_FAILED                 32
#define FPGA_STATUS_CLOSE_ERROR                     33
#define FPGA_STATUS_DEVICE_CYCLE                    34
#define FPGA_STATUS_POWER_ERROR                     35
#define FPGA_STATUS_WAIT_FAILED                     36
#define FPGA_STATUS_RECONFIG_TO_GOLDEN_FAILED       37
#define FPGA_STATUS_RECONFIG_TO_APPLICATION_FAILED  38
#define FPGA_STATUS_MEMORY_LEAK_DETECTED            39
#define FPGA_STATUS_ERROR_OPENING_FILE              40
#define FPGA_STATUS_FLASH_ERROR                     41
#define FPGA_STATUS_ERROR_OPENING_ROOTPORT          42
#define FPGA_STATUS_ERROR_NULL_ROOTPORT_HANDLE      43
#define FPGA_STATUS_ERROR_CLOSING_ROOTPORT          44
#define FPGA_STATUS_ERROR_GETTING_ROOTPORT_COUNT    45
#define FPGA_STATUS_INVALID_ROOTPORT_OFFSET         46
#define FPGA_STATUS_INVALID_ROOTPORT_INSTANCE       47
#define FPGA_STATUS_ERROR_READING_ROOTPORT          48
#define FPGA_STATUS_ERROR_WRITING_ROOTPORT          49
#define FPGA_STATUS_ROOTPORT_NO_LINK_CTRL_OFFSET    50
#define FPGA_STATUS_ROOTPORT_INSTANCE_NOT_FOUND     51
#define FPGA_STATUS_FAILED_GET_INIT_STATE           52
#define FPGA_STATUS_FAILED_SET_INIT_STATE           53
#define FPGA_STATUS_FAILED_PARENT_WRITE_CFG         54
#define FPGA_STATUS_FAILED_PARENT_READ_CFG          55
#define FPGA_STATUS_FAILED_FPGA_WRITE_CFG           56
#define FPGA_STATUS_FAILED_FPGA_READ_CFG            57
#define FPGA_STATUS_EXPECTED_CAPABILITY_NOT_FOUND   58
#define FPGA_STATUS_FAILED_TO_RETRAIN_LINK          59
#define FPGA_STATUS_MUTEX_ERROR                     60
#define FPGA_STATUS_BAD_HANDLE_COUNT                61
#define FPGA_STATUS_FAILED_WRITE                    62
#define FPGA_STATUS_BAD_ARGUMENT                    63
#define FPGA_STATUS_INVALID_SLOT_CONFIG             64
#define FPGA_STATUS_REQUIRES_ELEVATED_PRIVILEGES    65
#define FPGA_STATUS_DEVICE_DRIVER_FAILED_DISABLE    66
#define FPGA_STATUS_DEVICE_DRIVER_FAILED_ENABLE     67
#define FPGA_STATUS_CANNOT_USE_WITH_DIAGNOSTICS     68
#define FPGA_STATUS_HANDLE_INSUFFICIENT_PERMISSION  69
#define FPGA_STATUS_CANNOT_OPEN_MULTIPLE_HANDLES    70
#define FPGA_STATUS_CANNOT_CLOSE_MULTIPLE_HANDLES   71
#define FPGA_STATUS_ROOTPORT_HANDLE_LOCKED          72
#define FPGA_STATUS_CANNOT_LOCK_ROOTPORT_HANDLE     73
#define FPGA_STATUS_CANNOT_LOCK_ON_NON_PRIMARY_HIP  74
#define FPGA_STATUS_REQUIRES_EXCLUSIVE_HANDLE       75
#define FPGA_STATUS_HARDWARE_NOT_PRESENT            76
#define FPGA_STATUS_UNSUPPORTED_FLASH_SLOT			77
#define FPGA_STATUS_UNRECOGNIZED_CONFIGURATION_FLASH 78
#define FPGA_STATUS_FLASH_MUTEX_TIMEOUT             79
#define FPGA_STATUS_ENUMERATION_MORE_DEVICES        80
#define FPGA_STATUS_ENUMERATION_NO_LIST             81


//avoid using if possible
#define FPGA_STATUS_UNKNOWN_ERROR                   10000


//
// Logging flags
//
#define FPGA_LOG_NONE                               0x00
#define FPGA_LOG_INFO                               0x01
#define FPGA_LOG_DEBUG                              0x02
#define FPGA_LOG_VERBOSE                            0x04
#define FPGA_LOG_ERROR                              0x08
#define FPGA_LOG_FATAL                              0x10
#define FPGA_LOG_WARN                               0x20

#define FPGA_ERROR_LABELS "hr:min:sec:ms,cycles,pid,tid,filename,line,errmsg,"

//
// Default timeout value in seconds for FPGA_WaitOutputBuffer()
//
#define FPGA_WAIT_OUTPUT_BUFFER_TIMEOUT_DEFAULT_SECONDS 10.0

//
// Default timeout value in milliseconds for FPGA_WriteFlashImage(Ex) and FPGA_CaptureFlashImage(Ex).
// 
#define DEFAULT_FLASH_ACCESS_TIMEOUT_IN_MILLISECONDS (5*60*1000)

//
// Most functions in the API below are MULTIPROCESS- and MULTI-THREADED SAFE, with the following exceptions:
//   - FPGA_CreateHandle is multiprocess-safe, but NOT multithreaded-safe.  It should only be called once 
//     per process, per end-point.
//   - FPGA_CloseHandle has the same constraints as FPGA_CreateHandle.
// 
// All functions return an FPGA_STATUS code that should be checked for FPGA_STATUS_SUCCESS by the user.
//

//
// The FPGA_IsDevicePresent can be used to determine if a compatible Catapult device is installed in the system.
// During service rollout, there is a time window in which the service cannot be sure that the FPGA device installer
// has had a chance to run. During that time window, the service should wait and retry to open the FPGA handle
// if and only if a catapult device is present in the system.
//
// pchVerManifestFile:   Defines compatible values for version registers. Leave as NULL to use default "DefaultVersionManifest.ini".
//                       Unless an absolute path is specified, INI files are searched relative to the DLL path.
// The optional last argument allows the user to specify a logging callback function.
// The user-defined function must accept a 'loglevel' argument, which classifies the log entry (e.g., verbose, informational, debug, etc.).
// and an ANSI string, which contains a single log entry.
// The FPGA_LOG_* flags near the top of this header file define all the possible (and non-mutually-exclusive) severity levels.
//
// The default version manifest file passed in must contain a section of the following form:
// 
// [PnP]
// ; [PnP]\CompatibleDeviceIds
// ; -Comma - separated list of device ID strings.
// ; -At least one of these devices must be detected for a driver installation to proceed.
// ;   If none are found, the service exits without taking any installation action.
// CompatibleDeviceIds = PCI\VEN_1414&DEV_B100, PCI\VEN_1414&DEV_B101, PCI\VEN_1172&DEV_E001
//
// Possible result codes: 
//  FPGA_STATUS_SUCCESS                 - Device present
//  FPGA_STATUS_HARDWARE_NOT_PRESENT    - Device not present
//

_CDLLEXPORT_ FPGA_STATUS FPGA_IsDevicePresent(_In_ const char *pchVerManifestFile, _In_ void(*logFunc)(DWORD logflag, const char *pchString));

//
// The FPGA_CreateHandle function instantiates and returns a handle to an FPGA device.
// Since multiple PCIe endpoints can exist on an FPGA, the user can specify a number 
// when referring to a specific PCIe endpoint.  Most typical usage cases
// will never require more than 1 endpoint, so the value should be left as 0 by default.
//
// An additional 'flags' argument permits additional options that are reserved for future use.
//
// The next two arguments define the files that are used to perform version checking of the FPGA bitstream at run-time.
//   pchShellVerDefnsFile: Defines which version registers to verify. Leave as NULL to use default "VersionDefinitions.ini".
//   pchVerManifestFile:   Defines compatible values for version registers. Leave as NULL to use default "DefaultVersionManifest.ini".
//   Unless an absolute path is specified, INI files are searched relative to the DLL path.
//
// The optional last argument allows the user to specify a logging callback function.
// The user-defined function must accept a 'loglevel' argument, which classifies the log entry (e.g., verbose, informational, debug, etc.).
// and an ANSI string, which contains a single log entry.
// The FPGA_LOG_* flags near the top of this header file define all the possible (and non-mutually-exclusive) severity levels.
//
// If the device is disable and the caller has administrative privileges, FPGA_CreateHandle will attempt to enable the device and then open a handle
//

_CDLLEXPORT_ FPGA_STATUS FPGA_CreateHandle(_Out_ FPGA_HANDLE *fpgaHandle, _In_ DWORD endpointNumber, _In_ DWORD flags, _In_ const char *pchVerDefnsFile, _In_ const char *pchVerManifestFile, _In_ void(*logFunc)(DWORD logflag, const char *pchString) = NULL);

// This function allows the library user to query the version of both software and hardware componetns.
// All queryable version keys are defined in the 'pchVerDefnsFile' argument of FPGA_CreateHandle. 
// By default, the definitions are listed in VersionDefinitions.ini.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetVersion(_In_ FPGA_HANDLE fpgaHandle, _In_ const char *pchVerKey, _Out_ DWORD *pVersion);

// This function should be called to release and close an FPGA handle.
_CDLLEXPORT_ FPGA_STATUS FPGA_CloseHandle(_Inout_ FPGA_HANDLE fpgaHandle);

// This function retrieves the total number of available PCIe endpoints on an FPGA.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetNumberEndpoints(_In_ FPGA_HANDLE fpgaHandle, _Out_ DWORD *numEndpoints);

// This function retrieves the total number of PCIe buffers available for host-to-FPGA communication.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetNumberBuffers(_In_ FPGA_HANDLE fpgaHandle, _Out_ DWORD *numBuffers);

// This function retrieves the total number of bytes available to use, per FPGA PCIe buffer.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetBufferSize(_In_ FPGA_HANDLE fpgaHandle, _Out_ DWORD *bufferBytes);

// Returns the last error occurred.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetLastError();

// Overwrites the last error code.
_CDLLEXPORT_ VOID FPGA_SetLastError(FPGA_STATUS error);

// Provides error string for the last error occurred.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetLastErrorText(_Out_ CHAR *pErrorTextBuf, _In_ DWORD cbBufSize);

// Overwrites the last error string.
_CDLLEXPORT_ FPGA_STATUS FPGA_SetLastErrorText(_In_ CHAR *pErrorTextBuf);

//
// This function retrieves a user-mapped pointer to a pinned region of kernel memory that is typically
// written by the host system and read by the FPGA. The available buffer capacity is finite and should
// be queried using "FPGA_GetBufferSize". The total number of buffers available can be queried
// using "FPGA_GetNumberBuffers". 
//
_CDLLEXPORT_ FPGA_STATUS FPGA_GetInputBufferPointer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ PDWORD *inputBufferPtr);

//
// This function retrieves a user-mapped pointer to a pinned region of kernel memory that is typically written
// by the FPGA, and read by the host system. The available buffer capacity is finite and should be
// queried using "FPGA_GetBufferSize". 
//
_CDLLEXPORT_ FPGA_STATUS FPGA_GetOutputBufferPointer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ PDWORD *outputBufferPtr);

//
// This function retrieves a user-mapped pointer to a pinned region of kernel memory that is typically written
// by the FPGA, and read by the host system. The result buffer includes additional metadata associated
// with a message received on the output buffer. Currently, the result buffer will store the total number of
// bytes received from the FPGA. 
// 
_CDLLEXPORT_ FPGA_STATUS FPGA_GetResultBufferPointer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ PDWORD *resultBufferPtr);

// This function allows users to read soft shell registers. This function is thread- and multiprocess-safe; however
// the current implementation of this API uses multiple non-atomic PIOs to the shell protected by a software named global mutex.
_CDLLEXPORT_ FPGA_STATUS FPGA_ReadSoftRegister(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD address, _Out_ DWORD64 *readValue);

// This function allows users to write soft shell registers. The same conditions described in 'FPGA_ReadSoftRegister'
// apply here as well.
_CDLLEXPORT_ FPGA_STATUS FPGA_WriteSoftRegister(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD address, _In_ DWORD64 writeValue);

// This function indicates whether an input buffer is full and unavailable for writing by the host.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetInputBufferFull(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ BOOL *isFull);

// This function indicates whether an output buffer was written by the FPGA, and available for reading by the host.
_CDLLEXPORT_ FPGA_STATUS FPGA_GetOutputBufferDone(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ BOOL *isDone);

//
// This function initiates a send operation that transfers the contents of a specified input buffer to the FPGA.
// This function is non-blocking and returns immediately to the user. The user can specify whether an interrupt 
// should be generated when a message is written to the corresponding output buffer by the FPGA.  
// Note: most applications should enable the use of interrupts, unless polling is absolutely necessary.  
// An interrupt-enabled call to "FPGA_SendInputBuffer" must be paired with an interrupt-enabled call 
// to "FPGA_WaitOutputBuffer". 
// 
// Users are responsible for verifying that the input buffer is available for use prior to calling this function, 
// e.g., by checking the return value of "FPGA_GetInputBufferFull". 
//
_CDLLEXPORT_ FPGA_STATUS FPGA_SendInputBuffer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _In_ DWORD sizeBytes, _In_ BOOL useInterrupt = TRUE);

//
// This function blocks the calling thread until a message is received from the FPGA for a given output buffer. 
// The user must provide storage for the FPGA-generated PCIe header, and must also specify whether an interrupt is
// expected or polling should be used.  If an interrupt is expected, a previous interrupt-enabled call to
// FPGA_SendInputBuffer must have been made to the same corresponding input buffer number. 
// The timeout parameter, when overriden from the default, will cause the calling thread to unblock
// after a specified duration (in seconds). Setting the timeout to zero will result in an INFINITE wait.
//  
// On a timeout, a FPGA_STATUS_WAIT_TIMEOUT is returned. Otherwise,
// the function returns FPGA_STATUS_SUCCESS. 
// 
// pBytesReceived can receive a NULL argument, if the user wishes to discard the total number of bytes received.
// On a successful return, the function returns the total number of bytes received from the FPGA. 
//
_CDLLEXPORT_ FPGA_STATUS FPGA_WaitOutputBuffer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer, _Out_ DWORD *pBytesReceived, _In_ BOOL useInterrupt = TRUE, _In_ double timeoutInSeconds = FPGA_WAIT_OUTPUT_BUFFER_TIMEOUT_DEFAULT_SECONDS);

//
// This function allows a user to discard a particular output buffer after its contents have already
// been consumed and are no longer needed. The user should typically call "FPGA_DiscardOutputBuffer"
// after waiting on an output buffer using "FPGA_WaitOutputBuffer".
//
// It is harmless to call this function even if no data is expected from the FPGA. 
// 
_CDLLEXPORT_ FPGA_STATUS FPGA_DiscardOutputBuffer(_In_ FPGA_HANDLE fpgaHandle, _In_ DWORD whichBuffer);



#undef _CDLLEXPORT_
