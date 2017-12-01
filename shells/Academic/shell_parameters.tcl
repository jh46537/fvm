##################################################
# This file contains all shell parameters and must
# be included in every project. Projects can 
# override the default shell parameters below.
##################################################

source $shell_common/TclScripts/shell_parameters_common.tcl


##################################################
# Referenced by shell*.tcl files
##################################################
set shell_params [dict create]
set shell_params_usereditable [dict create]

####################################################################################
# User Configurable Parameters (override in Project.tcl)
####################################################################################

    ##################################################
    # Quartus
    ##################################################
    dict set shell_params seed_value			    1
    dict set shell_params fpga_user_clock           150
    dict set shell_params_usereditable seed_value               1
    dict set shell_params_usereditable fpga_user_clock          1

    ##################################################
    # DRAM
    ##################################################
    dict set shell_params use_ddr                   0
    dict set shell_params_usereditable use_ddr                  1



    ##################################################
    # SL3
    ##################################################
    dict set shell_params use_sl3               0
    dict set shell_params_usereditable use_sl3                  1
    



########################################################################################################################################################################
########################################################################################################################################################################
# Fixed Parameters:
# Parameters below this point are not intended to be changed by the end user.  They are provided for test builds, etc.
########################################################################################################################################################################
########################################################################################################################################################################
    
    ##################################################
    # DRAM
    ##################################################
    dict set shell_params use_qsys_ddr                      0
    dict set shell_params use_ecc_ddr                       1
    dict set shell_params ddr_use_lutram                    0
    dict set shell_params use_second_dimm                   1

    dict set shell_params_usereditable use_qsys_ddr         $allow_override_of_fixed_parameters
    dict set shell_params_usereditable use_ecc_ddr          $allow_override_of_fixed_parameters
    dict set shell_params_usereditable ddr_use_lutram       $allow_override_of_fixed_parameters
    dict set shell_params_usereditable use_second_dimm      $allow_override_of_fixed_parameters

    ##################################################
    # SL3
    ##################################################
    dict set shell_params sl3_lanes             2
    dict set shell_params_usereditable  sl3_lanes 0

    ##################################################
    # Monitoring
    ##################################################
    dict set shell_params use_perf_monitor      1
    dict set shell_params_usereditable use_perf_monitor      1

    ##################################################
    # PCIe
    ##################################################
    dict set shell_params pcie_use_second_hip       0
    dict set shell_params pcie_use_stream_dma       1
    dict set shell_params pcie_enable_gen3          1
    dict set shell_params pcie_slots_on_streaming   1

    dict set shell_params_usereditable pcie_use_second_hip      $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_use_stream_dma      $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_enable_gen3         $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_slots_on_streaming  $allow_override_of_fixed_parameters


    if {$target_board == "MtGranite"} {
        dict set shell_params pcie_vendor_id_hip0   4466
        dict set shell_params pcie_device_id_hip0   57345
    } else {
    dict set shell_params pcie_vendor_id_hip0               5140
    dict set shell_params pcie_device_id_hip0               45312
    }

    dict set shell_params pcie_high_drive_hip0              1
    dict set shell_params pcie_high_drive_hip1              1
    dict set shell_params pcie_force_median_ctle_hip0       1
    dict set shell_params pcie_force_median_ctle_hip1       1
    dict set shell_params pcie_disable_aeq                  0
    dict set shell_params pcie_use_qsys_design              1
    dict set shell_params pcie_use_ttk_hip0		            1
    dict set shell_params pcie_use_gen2_soft_reset          1

    dict set shell_params pcie_slots_loopback_fifo          0

    dict set shell_params_usereditable pcie_vendor_id_hip0          $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_device_id_hip0          $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_vendor_id_hip1          $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_device_id_hip1          $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_high_drive_hip0         $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_high_drive_hip1         $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_force_median_ctle_hip0  $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_force_median_ctle_hip1  $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_disable_aeq             $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_use_qsys_design         $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_use_ttk_hip0		    $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_use_gen2_soft_reset     $allow_override_of_fixed_parameters
    dict set shell_params_usereditable pcie_slots_loopback_fifo     $allow_override_of_fixed_parameters






