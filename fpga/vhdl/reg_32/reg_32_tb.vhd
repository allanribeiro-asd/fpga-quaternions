Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity reg_32_tb is
end entity;

Architecture a_reg_32_tb of reg_32_tb is
	component reg_32 is
	PORT(	CLK:				IN STD_LOGIC;
			RST:				IN STD_LOGIC;
			WRITE_EN:		IN STD_LOGIC;
			ADD:				IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			ADD_SET:			IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			DATA_IN:			IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			DATA_OUT:		OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;

signal clock, wren, reset: std_logic;
signal add: std_logic_vector(1 downto 0);
signal data_in, data_out: std_logic_vector(31 downto 0);
Begin
	DUT: reg_32 port map(	CLK		=> clock,
									RST		=> reset,
									WRITE_EN		=> wren,
									ADD		=> add,
									ADD_SET	=> "00",
									DATA_IN	=> data_in,
									DATA_OUT	=> data_out);
	
	process
		begin
			wren <= '0';
			data_in <= x"000000f0";
			add <= "00";
			wait for 30 ns;
			data_in <= x"000000f1";
			add <= "01";
			wait for 30 ns;
			data_in <= x"000000f2";
			add <= "10";
			wait for 30 ns;
			data_in <= x"000000f3";
			add <= "11";
			wait for 30 ns;
			
			
			wren <= '1';
			data_in <= x"000000f4";
			add <= "00";
			wait for 30 ns;
			data_in <= x"000000f5";
			add <= "01";
			wait for 30 ns;
			data_in <= x"000000f6";
			add <= "10";
			wait for 30 ns;
			data_in <= x"000000f7";
			add <= "11";
			wait for 30 ns;
			data_in <= x"ffffffff";
			add <= "00";
			
			
			wait;
	end process;
	
	process
		begin
			clock <= '0';
			wait for 15 ns;
			clock <= '1';
			wait for 15 ns;
	end process;
	
	process
		begin
			reset <= '1';
			wait for 20 ns;
			reset <= '0';
			wait;
	end process;
End architecture;
