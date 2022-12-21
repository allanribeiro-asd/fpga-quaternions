LIBRARY ieee;
library ieee_proposed;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;

ENTITY reg32_float IS
	PORT (
		clock, reset : IN STD_LOGIC;
		WE : IN STD_LOGIC;
		D : IN sfixed (0 downto -31);
		Q : OUT sfixed (0 downto -31) );
END reg32_float;

ARCHITECTURE Behavior OF reg32_float IS

BEGIN
PROCESS(reset, clock, WE)
BEGIN
	IF reset = '1' THEN
		Q <= x"00000000";
	elsif clock'EVENT AND clock = '1' then
		if WE = '1' then
			Q <= D;
		end if;	
	end if;
END PROCESS;
END Behavior;