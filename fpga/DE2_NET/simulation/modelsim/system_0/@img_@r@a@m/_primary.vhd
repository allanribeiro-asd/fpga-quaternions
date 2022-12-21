library verilog;
use verilog.vl_types.all;
entity Img_RAM is
    port(
        data            : in     vl_logic_vector(0 downto 0);
        wren            : in     vl_logic;
        wraddress       : in     vl_logic_vector(18 downto 0);
        rdaddress       : in     vl_logic_vector(15 downto 0);
        wrclock         : in     vl_logic;
        rdclock         : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end Img_RAM;
