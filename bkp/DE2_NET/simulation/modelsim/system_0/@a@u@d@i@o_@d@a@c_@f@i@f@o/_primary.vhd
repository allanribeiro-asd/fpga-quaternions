library verilog;
use verilog.vl_types.all;
entity AUDIO_DAC_FIFO is
    generic(
        REF_CLK         : integer := 18432000;
        SAMPLE_RATE     : integer := 48000;
        DATA_WIDTH      : integer := 16;
        CHANNEL_NUM     : integer := 2
    );
    port(
        iDATA           : in     vl_logic_vector;
        iWR             : in     vl_logic;
        iWR_CLK         : in     vl_logic;
        oDATA           : out    vl_logic_vector;
        oAUD_BCK        : out    vl_logic;
        oAUD_DATA       : out    vl_logic;
        oAUD_LRCK       : out    vl_logic;
        oAUD_XCK        : out    vl_logic;
        iCLK_18_4       : in     vl_logic;
        iRST_N          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REF_CLK : constant is 1;
    attribute mti_svvh_generic_type of SAMPLE_RATE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CHANNEL_NUM : constant is 1;
end AUDIO_DAC_FIFO;
