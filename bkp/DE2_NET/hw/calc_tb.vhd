library ieee;
library ieee_proposed;
use ieee.std_logic_1164.all;
use ieee_proposed.fixed_pkg.all;

Entity calc_tb is
end entity;

Architecture behavior of calc_tb is

    component calc is    
    PORT ( clock, reset : IN  STD_LOGIC;
	   chipselect 	 : IN  STD_LOGIC;
       regselect     : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);
       write_en      : IN  STD_LOGIC;
       read_en       : IN  STD_LOGIC;
       writedataint  	 : IN  STD_LOGIC_VECTOR (31 downto 0);
       readdataint   	 : OUT STD_LOGIC_VECTOR (31 downto 0)
       );
    END component;
    
    signal reset, clock, cs, writeen, readen : std_logic;
    signal regsel : std_logic_vector(1 downto 0);
    signal data_in, data_out : STD_LOGIC_VECTOR (31 downto 0);
    
    begin
    
    gera_rst:process 
    begin 
        reset <= '1';
        wait for 15 ns;
        reset <= '0';
        cs <= '1';
        wait;
    end process;
    
    gera_clk:process 
    begin 
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
    
    DUT:calc
    port map
	   (clock      => clock,
  	    reset      => reset,
        chipselect => cs,
        regselect  => regsel,
        write_en   => writeen, 
        read_en    => readen,         
        writedataint  => data_in, 
        readdataint   => data_out     
		  );
    
    teste:process 
    begin
        wait for 30 ns;
        data_in <= "00100000000000000000000000000000"; -- 0.5
        regsel <= "01";
        writeen <= '1';
        wait for 100 ns;
        writeen <= '0';
        wait for 10 ns;
        data_in <= "00000000000000000000000000000011"; -- Load
        regsel <= "00";
        writeen <= '1';
        wait for 100 ns;
        writeen <= '0';
        wait for 10 ns;
        data_in <= "00000000000000000000000000000001"; -- Mult
        regsel <= "00";
        writeen <= '1';
        wait for 33 ns;
        writeen <= '0';
        wait for 10 ns;
        data_in <= "00000000000000000000000000000010"; -- Read
        regsel <= "00";
        writeen <= '1';
	wait for 20 ns;
        writeen <= '0';
        wait for 100 ns;
        readen <= '1';
		wait;
    end process;
End architecture;