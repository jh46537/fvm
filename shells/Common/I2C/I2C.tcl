#################################################################
# I2C Slave/Master Interfaces
# 
#################################################################

set_global_assignment -name VERILOG_FILE -library "shell_I2C" $shell_common/I2C/deglitch.v
set_global_assignment -name VERILOG_FILE -library "shell_I2C" $shell_common/I2C/I2C_master_io.v
set_global_assignment -name VERILOG_FILE -library "shell_I2C" $shell_common/I2C/I2C_slave_io.v
