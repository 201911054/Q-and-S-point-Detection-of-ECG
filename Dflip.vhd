library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Dflip is
Port (D,CLK,SET,Reset:IN STD_LOGIC; 
		Q,Q_BAR:OUT STD_LOGIC); 
end Dflip;

architecture Structural of Dflip is
component nand_1
	port (x,y:in std_logic; z:out std_logic);
end component;
component not_1
	port (x:in std_logic; y:out std_logic);
end component;
component buffer_1
	port (x:in std_logic; y:out std_logic);
end  component;
component nand_3
	port(a,b,c:in std_logic; z:out std_logic);
end component;
signal a,b,c,q1,q2:std_logic;
begin	
		NA1: nand_1 port map(D,CLK,a);
		N1 : not_1 port map(D,b);
		NA2: nand_1 port map(b,CLK,c);
		NA3: nand_3 port map(a,SET,q2,q1);
		NA4: nand_3 port map(c,Reset,q1,q2);
		BUF1: buffer_1 port map(q1,Q);
		BUF2: buffer_1 port map(q2,Q_BAR);end Structural;
