library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity minimum is
port(    
			S : IN  std_logic;
         R : IN  std_logic;
         clk : IN  std_logic;
         Rloc1 : IN  std_logic_vector(11 downto 0);
         value : IN  std_logic_vector(11 downto 0);
         sample : IN  std_logic_vector(11 downto 0);
         amp_q2 : OUT  std_logic_vector(11 downto 0);
         loc_q2 : OUT  std_logic_vector(11 downto 0)
		);
end minimum;

architecture Structural of minimum is
component multiplexer
    Port ( 
			  S : in  STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Z : out  STD_LOGIC_VECTOR (11 downto 0)
           );
end component;

component compare
port(
		value1 : in STD_LOGIC_VECTOR(11 downto 0);
		value2 : in STD_LOGIC_VECTOR(11 downto 0);
		sample1 : in STD_LOGIC_VECTOR(11 downto 0);
		sample2 : in STD_LOGIC_VECTOR(11 downto 0);
		amp_q2 : out STD_LOGIC_VECTOR(11 downto 0);
		loc_q2 : out STD_LOGIC_VECTOR(11 downto 0)
		);
end component;

component Bit_store
Port (
		clk : in  STD_LOGIC;
		S	 : in  STD_LOGIC;
		R	 : in  STD_LOGIC;
		D   : in  STD_LOGIC_VECTOR(11 downto 0);
		Q   : out STD_LOGIC_VECTOR(11 downto 0)
		);
end component;
signal value1 : STD_LOGIC_VECTOR(11 downto 0);
signal sample1 : STD_LOGIC_VECTOR(11 downto 0);
signal minq : STD_LOGIC_VECTOR(11 downto 0);
signal minloc : STD_LOGIC_VECTOR(11 downto 0);
signal X : STD_LOGIC_VECTOR(11 downto 0);
signal Y : STD_LOGIC_VECTOR(11 downto 0);
begin
m1 : compare port map(value,X,sample,Y,minq,minloc);
m2 : compare port map(value,minq,sample,minloc,value1,sample1);
m3 : Bit_store port map(clk,S,R,value1,X);
m4 : Bit_store port map(clk,S,R,sample1,Y);
amp_q2 <= X;
loc_q2 <= Y;
end Structural;

