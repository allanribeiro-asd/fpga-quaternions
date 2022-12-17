library ieee;
library ieee_proposed;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;
entity testbench is
end entity;

architecture behavior of testbench is
	signal clock, reset, wen, ren, cs : std_logic;
	signal q, qout0, qout1, d : sfixed (0 downto -15);
	signal regselect : std_logic;

	begin
	component reg32 IS:
		PORT (
			clock, reset, wen0, wen1 : IN STD_LOGIC;
			d : IN sfixed(0 DOWNTO -15);
			q : OUT sfixed(0 DOWNTO -31);
	END component;

	begin
		q0 : reg32
			port map
			(
				clock => clock,
				reset => reset,
				wen => wen0,
				d => d,
				q => qout0

			)
		q1 : reg32
			port map
			(
				clock => clock,
				reset => reset,
				wen => wen1,
				d => d,
				q => qout1
			);

		rst_proc: process 
			begin
				ren <= '0';
				reset <= '1';
				wait for 20 ns;
				reset <= '0';

				regselect <= '0';
				cs <= '1';
				d <= '0.1'
				wen <= '1'
				clock <= '1';
				wait for 10 ns;
				clock <= '0';
				wait for 10 ns;

				regselect <= '1';
				clock <= '1';
				wait for 10 ns;
				clock <= '0';
				wait for 10 ns;
				ren <= '1';
				wait;

		end process;

		clk_proc: process 
		begin
				clock <= '0';
				wait for 10 ns;
				clock <= '1';
				wait for 10 ns;
		end process;

		wen0 <= (regselect = '0') and wen and cs;

		-- do something with r0

		wen1 <= (regselect = '1') and wen and cs;
		-- do something with r0

		q <= qout0 * qout1 when ren = '1';

end architecture