-- Lógica Reconfigurável
-- Dennis Bragagnolo
-- Projeto Final (2020/11/19) - Gerador Simplificado de Sinais

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--library ieee_proposed;
--use ieee_proposed.fixed_pkg.all;

ENTITY wgen IS
	port
	(
		--nn		:  sfixed(0 downto -15) := -0.20;
		rst			: 	IN STD_LOGIC ;
		clk			: 	IN STD_LOGIC ;
		wr_en		:	 IN STD_LOGIC ;
		rd_en		:	 IN STD_LOGIC ;
		wave_type	:	IN STD_LOGIC_VECTOR (1 downto 0);
		data_out	: 	OUT STD_LOGIC_VECTOR (31 downto 0)
	);
END wgen;

ARCHITECTURE a_wgen OF wgen IS 

	--sinal utilizado para "sentido" da onda triangular
	signal rise: STD_LOGIC;
	
BEGIN
	PROCESS (clk, rst)
		VARIABLE wave_value: INTEGER := 0;
		BEGIN
		-- Sinal de reset
		If rst = '1' then 
			data_out <= "00000000000000000000000000000000";
			rise <= '0';
			wave_value:= 0;
		
		-- Processo do clock
		Elsif clk' EVENT AND clk = '1' then
		
			--Escrita do comando e geração da onda
			If wr_en = '1' then
				If wave_type = "01" then -- onda triangular
					If rise = '1' then --subida
						If wave_value < 255 then
							wave_value := wave_value +1;
						Else
							rise <= '0';
							wave_value := wave_value -1;
						End if;
					Else -- descida
						If wave_value > 0 then
							wave_value := wave_value -1;
						Else
							rise <= '1';
							wave_value := wave_value +1;
						End if;
					End if;
				Elsif wave_type = "10" then --onda dente de serra
					If wave_value < 255 then
						wave_value := wave_value +1;
					Else
						wave_value := 0;
					End if;
				Elsif wave_type = "11" then --onda quadrada
					If wave_value < 255 then
						wave_value := 255;
					Else
						wave_value := 0;
					End if;	
				Else
					wave_value := 0;
				End if;
			End if;
					
			-- Leitura do valor da onda
			If rd_en = '1' then
				data_out <= STD_LOGIC_VECTOR (TO_UNSIGNED(wave_value,data_out'length));
			End if;
		End if; 
	END PROCESS;
END a_wgen;
