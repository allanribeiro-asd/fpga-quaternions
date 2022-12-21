library verilog;
use verilog.vl_types.all;
entity VGA_NIOS_CTRL is
    generic(
        RAM_SIZE        : vl_logic_vector(0 to 18) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        iDATA           : in     vl_logic_vector(15 downto 0);
        oDATA           : out    vl_logic_vector(15 downto 0);
        iADDR           : in     vl_logic_vector(18 downto 0);
        iWR             : in     vl_logic;
        iRD             : in     vl_logic;
        iCS             : in     vl_logic;
        iRST_N          : in     vl_logic;
        iCLK            : in     vl_logic;
        VGA_R           : out    vl_logic_vector(9 downto 0);
        VGA_G           : out    vl_logic_vector(9 downto 0);
        VGA_B           : out    vl_logic_vector(9 downto 0);
        VGA_HS          : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_SYNC        : out    vl_logic;
        VGA_BLANK       : out    vl_logic;
        VGA_CLK         : out    vl_logic;
        iCLK_25         : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RAM_SIZE : constant is 1;
end VGA_NIOS_CTRL;
