library verilog;
use verilog.vl_types.all;
entity ISP1362_IF is
    port(
        avs_hc_writedata_iDATA: in     vl_logic_vector(15 downto 0);
        avs_hc_readdata_oDATA: out    vl_logic_vector(15 downto 0);
        avs_hc_address_iADDR: in     vl_logic;
        avs_hc_read_n_iRD_N: in     vl_logic;
        avs_hc_write_n_iWR_N: in     vl_logic;
        avs_hc_chipselect_n_iCS_N: in     vl_logic;
        avs_hc_reset_n_iRST_N: in     vl_logic;
        avs_hc_clk_iCLK : in     vl_logic;
        avs_hc_irq_n_oINT0_N: out    vl_logic;
        avs_dc_writedata_iDATA: in     vl_logic_vector(15 downto 0);
        avs_dc_readdata_oDATA: out    vl_logic_vector(15 downto 0);
        avs_dc_address_iADDR: in     vl_logic;
        avs_dc_read_n_iRD_N: in     vl_logic;
        avs_dc_write_n_iWR_N: in     vl_logic;
        avs_dc_chipselect_n_iCS_N: in     vl_logic;
        avs_dc_reset_n_iRST_N: in     vl_logic;
        avs_dc_clk_iCLK : in     vl_logic;
        avs_dc_irq_n_oINT0_N: out    vl_logic;
        USB_DATA        : inout  vl_logic_vector(15 downto 0);
        USB_ADDR        : out    vl_logic_vector(1 downto 0);
        USB_RD_N        : out    vl_logic;
        USB_WR_N        : out    vl_logic;
        USB_CS_N        : out    vl_logic;
        USB_RST_N       : out    vl_logic;
        USB_INT0        : in     vl_logic;
        USB_INT1        : in     vl_logic
    );
end ISP1362_IF;
