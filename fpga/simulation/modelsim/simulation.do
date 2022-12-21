
vcom -reportprogress 300 -work work {../../vhdl/reg_32/reg_32.vhd}

vcom -reportprogress 300 -work work {../../fpu/fpupack.vhd}
vcom -reportprogress 300 -work work {../../fpu/pre_norm_addsub.vhd}
vcom -reportprogress 300 -work work {../../fpu/addsub_28.vhd}
vcom -reportprogress 300 -work work {../../fpu/post_norm_addsub.vhd}
vcom -reportprogress 300 -work work {../../fpu/pre_norm_mul.vhd}
vcom -reportprogress 300 -work work {../../fpu/mul_24.vhd}
vcom -reportprogress 300 -work work {../../fpu/serial_mul.vhd}
vcom -reportprogress 300 -work work {../../fpu/post_norm_mul.vhd}
vcom -reportprogress 300 -work work {../../fpu/pre_norm_div.vhd}
vcom -reportprogress 300 -work work {../../fpu/serial_div.vhd}
vcom -reportprogress 300 -work work {../../fpu/post_norm_div.vhd}
vcom -reportprogress 300 -work work {../../fpu/pre_norm_sqrt.vhd}
vcom -reportprogress 300 -work work {../../fpu/sqrt.vhd}
vcom -reportprogress 300 -work work {../../fpu/post_norm_sqrt.vhd}
vcom -reportprogress 300 -work work {../../fpu/comppack.vhd}
vcom -reportprogress 300 -work work {../../fpu/fpu.vhd}

vcom -reportprogress 300 -work work {../../vhdl/web_interface/web_interface.vhd}
vcom -reportprogress 300 -work work {../../vhdl/web_interface/web_interface_tb.vhd}
vsim rtl_work.web_interface_tb

add wave -position end  sim:/web_interface_tb/DUT/CLK
add wave -position end  sim:/web_interface_tb/DUT/RST
add wave -position end  sim:/web_interface_tb/DUT/CS
add wave -position end  sim:/web_interface_tb/DUT/READ_EN
add wave -position end  sim:/web_interface_tb/DUT/WRITE_EN
add wave -hex -position end  sim:/web_interface_tb/DUT/ADD
add wave -hex -position end  sim:/web_interface_tb/DUT/WRITEDATA
add wave -hex -position end  sim:/web_interface_tb/DUT/READDATA
add wave -hex -position end  sim:/web_interface_tb/DUT/value_1
add wave -hex -position end  sim:/web_interface_tb/DUT/value_2
add wave -hex -position end  sim:/web_interface_tb/DUT/operation

add wave -hex -position end  sim:/web_interface_tb/DUT/VAL1/DATA_IN
add wave -hex -position end  sim:/web_interface_tb/DUT/VAL1/DATA_OUT
add wave -position end  sim:/web_interface_tb/DUT/VAL1/WRITE_EN

add wave -hex -position end  sim:/web_interface_tb/DUT/VAL2/DATA_IN
add wave -hex -position end  sim:/web_interface_tb/DUT/VAL2/DATA_OUT
add wave -position end  sim:/web_interface_tb/DUT/VAL2/WRITE_EN

add wave -hex -position end  sim:/web_interface_tb/DUT/OPER/DATA_IN
add wave -hex -position end  sim:/web_interface_tb/DUT/OPER/DATA_OUT
add wave -position end  sim:/web_interface_tb/DUT/OPER/WRITE_EN

add wave -hex -position end  sim:/web_interface_tb/DUT/FPU_EXT/opa_i
add wave -hex -position end  sim:/web_interface_tb/DUT/FPU_EXT/opb_i
add wave -hex -position end  sim:/web_interface_tb/DUT/FPU_EXT/fpu_op_i
add wave -position end  sim:/web_interface_tb/DUT/FPU_EXT/output_o

run 1640000ps
WaveRestoreZoom {0 ns} {250 ns}