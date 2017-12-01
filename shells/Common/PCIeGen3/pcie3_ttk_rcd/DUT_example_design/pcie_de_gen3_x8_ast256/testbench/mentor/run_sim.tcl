if [ file exists libraries ] {
  ## Remove existing libraries for a clean compile
  puts "Removing old libraries"
  file delete -force libraries
}

## Need to set QUARTUS_INSTALL_DIR for the correct path on Linux
set QUARTUS_INSTALL_DIR /cad/tools/altera/15.0/quartus

## Set ELAB_OPTIONS to preserve signals
set ELAB_OPTIONS "-voptargs=+acc -vopt_verbose -debugdb "

## calling in the Altera setup file
source msim_setup.tcl
ld
