
# (C) 2001-2022 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2022.12.21.19:06:55

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "system_0"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} 

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/13.0sp1/quartus/"
} 

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/system_0_epcs_controller_boot_rom.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib              ./libraries/altera      
vmap       altera       ./libraries/altera      
ensure_lib              ./libraries/lpm         
vmap       lpm          ./libraries/lpm         
ensure_lib              ./libraries/sgate       
vmap       sgate        ./libraries/sgate       
ensure_lib              ./libraries/altera_mf   
vmap       altera_mf    ./libraries/altera_mf   
ensure_lib              ./libraries/altera_lnsim
vmap       altera_lnsim ./libraries/altera_lnsim
ensure_lib              ./libraries/cycloneii   
vmap       cycloneii    ./libraries/cycloneii   
ensure_lib                 ./libraries/SD_CLK         
vmap       SD_CLK          ./libraries/SD_CLK         
ensure_lib                 ./libraries/SD_DAT         
vmap       SD_DAT          ./libraries/SD_DAT         
ensure_lib                 ./libraries/switch_pio     
vmap       switch_pio      ./libraries/switch_pio     
ensure_lib                 ./libraries/button_pio     
vmap       button_pio      ./libraries/button_pio     
ensure_lib                 ./libraries/led_green      
vmap       led_green       ./libraries/led_green      
ensure_lib                 ./libraries/led_red        
vmap       led_red         ./libraries/led_red        
ensure_lib                 ./libraries/lcd_16207_0    
vmap       lcd_16207_0     ./libraries/lcd_16207_0    
ensure_lib                 ./libraries/timer_0        
vmap       timer_0         ./libraries/timer_0        
ensure_lib                 ./libraries/uart_0         
vmap       uart_0          ./libraries/uart_0         
ensure_lib                 ./libraries/jtag_uart_0    
vmap       jtag_uart_0     ./libraries/jtag_uart_0    
ensure_lib                 ./libraries/epcs_controller
vmap       epcs_controller ./libraries/epcs_controller
ensure_lib                 ./libraries/sdram_0        
vmap       sdram_0         ./libraries/sdram_0        

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera      
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm         
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm         
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate       
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate       
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf   
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf   
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_atoms.vhd"              -work cycloneii   
  vcom  "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_components.vhd"         -work cycloneii   
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vcom "$QSYS_SIMDIR/submodules/system_0_SD_CLK.vhd"                                                 -work SD_CLK         
  vcom "$QSYS_SIMDIR/submodules/system_0_SD_DAT.vhd"                                                 -work SD_DAT         
  vcom "$QSYS_SIMDIR/submodules/system_0_switch_pio.vhd"                                             -work switch_pio     
  vcom "$QSYS_SIMDIR/submodules/system_0_button_pio.vhd"                                             -work button_pio     
  vcom "$QSYS_SIMDIR/submodules/system_0_led_green.vhd"                                              -work led_green      
  vcom "$QSYS_SIMDIR/submodules/system_0_led_red.vhd"                                                -work led_red        
  vcom "$QSYS_SIMDIR/submodules/system_0_lcd_16207_0.vhd"                                            -work lcd_16207_0    
  vcom "$QSYS_SIMDIR/submodules/system_0_timer_0.vhd"                                                -work timer_0        
  vcom "$QSYS_SIMDIR/submodules/system_0_uart_0.vhd"                                                 -work uart_0         
  vcom "$QSYS_SIMDIR/submodules/system_0_jtag_uart_0.vhd"                                            -work jtag_uart_0    
  vcom "$QSYS_SIMDIR/submodules/system_0_epcs_controller.vhd"                                        -work epcs_controller
  vcom "$QSYS_SIMDIR/submodules/system_0_sdram_0.vhd"                                                -work sdram_0        
  vcom "$QSYS_SIMDIR/submodules/system_0_sdram_0_test_component.vhd"                                 -work sdram_0        
  vcom "$QSYS_SIMDIR/system_0.vhd"                                                                                        
  vcom "$QSYS_SIMDIR/system_0_width_adapter.vhd"                                                                          
  vcom "$QSYS_SIMDIR/system_0_width_adapter_001.vhd"                                                                      
  vcom "$QSYS_SIMDIR/system_0_width_adapter_002.vhd"                                                                      
  vcom "$QSYS_SIMDIR/system_0_width_adapter_003.vhd"                                                                      
  vcom "$QSYS_SIMDIR/system_0_burst_adapter.vhd"                                                                          
  vcom "$QSYS_SIMDIR/system_0_burst_adapter_001.vhd"                                                                      
  vcom "$QSYS_SIMDIR/system_0_rst_controller.vhd"                                                                         
  vcom "$QSYS_SIMDIR/system_0_rst_controller_002.vhd"                                                                     
  vcom "$QSYS_SIMDIR/system_0_cpu_0_jtag_debug_module_translator_avalon_universal_slave_0_agent.vhd"                      
  vcom "$QSYS_SIMDIR/system_0_sdram_0_s1_translator_avalon_universal_slave_0_agent.vhd"                                   
  vcom "$QSYS_SIMDIR/system_0_cfi_flash_0_uas_translator_avalon_universal_slave_0_agent.vhd"                              
  vcom "$QSYS_SIMDIR/system_0_cpu_0_instruction_master_translator.vhd"                                                    
  vcom "$QSYS_SIMDIR/system_0_cpu_0_data_master_translator.vhd"                                                           
  vcom "$QSYS_SIMDIR/system_0_cpu_0_jtag_debug_module_translator.vhd"                                                     
  vcom "$QSYS_SIMDIR/system_0_sdram_0_s1_translator.vhd"                                                                  
  vcom "$QSYS_SIMDIR/system_0_epcs_controller_epcs_control_port_translator.vhd"                                           
  vcom "$QSYS_SIMDIR/system_0_cfi_flash_0_uas_translator.vhd"                                                             
  vcom "$QSYS_SIMDIR/system_0_sysid_qsys_0_control_slave_translator.vhd"                                                  
  vcom "$QSYS_SIMDIR/system_0_quat_0_avalon_slave_0_translator.vhd"                                                       
  vcom "$QSYS_SIMDIR/system_0_jtag_uart_0_avalon_jtag_slave_translator.vhd"                                               
  vcom "$QSYS_SIMDIR/system_0_uart_0_s1_translator.vhd"                                                                   
  vcom "$QSYS_SIMDIR/system_0_timer_0_s1_translator.vhd"                                                                  
  vcom "$QSYS_SIMDIR/system_0_lcd_16207_0_control_slave_translator.vhd"                                                   
  vcom "$QSYS_SIMDIR/system_0_led_red_s1_translator.vhd"                                                                  
  vcom "$QSYS_SIMDIR/system_0_switch_pio_s1_translator.vhd"                                                               
  vcom "$QSYS_SIMDIR/system_0_isp1362_hc_translator.vhd"                                                                  
  vcom "$QSYS_SIMDIR/system_0_audio_0_avalon_slave_0_translator.vhd"                                                      
  vcom "$QSYS_SIMDIR/system_0_vga_0_avalon_slave_0_translator.vhd"                                                        
  vcom "$QSYS_SIMDIR/system_0_seg7_display_avalon_slave_0_translator.vhd"                                                 
  vcom "$QSYS_SIMDIR/system_0_sram_0_avalon_slave_0_translator.vhd"                                                       
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim +access +r  -t ps -L work -L SD_CLK -L SD_DAT -L switch_pio -L button_pio -L led_green -L led_red -L lcd_16207_0 -L timer_0 -L uart_0 -L jtag_uart_0 -L epcs_controller -L sdram_0 -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -dbg -O2 +access +r -t ps -L work -L SD_CLK -L SD_DAT -L switch_pio -L button_pio -L led_green -L led_red -L lcd_16207_0 -L timer_0 -L uart_0 -L jtag_uart_0 -L epcs_controller -L sdram_0 -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
