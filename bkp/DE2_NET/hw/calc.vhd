library ieee;
library ieee_proposed;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;

ENTITY calc IS
PORT (
	clock, reset	: IN STD_LOGIC;
<<<<<<< HEAD
	chipselect		: IN STD_LOGIC;
	regselect		: IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
	write_en		: IN STD_LOGIC;
	read_en			: IN STD_LOGIC;
	writedataint	: IN STD_LOGIC_VECTOR (31 downto 0);
	readdataint		: OUT STD_LOGIC_VECTOR (31 downto 0)
=======
	chipselect	: IN STD_LOGIC;
	regselect	: IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
	write_en	: IN STD_LOGIC;
	read_en		: IN STD_LOGIC;
	writedataint	: IN STD_LOGIC_VECTOR (31 downto 0);
	readdataint	: OUT STD_LOGIC_VECTOR (31 downto 0)
>>>>>>> 9f28da5cb75c548f4e5cd2ff08dd688c063c70ea
 );
END calc;

ARCHITECTURE behavior OF calc IS

COMPONENT reg32_float
PORT(
<<<<<<< HEAD
	clock	: IN STD_LOGIC;
	reset	: IN STD_LOGIC;
	WE		: IN STD_LOGIC;
	D 		: IN sfixed(1 DOWNTO -30);
	Q 		: OUT sfixed(1 DOWNTO -30)
);
=======
	clock, reset : IN STD_LOGIC;
	WE: IN STD_LOGIC;
	D : IN sfixed(1 DOWNTO -30);
	Q : OUT sfixed(1 DOWNTO -30)
	);
>>>>>>> 9f28da5cb75c548f4e5cd2ff08dd688c063c70ea
END COMPONENT;

COMPONENT reg32_clr
PORT(
<<<<<<< HEAD
	clock	: IN STD_LOGIC;
	reset	: IN STD_LOGIC;
	WE		: IN STD_LOGIC;
	D		: IN sfixed(1 DOWNTO -30);
	Q		: OUT sfixed(1 DOWNTO -30)
);
=======
	clock, reset : IN STD_LOGIC;
	WE: IN STD_LOGIC;
	D : IN sfixed(1 DOWNTO -30);
	Q : OUT sfixed(1 DOWNTO -30)
	);
>>>>>>> 9f28da5cb75c548f4e5cd2ff08dd688c063c70ea
END COMPONENT;

	signal writedata : sfixed (1 downto -30);
	signal readdata	: sfixed (1 downto -30);
	signal write_enable_reg_0, write_enable_reg_1, write_enable_reg_2 : std_logic;
	signal r32_o_0, writedata_2 : sfixed(1 DOWNTO -30);
	signal r32_o_1, r32_o_2 : sfixed(1 DOWNTO -30);
	signal mult : sfixed(1 DOWNTO -62);

	BEGIN
<<<<<<< HEAD
		r32_0 : reg32_clr -- Load -> 11, Mult -> 01, Read -> 10
		port map
		(
			clock => clock,
			reset => reset,
			WE => write_enable_reg_0,
			D => writedata,
			Q => r32_o_0
		);
			
		r32_1 : reg32_float-- New Quaternion
		port map
		(
			clock => clock,
			reset => reset,
			WE => write_enable_reg_1,
			D => writedata,
			Q => r32_o_1
		);

		r32_2 : reg32_float -- Acc. Result
		port map
		(
			clock => clock,
			reset => reset,
			WE => write_enable_reg_2,
			D => writedata_2,
			Q => r32_o_2
		);

		process(clock, reset, r32_o_0, readdata, writedataint)
			variable index : integer range -1 to 31;
		begin
		writedata(1) <= '0';
		index := 31;
		while index > -1 loop
			if writedataint(index) = '1' then
				writedata(index-30) <= '1';
			else
				writedata(index-30) <= '0';
			end if;
			index := index - 1;
		end loop;

		write_enable_reg_0 <= write_en and chipselect and (not regselect(1)) and (not regselect(0)); 
		write_enable_reg_1 <= write_en and chipselect and (not regselect(1)) and regselect(0) ;
		write_enable_reg_2 <= r32_o_0(-30);

		if ((r32_o_0(-29) = '1') and (r32_o_0(-30) = '1')) then
			writedata_2 <= r32_o_1;
		elsif ((r32_o_0(-29) = '0') and (r32_o_0(-30) = '1')) then
			writedata_2 <= mult(1 downto -30); --Mult
		end if;

		mult <= r32_o_1 * r32_o_2;

		if ((r32_o_0(-29) = '1') and (r32_o_0(-30) = '0')) then
			readdata <= r32_o_2;
		else
			readdata <= x"ffffffff";
		end if;

=======

		r32_0 : reg32_clr -- Load -> 11, Mult -> 01, Read -> 10
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_0,
				D => writedata,
				Q => r32_o_0
			);
			
		r32_1 : reg32_float-- New Quaternion
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_1,
				D => writedata,
				Q => r32_o_1
			);

			r32_2 : reg32_float -- Acc. Result
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_2,
				D => writedata_2,
				Q => r32_o_2
			);

	process(clock, reset, r32_o_0, readdata, writedataint)
		variable index : integer range -1 to 31;
	begin
		writedata(1) <= '0';
		index := 31;
		while index > -1 loop
			if writedataint(index) = '1' then
				writedata(index-30) <= '1';
			else
				writedata(index-30) <= '0';
			end if;
			index := index - 1;
		end loop;

		write_enable_reg_0 <= write_en and chipselect and (not regselect(1)) and (not regselect(0)); 
		write_enable_reg_1 <= write_en and chipselect and (not regselect(1)) and regselect(0) ;
		write_enable_reg_2 <= r32_o_0(-30);

		if ((r32_o_0(-29) = '1') and (r32_o_0(-30) = '1')) then
			writedata_2 <= r32_o_1;
		elsif ((r32_o_0(-29) = '0') and (r32_o_0(-30) = '1')) then
			writedata_2 <= mult(1 downto -30); --Mult
		end if;

		mult <= r32_o_1 * r32_o_2;

		if ((r32_o_0(-29) = '1') and (r32_o_0(-30) = '0')) then
			readdata <= r32_o_2;
		else
			readdata <= x"ffffffff";
		end if;

>>>>>>> 9f28da5cb75c548f4e5cd2ff08dd688c063c70ea
		index := 31;
		while index > -1 loop
			if readdata(index-30) = '1' then
				readdataint(index) <= '1';
			else
				readdataint(index) <= '0';
			end if;
			index := index - 1;
		end loop;
	end process;
end behavior;