library verilog;
use verilog.vl_types.all;
entity system_0_irq_mapper is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        receiver0_irq   : in     vl_logic;
        receiver1_irq   : in     vl_logic;
        receiver2_irq   : in     vl_logic;
        receiver3_irq   : in     vl_logic;
        receiver4_irq   : in     vl_logic;
        receiver5_irq   : in     vl_logic;
        receiver6_irq   : in     vl_logic;
        receiver7_irq   : in     vl_logic;
        receiver8_irq   : in     vl_logic;
        sender_irq      : out    vl_logic_vector(31 downto 0)
    );
end system_0_irq_mapper;
