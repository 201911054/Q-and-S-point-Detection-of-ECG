library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_subtractor is
Port (A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		C : in  STD_LOGIC;
		M : out STD_LOGIC;
		D : out STD_LOGIC);
end full_subtractor;

architecture Structural of full_subtractor is

begin
M <= A xor B xor C;
D <= ((not A) and C) or ((not A) and B) or (B and C);
end Structural;

