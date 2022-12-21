library verilog;
use verilog.vl_types.all;
entity system_0_epcs_controller_sub is
    port(
        MISO            : in     vl_logic;
        clk             : in     vl_logic;
        data_from_cpu   : in     vl_logic_vector(15 downto 0);
        epcs_select     : in     vl_logic;
        mem_addr        : in     vl_logic_vector(2 downto 0);
        read_n          : in     vl_logic;
        reset_n         : in     vl_logic;
        write_n         : in     vl_logic;
        MOSI            : out    vl_logic;
        SCLK            : out    vl_logic;
        SS_n            : out    vl_logic;
        data_to_cpu     : out    vl_logic_vector(15 downto 0);
        dataavailable   : out    vl_logic;
        endofpacket     : out    vl_logic;
        irq             : out    vl_logic;
        readyfordata    : out    vl_logic
    );
end system_0_epcs_controller_sub;
