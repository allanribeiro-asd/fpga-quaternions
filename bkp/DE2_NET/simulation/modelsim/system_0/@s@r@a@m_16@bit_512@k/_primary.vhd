library verilog;
use verilog.vl_types.all;
entity SRAM_16Bit_512K is
    port(
        oDATA           : out    vl_logic_vector(15 downto 0);
        iDATA           : in     vl_logic_vector(15 downto 0);
        iADDR           : in     vl_logic_vector(17 downto 0);
        iWE_N           : in     vl_logic;
        iOE_N           : in     vl_logic;
        iCE_N           : in     vl_logic;
        iCLK            : in     vl_logic;
        iBE_N           : in     vl_logic_vector(1 downto 0);
        iRST_N          : in     vl_logic;
        SRAM_DQ         : inout  vl_logic_vector(15 downto 0);
        SRAM_ADDR       : out    vl_logic_vector(17 downto 0);
        SRAM_UB_N       : out    vl_logic;
        SRAM_LB_N       : out    vl_logic;
        SRAM_WE_N       : out    vl_logic;
        SRAM_CE_N       : out    vl_logic;
        SRAM_OE_N       : out    vl_logic
    );
end SRAM_16Bit_512K;
