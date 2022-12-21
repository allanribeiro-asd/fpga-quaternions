library verilog;
use verilog.vl_types.all;
entity DM9000A_IF is
    port(
        iDATA           : in     vl_logic_vector(15 downto 0);
        oDATA           : out    vl_logic_vector(15 downto 0);
        iCMD            : in     vl_logic;
        iRD_N           : in     vl_logic;
        iWR_N           : in     vl_logic;
        iCS_N           : in     vl_logic;
        iRST_N          : in     vl_logic;
        iCLK            : in     vl_logic;
        iOSC_50         : in     vl_logic;
        oINT            : out    vl_logic;
        ENET_DATA       : inout  vl_logic_vector(15 downto 0);
        ENET_CMD        : out    vl_logic;
        ENET_RD_N       : out    vl_logic;
        ENET_WR_N       : out    vl_logic;
        ENET_CS_N       : out    vl_logic;
        ENET_RST_N      : out    vl_logic;
        ENET_INT        : in     vl_logic;
        ENET_CLK        : out    vl_logic
    );
end DM9000A_IF;
