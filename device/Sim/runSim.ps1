
$ErrorActionPreference = "Stop"

# Clean build files
Remove-Item Source.dll -ErrorAction Ignore
Remove-Item Source.obj -ErrorAction Ignore

Remove-Item FPGA_PCIeJobDispatcher.obj -ErrorAction Ignore
Remove-Item FPGACoreLib_CoSim.obj -ErrorAction Ignore
Remove-Item harness.obj -ErrorAction Ignore

Remove-Item work -Recurse -ErrorAction Ignore
Remove-Item lpm -Recurse -ErrorAction Ignore
Remove-Item altera_mf_ver -Recurse -ErrorAction Ignore

# Set parameters
$env:CATAPULT_COSIM_ARGS = "fvm"
echo "`nCatapult Academic Co-Simulation Framework`n`n"
echo "Executing: $env:CATAPULT_COSIM_ARGS`n`n"

# Call shared simulation build and run scripts
Invoke-Expression ".\buildSim.ps1"

