library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_1 is
port (x,y:in std_logic; z:out std_logic);
end nand_1;

architecture Structural of nand_1 is
begin
	z <= x nand y;
end Structural;