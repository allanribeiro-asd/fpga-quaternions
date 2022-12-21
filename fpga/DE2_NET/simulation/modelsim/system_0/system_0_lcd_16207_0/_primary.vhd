library verilog;
use verilog.vl_types.all;
entity system_0_lcd_16207_0 is
    port(
        address         : in     vl_logic_vector(1 downto 0);
        begintransfer   : in     vl_logic;
        clk             : in     vl_logic;
        read            : in     vl_logic;
        reset_n         : in     vl_logic;
        write           : in     vl_logic;
        writedata       : in     vl_logic_vector(7 downto 0);
        LCD_E           : out    vl_logic;
        LCD_RS          : out    vl_logic;
        LCD_RW          : out    vl_logic;
        LCD_data        : inout  vl_logic_vector(7 downto 0);
        readdata        : out    vl_logic_vector(7 downto 0)
    );
end system_0_lcd_16207_0;
