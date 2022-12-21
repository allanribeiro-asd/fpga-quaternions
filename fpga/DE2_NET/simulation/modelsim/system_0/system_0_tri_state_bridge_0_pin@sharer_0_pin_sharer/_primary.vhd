library verilog;
use verilog.vl_types.all;
entity system_0_tri_state_bridge_0_pinSharer_0_pin_sharer is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ack             : out    vl_logic;
        next_grant      : in     vl_logic_vector(0 downto 0);
        arb_cfi_flash_0_tcm: out    vl_logic;
        tcs0_request    : in     vl_logic;
        tcs0_grant      : out    vl_logic;
        tcs0_tcm_address_out: in     vl_logic_vector(21 downto 0);
        tcs0_tcm_read_n_out: in     vl_logic_vector(0 downto 0);
        tcs0_tcm_write_n_out: in     vl_logic_vector(0 downto 0);
        tcs0_tcm_data_in: out    vl_logic_vector(7 downto 0);
        tcs0_tcm_data_out: in     vl_logic_vector(7 downto 0);
        tcs0_tcm_data_outen: in     vl_logic;
        tcs0_tcm_chipselect_n_out: in     vl_logic_vector(0 downto 0);
        request         : out    vl_logic;
        grant           : in     vl_logic;
        tri_state_bridge_0_data_in: in     vl_logic_vector(7 downto 0);
        tri_state_bridge_0_data: out    vl_logic_vector(7 downto 0);
        tri_state_bridge_0_data_outen: out    vl_logic;
        tri_state_bridge_0_readn: out    vl_logic_vector(0 downto 0);
        write_n_to_the_cfi_flash_0: out    vl_logic_vector(0 downto 0);
        tri_state_bridge_0_address: out    vl_logic_vector(21 downto 0);
        select_n_to_the_cfi_flash_0: out    vl_logic_vector(0 downto 0)
    );
end system_0_tri_state_bridge_0_pinSharer_0_pin_sharer;
