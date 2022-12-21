library verilog;
use verilog.vl_types.all;
entity Reset_Delay is
    port(
        iRST            : in     vl_logic;
        iCLK            : in     vl_logic;
        oRESET          : out    vl_logic
    );
end Reset_Delay;
