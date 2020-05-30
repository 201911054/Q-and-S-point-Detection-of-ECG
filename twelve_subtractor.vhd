library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twelve_subtractor is
    Port ( X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Sub : out  STD_LOGIC_VECTOR (11 downto 0));
end twelve_subtractor;

architecture Behavior of twelve_subtractor is
component full_subtractor
port (A,B,C : in std_logic;
		M,D : out std_logic );
end component;
signal Bor :STD_LOGIC_VECTOR(11 downto 0);
begin
FA0  : full_subtractor port map (X(0),Y(0),'0',Sub(0),Bor(0));
FA1  : full_subtractor port map (X(1),Y(1),Bor(0),Sub(1),Bor(1));
FA2  : full_subtractor port map (X(2),Y(2),Bor(1),Sub(2),Bor(2));
FA3  : full_subtractor port map (X(3),Y(3),Bor(2),Sub(3),Bor(3));
FA4  : full_subtractor port map (X(4),Y(4),Bor(3),Sub(4),Bor(4));
FA5  : full_subtractor port map (X(5),Y(5),Bor(4),Sub(5),Bor(5));
FA6  : full_subtractor port map (X(6),Y(6),Bor(5),Sub(6),Bor(6));
FA7  : full_subtractor port map (X(7),Y(7),Bor(6),Sub(7),Bor(7));
FA8  : full_subtractor port map (X(8),Y(8),Bor(7),Sub(8),Bor(8));
FA9  : full_subtractor port map (X(9),Y(9),Bor(8),Sub(9),Bor(9));
FA10 : full_subtractor port map (X(10),Y(10),Bor(9),Sub(10),Bor(10));
FA11 : full_subtractor port map (X(11),Y(11),Bor(10),Sub(11),Bor(11));
end Behavior;

