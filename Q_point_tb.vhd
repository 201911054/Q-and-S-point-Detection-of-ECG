LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE STD.TEXTIO.ALL;
 
ENTITY Q_point_tb IS
END Q_point_tb;
 
ARCHITECTURE behavior OF Q_point_tb IS 
 
    COMPONENT Q_detection
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         clk : IN  std_logic;
         Rloc1 : IN  std_logic_vector(11 downto 0);
         value : IN  std_logic_vector(11 downto 0);
         sample : IN  std_logic_vector(11 downto 0);
         amp_q : OUT  std_logic_vector(11 downto 0);
         loc_q : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
   
   signal S : std_logic := '1';
   signal R : std_logic := '1';
   signal clk : std_logic := '0';
   signal Rloc1 : std_logic_vector(11 downto 0) := (others => '0');
   signal value : std_logic_vector(11 downto 0) := (others => '0');
   signal sample : std_logic_vector(11 downto 0) := (others => '0');

 	signal amp_q : std_logic_vector(11 downto 0);
   signal loc_q : std_logic_vector(11 downto 0);
	signal output_ready     :      std_logic:='0';   
   
	file data1: TEXT open READ_MODE is "ECG_original123.txt";
	file data2: TEXT open READ_MODE is "ECG_samples.txt";
	file out1: TEXT open WRITE_MODE is "Qout_ECG_original123.txt";
	file out2: TEXT open WRITE_MODE is "Qout_ECG_samples1123.txt";
	constant clk_period : time := 10 ns;
	
BEGIN
 
   uut: Q_detection PORT MAP (
          S => S,
          R => R,
          clk => clk,
          Rloc1 => Rloc1,
          value => value,
          sample => sample,
          amp_q => amp_q,
          loc_q => loc_q
        );

S    <= 	'1',
				'1' after 6 ns, '0' after 8 ns, 
				'1' after 18 ns, '0' after 4000 ns, 
				'1' after 4008 ns,'0' after 7000 ns, 
				'1' after 7008 ns,'0' after 9000 ns, 
				'1' after 9008 ns,'0' after 11000 ns, 
				'1' after 11008 ns,'0' after 14000 ns, 
				'1' after 14008 ns,'0' after 16000 ns, 
				'1' after 16008 ns,'0' after 19000 ns, 
				'1' after 19008 ns,'0' after 22000 ns, 
				'1' after 22008 ns;
				--'1' after 18008 ns,'0' after 20000 ns, 
				--'1' after 20008 ns,'0' after 22000 ns, 
				--'1' after 22008 ns;
				
	Rloc1<= 	"000001100000", 
				"000110101011" after 4000 ns ,
				"001011101000" after 7000 ns ,
				"001111110011" after 9000 ns ,
				"010011110000" after 11000 ns ,
				"010111110000" after 14000 ns ,
				"011011101000" after 16000 ns ,
				"011111101001" after 19000 ns ,
				"100101001100" after 22000 ns ;

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	process(clk)
	variable dataline1 : LINE;
	variable dataline2 : LINE;
	variable input1: integer;
	variable input2: integer;
   begin	
				if R = '0' then
						value <= (others => '0');
						sample <= (others => '0');
						output_ready <= '0'; 
				elsif rising_edge(clk) then
					readline(data1,dataline1);
					read(dataline1,input1);
						value <= std_logic_vector(to_signed(input1,12));
					readline(data2,dataline2);
					read(dataline2,input2);
						sample <= std_logic_vector(to_signed(input2,12));
						output_ready <= '1'; 
				end if;
   end process;
	
	process(clk)  
           variable out_line1 : LINE;  
			  variable out_line2 : LINE; 			  
           variable input1: integer;  
           begin  
                if (falling_edge(clk) and (Rloc1 = sample)) then  
                     if output_ready ='1' then  
                          write(out_line1, to_integer(unsigned(amp_q)));  
                          writeline(out1,out_line1);  
								  write(out_line2, to_integer(unsigned(loc_q)));  
                          writeline(out2,out_line2);  
                     end if;  
                end if;  
           end process;
END;
