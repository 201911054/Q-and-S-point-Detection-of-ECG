library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
Port (A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		C : in  STD_LOGIC;
		S : out STD_LOGIC;
		V : out STD_LOGIC);
end full_adder;


architecture Structural of full_adder is
begin
S <= A xor B xor C;
V <= (A and B) or (B and C) or (C and A);
end Structural;
