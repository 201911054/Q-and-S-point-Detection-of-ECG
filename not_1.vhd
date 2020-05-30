library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_1 is
    Port ( x : in  STD_LOGIC;
           y : out  STD_LOGIC);
end not_1;

architecture Structural of not_1 is
begin
y<= not x;
end Structural;

