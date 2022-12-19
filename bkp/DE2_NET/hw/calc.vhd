library ieee;
library ieee_proposed;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;

ENTITY calc IS
PORT ( clock, reset : IN  STD_LOGIC;
	   chipselect 	 : IN  STD_LOGIC;
       regselect     : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);
       write_en      : IN  STD_LOGIC;
       read_en       : IN  STD_LOGIC;
       writedata  	 : IN  sfixed (0 downto -31);
       readdata   	 : OUT sfixed (0 downto -31)
       );
END calc;

ARCHITECTURE behavior OF calc IS

    COMPONENT reg32_float
    PORT    ( 		clock, reset : IN STD_LOGIC;
                    WE  :   IN  STD_LOGIC;
                    D   :   IN  sfixed(0 DOWNTO -31);
                    Q   :   OUT sfixed(0 DOWNTO -31)
            );
    END COMPONENT;
    
    COMPONENT reg32_clr
    PORT    ( 		clock, reset : IN STD_LOGIC;
                    WE  :   IN  STD_LOGIC;
                    D   :   IN  sfixed(0 DOWNTO -31);
                    Q   :   OUT sfixed(0 DOWNTO -31)
            );
    END COMPONENT;
	 
    signal write_enable_reg_0, write_enable_reg_1, write_enable_reg_2 : std_logic;
    signal r32_o_0, r32_o_1, r32_o_2, writedata_2 : sfixed(0 DOWNTO -31);
    signal mult : sfixed(0 DOWNTO -63);
    
	BEGIN
		r32_0 : reg32_clr       -- Load -> 11, Mult -> 01, Read -> 10
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_0,
				D => writedata,
				Q => r32_o_0
			);
			
		r32_1 : reg32_float        -- New Quaternion
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_1,
				D => writedata,
				Q => r32_o_1
			);
            
        r32_2 : reg32_float       -- Acc. Result
			port map
			(
				clock => clock,
				reset => reset,
				WE => write_enable_reg_2,
				D => writedata_2,
				Q => r32_o_2
			);
  
    write_enable_reg_0 <= write_en and chipselect  and (not regselect(1)) and (not regselect(0)); 
    write_enable_reg_1 <= write_en and chipselect  and (not regselect(1)) and      regselect(0) ;
    write_enable_reg_2 <= r32_o_0(-31);
    
    writedata_2 <=  r32_o_1             when ((r32_o_0(-30) = '1') and (r32_o_0(-31) = '1')) else --Load 
                    mult(0 downto -31)  when ((r32_o_0(-30) = '0') and (r32_o_0(-31) = '1')); 		--Mult
    
    mult <= r32_o_1 * r32_o_2;
       
    readdata <= r32_o_2 when ((r32_o_0(-30) = '1') and (r32_o_0(-31) = '0')) else
																			(others => 'Z');

end behavior;