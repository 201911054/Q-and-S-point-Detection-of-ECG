library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_store is
Port (
		clk : in  STD_LOGIC;
		S	 : in  STD_LOGIC;
		R	 : in  STD_LOGIC;
		D   : in  STD_LOGIC_VECTOR(11 downto 0);
		Q   : out STD_LOGIC_VECTOR(11 downto 0)
		);
end Bit_store;

architecture Structural of Bit_store is
component MSDFF
port (S,R,CLK,D:IN STD_LOGIC;
		Q,Q_BAR:OUT STD_LOGIC); 
end component;
begin
r11: MSDFF port map (S,R,CLK,D(11),Q(11));
r10: MSDFF port map (S,R,CLK,D(10),Q(10));
r9: MSDFF port map (S,R,CLK,D(9),Q(9));
r8: MSDFF port map (S,R,CLK,D(8),Q(8));
r7: MSDFF port map (S,R,CLK,D(7),Q(7));
r6: MSDFF port map (S,R,CLK,D(6),Q(6));
r5: MSDFF port map (S,R,CLK,D(5),Q(5));
r4: MSDFF port map (S,R,CLK,D(4),Q(4));
r3: MSDFF port map (S,R,CLK,D(3),Q(3));
r2: MSDFF port map (S,R,CLK,D(2),Q(2));
r1: MSDFF port map (S,R,CLK,D(1),Q(1));
r0: MSDFF port map (S,R,CLK,D(0),Q(0));
end Structural;