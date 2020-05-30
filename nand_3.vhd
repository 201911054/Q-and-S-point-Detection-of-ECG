library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_3 is
port(a,b,c:in std_logic; z:out std_logic); 
end nand_3;

architecture Structural of nand_3 is
signal x,y:std_logic;
begin
x <= a nand b;
y <= not x;
z <= y nand c;
end Structural; 