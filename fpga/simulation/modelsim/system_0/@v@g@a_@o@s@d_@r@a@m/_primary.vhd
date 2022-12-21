library verilog;
use verilog.vl_types.all;
entity VGA_OSD_RAM is
    port(
        oRed            : out    vl_logic_vector(9 downto 0);
        oGreen          : out    vl_logic_vector(9 downto 0);
        oBlue           : out    vl_logic_vector(9 downto 0);
        iVGA_ADDR       : in     vl_logic_vector(18 downto 0);
        iVGA_CLK        : in     vl_logic;
        iWR_DATA        : in     vl_logic;
        iWR_ADDR        : in     vl_logic_vector(18 downto 0);
        iWR_EN          : in     vl_logic;
        iWR_CLK         : in     vl_logic;
        iON_R           : in     vl_logic_vector(9 downto 0);
        iON_G           : in     vl_logic_vector(9 downto 0);
        iON_B           : in     vl_logic_vector(9 downto 0);
        iOFF_R          : in     vl_logic_vector(9 downto 0);
        iOFF_G          : in     vl_logic_vector(9 downto 0);
        iOFF_B          : in     vl_logic_vector(9 downto 0);
        iRST_N          : in     vl_logic
    );
end VGA_OSD_RAM;
