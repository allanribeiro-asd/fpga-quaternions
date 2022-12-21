library verilog;
use verilog.vl_types.all;
entity system_0_tri_state_bridge_0_pinSharer_0_arbiter is
    port(
        sink0_valid     : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        next_grant      : out    vl_logic_vector(0 downto 0);
        ack             : in     vl_logic
    );
end system_0_tri_state_bridge_0_pinSharer_0_arbiter;
