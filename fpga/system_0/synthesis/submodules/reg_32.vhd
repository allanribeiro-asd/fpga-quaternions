Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity reg_32 is
	PORT(	CLK:				IN STD_LOGIC;
			RST:				IN STD_LOGIC;
			WRITE_EN:		IN STD_LOGIC;
			DATA_IN:			IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			DATA_OUT:		OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end entity;

Architecture a_reg_32 of reg_32 is
Begin
	Process (CLK, RST)
		Begin
		If RST = '0' then
				DATA_OUT <= x"00000000";
		Elsif CLK' event and CLK = '1' then
			If WRITE_EN = '1' then
				DATA_OUT <= DATA_IN;
			End If;
		End If;
	End process;
End architecture;
