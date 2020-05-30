library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer is
    Port ( 
			  S : in  STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Z : out  STD_LOGIC_VECTOR (11 downto 0)
           );
end multiplexer;

architecture Structural of multiplexer is
signal sel : STD_LOGIC_VECTOR(11 downto 0);
begin
sel <= S & S & S & S & S & S & S & S & S & S & S & S;
Z <= ((not sel) and X) or (sel and Y);
end Structural;

