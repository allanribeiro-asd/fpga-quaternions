vcom -reportprogress 300 -work work {../../vhd/reg_32/reg_32.vhd}
vcom -reportprogress 300 -work work {../../vhd/reg_32/reg_32_tb.vhd}
vsim rtl_work.reg_32_tb
add wave -position end  sim:/reg_32_tb/clock
add wave -position end  sim:/reg_32_tb/wren
add wave -position end  sim:/reg_32_tb/reset
add wave -position end  sim:/reg_32_tb/add
add wave -hexadecimal -position end  sim:/reg_32_tb/data_in
add wave -hexadecimal -position end  sim:/reg_32_tb/data_out
run 31400ns
WaveRestoreZoom {0 ns} {800 ns}