library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MSDFF is
port (S,R,CLK,D:IN STD_LOGIC;
 Q,Q_BAR:OUT STD_LOGIC); 
end MSDFF;

architecture Structural of MSDFF is
component not_1
	port(x:in std_logic; y:out std_logic);
end component;
component Dflip
Port (D,CLK,SET,Reset:IN STD_LOGIC; 
		Q,Q_BAR:OUT STD_LOGIC); 
end component;
signal clk_b,q1,q2:std_logic;
begin	
	N1: not_1 port map(CLK,clk_b);
	D1_latch: Dflip port map(D,clk_b,S,R,q1,q2); -- Master
	D2_latch: Dflip port map(q1,CLK,S,R,Q,Q_BAR); -- Slave
end Structural;

