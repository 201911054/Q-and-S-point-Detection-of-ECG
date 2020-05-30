library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator is
Port (A : in  STD_LOGIC_VECTOR(11 downto 0);
		B : in  STD_LOGIC_VECTOR(11 downto 0);
		L : out  STD_LOGIC;
		E : out  STD_LOGIC;
		G : out  STD_LOGIC);
end comparator;

architecture Structural of comparator is
signal X : STD_LOGIC_VECTOR(11 downto 0);
begin
X(11) <= A(11) xnor B(11);
X(10) <= A(10) xnor B(10);
X(9) <= A(9) xnor B(9);
X(8) <= A(8) xnor B(8);
X(7) <= A(7) xnor B(7);
X(6) <= A(6) xnor B(6);
X(5) <= A(5) xnor B(5);
X(4) <= A(4) xnor B(4);
X(3) <= A(3) xnor B(3);
X(2) <= A(2) xnor B(2);
X(1) <= A(1) xnor B(1);
X(0) <= A(0) xnor B(0);
L <= ((not A(11)) and B(11))
	or (X(11) and (not A(10)) and B(10)) 
	or (X(11) and X(10) and (not A(9)) and B(9))		
	or (X(11) and X(10) and X(9) and (not A(8)) and B(8)) 		
	or (X(11) and X(10) and X(9) and X(8) and (not A(7)) and B(7)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and (not A(6)) and B(6)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and (not A(5)) and B(5)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and (not A(4)) and B(4)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and (not A(3)) and B(3))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and (not A(2)) and B(2))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and 
																			X(5) and X(4) and X(3) and X(2) and (not A(1)) and B(1))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and 
																			X(5) and X(4) and X(3) and X(2) and X(1) and (not A(0)) and B(0));
G <=  ((not B(11)) and A(11))
	or (X(11) and (not B(10)) and A(10)) 
	or (X(11) and X(10) and (not B(9)) and A(9))		
	or (X(11) and X(10) and X(9) and (not B(8)) and A(8)) 		
	or (X(11) and X(10) and X(9) and X(8) and (not B(7)) and A(7)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and (not B(6)) and A(6)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and (not B(5)) and A(5)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and (not B(4)) and A(4)) 		
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and (not B(3)) and A(3))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and (not B(2)) and A(2))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and 
																			X(5) and X(4) and X(3) and X(2) and (not B(1)) and A(1))
	or (X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and 
																			X(5) and X(4) and X(3) and X(2) and X(1) and (not B(0)) and A(0));
E <= X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1) and X(0);
end Structural;
