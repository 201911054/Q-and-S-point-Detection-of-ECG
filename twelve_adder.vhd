library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twelve_adder is
Port (X : in  STD_LOGIC_VECTOR(11 downto 0);
		Y : in  STD_LOGIC_VECTOR(11 downto 0);
		Sum : out STD_LOGIC_VECTOR(11 downto 0));
end twelve_adder;

architecture Structural of twelve_adder is
component full_adder
port (A,B,C : in std_logic;
		S,V : out std_logic );
end component;
signal Car :STD_LOGIC_VECTOR(11 downto 0);
begin
FA0  : full_adder port map (X(0),Y(0),'0',Sum(0),Car(0));
FA1  : full_adder port map (X(1),Y(1),Car(0),Sum(1),Car(1));
FA2  : full_adder port map (X(2),Y(2),Car(1),Sum(2),Car(2));
FA3  : full_adder port map (X(3),Y(3),Car(2),Sum(3),Car(3));
FA4  : full_adder port map (X(4),Y(4),Car(3),Sum(4),Car(4));
FA5  : full_adder port map (X(5),Y(5),Car(4),Sum(5),Car(5));
FA6  : full_adder port map (X(6),Y(6),Car(5),Sum(6),Car(6));
FA7  : full_adder port map (X(7),Y(7),Car(6),Sum(7),Car(7));
FA8  : full_adder port map (X(8),Y(8),Car(7),Sum(8),Car(8));
FA9  : full_adder port map (X(9),Y(9),Car(8),Sum(9),Car(9));
FA10 : full_adder port map (X(10),Y(10),Car(9),Sum(10),Car(10));
FA11 : full_adder port map (X(11),Y(11),Car(10),Sum(11),Car(11));
--FA12 : full_adder port map (X(12),Y(12),Car(11),Sum(12),Car(12));
end Structural;

