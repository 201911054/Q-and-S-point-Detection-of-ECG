library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity com_28q is
port(
		S : in STD_LOGIC;
		R : in STD_LOGIC;
		clk : in STD_LOGIC;
		Rloc1 : in STD_LOGIC_VECTOR(11 downto 0);
		value : in  STD_LOGIC_VECTOR(11 downto 0);
		sample : in  STD_LOGIC_VECTOR(11 downto 0);
		amp_q : out STD_LOGIC_VECTOR(11 downto 0);
		loc_q : out STD_LOGIC_VECTOR(11 downto 0)
		);
end com_28q;

architecture Behavioral of com_28q is

component minimum 
port( S : IN  std_logic; R : IN  std_logic; clk : IN  std_logic;
         Rloc1 : IN  std_logic_vector(11 downto 0);
         value : IN  std_logic_vector(11 downto 0);
         sample : IN  std_logic_vector(11 downto 0);
         amp_q2 : OUT  std_logic_vector(11 downto 0);
         loc_q2 : OUT  std_logic_vector(11 downto 0)
		);
end component;
component twelve_subtractor 
    Port ( X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Sub : out  STD_LOGIC_VECTOR (11 downto 0));
end component;
component comparator 
Port (A : in  STD_LOGIC_VECTOR(11 downto 0);
		B : in  STD_LOGIC_VECTOR(11 downto 0);
		L : out  STD_LOGIC;
		E : out  STD_LOGIC;
		G : out  STD_LOGIC);
end component;
component counter5bit
port(
S,R,clk:in std_logic;
Q,Qb:out std_logic_vector(4 downto 0));
end component;
signal start : STD_LOGIC_VECTOR(11 downto 0);
signal X : STD_LOGIC_VECTOR(11 downto 0);
signal Y : STD_LOGIC_VECTOR(11 downto 0);
signal W : STD_LOGIC_VECTOR(11 downto 0);
signal Z : STD_LOGIC_VECTOR(11 downto 0);
signal Q : STD_LOGIC_VECTOR(3 downto 0);
signal Qb : STD_LOGIC_VECTOR(3 downto 0);
signal l1 : STD_LOGIC:= '1';
signal e1 : STD_LOGIC:= '0';
signal g1 : STD_LOGIC:= '0';
signal l2 : STD_LOGIC:= '1';
signal e2: STD_LOGIC:= '0';
signal g2 : STD_LOGIC:= '0';
signal sel : STD_LOGIC:= '0';
signal s1,r1 : STD_LOGIC;
signal s2,r2 : STD_LOGIC;
begin
m1 : twelve_subtractor port map(Rloc1,"000000011100",start);
m2 : comparator port map(sample,start,l1,e1,g1);
m3 : comparator port map(sample,Rloc1,l2,e2,g2);
s1<= (g1 or e1) or (l2 or e2);
r1<= (not l1) and (not g2);
m4 : minimum port map(not r1,not R,clk,Rloc1,value,sample,W,Z);
r2 <= W(11) and W(10) and W(9) and W(8) and W(7) and W(6) and W(5) and W(4) and W(3) and W(2) and W(1) and W(0);
m5 : minimum port map(r2,R,clk,Rloc1,value,sample,X,Y);
end Behavioral;

