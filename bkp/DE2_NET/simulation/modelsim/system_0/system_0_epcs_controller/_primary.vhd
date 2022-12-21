library verilog;
use verilog.vl_types.all;
entity system_0_epcs_controller is
    generic(
        INIT_FILE       : string  := "system_0_epcs_controller_boot_rom.hex"
    );
    port(
        address         : in     vl_logic_vector(8 downto 0);
        chipselect      : in     vl_logic;
        clk             : in     vl_logic;
        read_n          : in     vl_logic;
        reset_n         : in     vl_logic;
        write_n         : in     vl_logic;
        writedata       : in     vl_logic_vector(31 downto 0);
        dataavailable   : out    vl_logic;
        endofpacket     : out    vl_logic;
        irq             : out    vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0);
        readyfordata    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
end system_0_epcs_controller;
