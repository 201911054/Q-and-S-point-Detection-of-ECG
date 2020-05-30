library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare is
port(
		value1 : in STD_LOGIC_VECTOR(11 downto 0);
		value2 : in STD_LOGIC_VECTOR(11 downto 0);
		sample1 : in STD_LOGIC_VECTOR(11 downto 0);
		sample2 : in STD_LOGIC_VECTOR(11 downto 0);
		amp_q2 : out STD_LOGIC_VECTOR(11 downto 0);
		loc_q2 : out STD_LOGIC_VECTOR(11 downto 0)
		);
end compare;

architecture Structural of compare is
component comparator	
Port (A : in  STD_LOGIC_VECTOR(11 downto 0);
		B : in  STD_LOGIC_VECTOR(11 downto 0);
		L : out  STD_LOGIC;
		E : out  STD_LOGIC;
		G : out  STD_LOGIC);
end component;		
component multiplexer
Port ( 
			  S : in  STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Z : out  STD_LOGIC_VECTOR (11 downto 0)
           );
end component;
component buff 
    Port ( X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : out  STD_LOGIC_VECTOR (11 downto 0));
end component;
signal l,e,g : STD_LOGIC;

begin
m1 : comparator port map(value1,value2,l,e,g);
m2 : multiplexer port map(l,value2,value1,amp_q2);
m3 : multiplexer port map(l,sample2,sample1,loc_q2);
end Structural;



