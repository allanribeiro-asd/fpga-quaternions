echo on
ghdl --clean
ghdl --remove

ghdl -a reg32.vhd
ghdl -e reg32

ghdl -a wgen.vhd
ghdl -e wgen

ghdl -a reg32_av.vhd
ghdl -e reg32_av

ghdl -r reg32_av--wave=reg32_av.ghw --stop-time=6000ms
pause
start cmd /c gtkwave -f reg32_av.ghw -a wave=reg32_av.gtkw