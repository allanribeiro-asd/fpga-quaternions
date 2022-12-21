library verilog;
use verilog.vl_types.all;
entity system_0_tri_state_bridge_0_bridge_0 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        request         : in     vl_logic;
        grant           : out    vl_logic;
        tcs_tri_state_bridge_0_data_in: out    vl_logic_vector(7 downto 0);
        tcs_tri_state_bridge_0_data: in     vl_logic_vector(7 downto 0);
        tcs_tri_state_bridge_0_data_outen: in     vl_logic;
        tri_state_bridge_0_data: inout  vl_logic_vector(7 downto 0);
        tcs_tri_state_bridge_0_readn: in     vl_logic_vector(0 downto 0);
        tri_state_bridge_0_readn: out    vl_logic_vector(0 downto 0);
        tcs_write_n_to_the_cfi_flash_0: in     vl_logic_vector(0 downto 0);
        write_n_to_the_cfi_flash_0: out    vl_logic_vector(0 downto 0);
        tcs_tri_state_bridge_0_address: in     vl_logic_vector(21 downto 0);
        tri_state_bridge_0_address: out    vl_logic_vector(21 downto 0);
        tcs_select_n_to_the_cfi_flash_0: in     vl_logic_vector(0 downto 0);
        select_n_to_the_cfi_flash_0: out    vl_logic_vector(0 downto 0)
    );
end system_0_tri_state_bridge_0_bridge_0;
