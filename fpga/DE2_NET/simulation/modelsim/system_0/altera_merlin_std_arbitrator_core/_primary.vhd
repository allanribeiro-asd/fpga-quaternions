library verilog;
use verilog.vl_types.all;
entity altera_merlin_std_arbitrator_core is
    generic(
        NUM_REQUESTERS  : integer := 8;
        SCHEME          : string  := "round-robin"
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        request         : in     vl_logic_vector;
        next_grant      : out    vl_logic_vector;
        ack             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUM_REQUESTERS : constant is 1;
    attribute mti_svvh_generic_type of SCHEME : constant is 1;
end altera_merlin_std_arbitrator_core;
