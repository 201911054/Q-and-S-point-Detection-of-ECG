library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buffer_1 is
port (x:in std_logic; y:out std_logic);
end buffer_1;

architecture Structural of buffer_1 is
begin
y <= x;
end Structural;