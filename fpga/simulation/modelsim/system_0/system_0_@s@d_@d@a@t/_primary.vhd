library verilog;
use verilog.vl_types.all;
entity system_0_SD_DAT is
    port(
        address         : in     vl_logic_vector(1 downto 0);
        chipselect      : in     vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        write_n         : in     vl_logic;
        writedata       : in     vl_logic_vector(31 downto 0);
        bidir_port      : inout  vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0)
    );
end system_0_SD_DAT;
