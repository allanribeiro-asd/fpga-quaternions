library verilog;
use verilog.vl_types.all;
entity altera_tristate_controller_translator is
    generic(
        UAV_DATA_W      : integer := 32;
        UAV_BYTEENABLE_W: integer := 4;
        UAV_ADDRESS_W   : integer := 32;
        UAV_BURSTCOUNT_W: integer := 4;
        TURNAROUND_TIME_CYCLES: integer := 0;
        READLATENCY_CYCLES: integer := 0;
        ZERO_READ_DELAY : integer := 0;
        ZERO_WRITE_DELAY: integer := 0
    );
    port(
        s0_uav_address  : in     vl_logic_vector;
        s0_uav_burstcount: in     vl_logic_vector;
        s0_uav_read     : in     vl_logic;
        s0_uav_write    : in     vl_logic;
        s0_uav_waitrequest: out    vl_logic;
        s0_uav_readdatavalid: out    vl_logic;
        s0_uav_byteenable: in     vl_logic_vector;
        s0_uav_readdata : out    vl_logic_vector;
        s0_uav_writedata: in     vl_logic_vector;
        s0_uav_lock     : in     vl_logic;
        s0_uav_debugaccess: in     vl_logic;
        m0_uav_address  : out    vl_logic_vector;
        m0_uav_burstcount: out    vl_logic_vector;
        m0_uav_read     : out    vl_logic;
        m0_uav_write    : out    vl_logic;
        m0_uav_waitrequest: in     vl_logic;
        m0_uav_readdatavalid: in     vl_logic;
        m0_uav_byteenable: out    vl_logic_vector;
        m0_uav_readdata : in     vl_logic_vector;
        m0_uav_writedata: out    vl_logic_vector;
        m0_uav_lock     : out    vl_logic;
        m0_uav_debugaccess: out    vl_logic;
        c0_request      : out    vl_logic;
        c0_grant        : in     vl_logic;
        c0_uav_write    : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of UAV_DATA_W : constant is 1;
    attribute mti_svvh_generic_type of UAV_BYTEENABLE_W : constant is 1;
    attribute mti_svvh_generic_type of UAV_ADDRESS_W : constant is 1;
    attribute mti_svvh_generic_type of UAV_BURSTCOUNT_W : constant is 1;
    attribute mti_svvh_generic_type of TURNAROUND_TIME_CYCLES : constant is 1;
    attribute mti_svvh_generic_type of READLATENCY_CYCLES : constant is 1;
    attribute mti_svvh_generic_type of ZERO_READ_DELAY : constant is 1;
    attribute mti_svvh_generic_type of ZERO_WRITE_DELAY : constant is 1;
end altera_tristate_controller_translator;
