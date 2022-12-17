LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY reg32_av IS
PORT ( clock, resetn	: IN STD_LOGIC;
	   chipselect		: IN STD_LOGIC;
	   writedata		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       write_en			: IN STD_LOGIC;
       readdata			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
   	   add				: IN STD_LOGIC;
       read_en      	: IN STD_LOGIC );
END reg32_av;

ARCHITECTURE Structure OF reg32_av IS
	COMPONENT reg32
		PORT
		(
			clock, resetn : IN STD_LOGIC;
			WE : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT wgen IS
		port
		(
			rst			: 	IN STD_LOGIC ;
			clk			: 	IN STD_LOGIC ;
			wr_en		:	IN STD_LOGIC ;
			rd_en		:	IN STD_LOGIC ;
			wave_type	:	IN STD_LOGIC_VECTOR (1 downto 0);
			data_out	: 	OUT STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	signal write_enable0, write_enable1 : std_logic;
	signal read_enable0, read_enable1, read_enable_cnt, reg_n_cont, read_always: std_logic;
	signal reg32_0, reg32_1, SAIDA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal write_enable0_delayed, write_enable1_delayed : std_logic;
	signal write_enable0_total, write_enable1_total : std_logic;
	signal resetn_n : std_logic;

	BEGIN
	resetn_n <= not resetn;

	write_enable0 <= write_en and chipselect  and (not add);
	write_enable1 <= write_en and chipselect  and      add ;
	
	write_enable0_total <= write_enable0 or write_enable0_delayed;
	write_enable1_total <= write_enable1 or write_enable1_delayed;
	
	delay_write: process(clock, resetn) begin
		if clock'EVENT AND clock = '1' then
				write_enable0_delayed <= write_enable0;
				write_enable1_delayed <= write_enable1;
		end if;
	END PROCESS;
		

	reg32_def0 : reg32
		port map (
			clock 	=> clock,
			resetn 	=> resetn_n,
			WE      => write_enable0,
			D 		=> writedata,
			Q 		=> reg32_0   --readdata_internal
	);

	reg32_def1 : reg32
		port map (
			clock 	=> clock,
			resetn 	=> resetn_n,
			WE      => write_enable0,
			D 		=> SAIDA,
			Q 		=> reg32_1   --readdata_internal
	);

	wgen_0 : wgen
		port MAP
		(
			rst			=> 	resetn_n,
			clk			=> 	clock,
			wr_en		=>	write_enable0,
			rd_en		=>	read_always,
			wave_type	=>	reg32_0 (1 downto 0),
			data_out	=> 	SAIDA
	);


	reg_n_cont		<=   '0';
	read_enable0    <= read_en and chipselect and (not add) and (not reg_n_cont);
	read_enable1    <= read_en and chipselect and add  and (not reg_n_cont);
	read_enable_cnt <= read_en and chipselect and reg_n_cont ;

	read_always <= '1';

	readdata <= 	SAIDA;
	--readdata <= 	SAIDA when read_enable0		= '1' 	else 
	--				reg32_0 when read_enable1	= '1' 	else
	--				(others => 'Z');


END Structure;
