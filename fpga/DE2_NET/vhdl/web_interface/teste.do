
vcom -reportprogress 300 -work work {../../vhdl/reg_32/reg_32.vhd}
vcom -reportprogress 300 -work work {../../vhdl/divisao/divisao.vhd}
vcom -reportprogress 300 -work work {../../vhdl/multiplicacao/multiplicacao.vhd}
vcom -reportprogress 300 -work work {../../vhdl/soma/soma.vhd}
vcom -reportprogress 300 -work work {../../vhdl/subtracao/subtracao.vhd}
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


add wave -hex -position end  sim:/web_interface_tb/DUT/result_divi
add wave -hex -position end  sim:/web_interface_tb/DUT/result_mult
add wave -hex -position end  sim:/web_interface_tb/DUT/result_soma
add wave -hex -position end  sim:/web_interface_tb/DUT/result_subt


run 164000000ps
WaveRestoreZoom {0 ns} {250 ns}