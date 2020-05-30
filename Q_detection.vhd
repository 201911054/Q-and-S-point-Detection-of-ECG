library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q_detection is
port(
		S : in STD_LOGIC;
		R : in STD_LOGIC;
		clk : in STD_LOGIC;
		Rloc1 : in STD_LOGIC_VECTOR(11 downto 0);
		value : in  STD_LOGIC_VECTOR(11 downto 0);
		sample : in  STD_LOGIC_VECTOR(11 downto 0);
		amp_q : out STD_LOGIC_VECTOR(11 downto 0);
		loc_q : out STD_LOGIC_VECTOR(11 downto 0)
		);
end Q_detection;

architecture Structural of Q_detection is
component minimum 
port( S : IN  std_logic; R : IN  std_logic; clk : IN  std_logic;
         Rloc1 : IN  std_logic_vector(11 downto 0);
         value : IN  std_logic_vector(11 downto 0);
         sample : IN  std_logic_vector(11 downto 0);
         amp_q2 : OUT  std_logic_vector(11 downto 0);
         loc_q2 : OUT  std_logic_vector(11 downto 0)
		);
end component;
component twelve_subtractor 
    Port ( X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : in  STD_LOGIC_VECTOR (11 downto 0);
           Sub : out  STD_LOGIC_VECTOR (11 downto 0));
end component;
component comparator 
Port (A : in  STD_LOGIC_VECTOR(11 downto 0);
		B : in  STD_LOGIC_VECTOR(11 downto 0);
		L : out  STD_LOGIC;
		E : out  STD_LOGIC;
		G : out  STD_LOGIC);
end component;

component multiplexer
Port ( 
		  S : in  STD_LOGIC;
		  X : in  STD_LOGIC_VECTOR (11 downto 0);
		  Y : in  STD_LOGIC_VECTOR (11 downto 0);
		  Z : out  STD_LOGIC_VECTOR (11 downto 0)
        );
end component;
component twelve_adder
    Port ( X   : in  STD_LOGIC_VECTOR (11 downto 0);
           Y   : in  STD_LOGIC_VECTOR (11 downto 0);
           Sum : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component Bit_store 
Port (
		clk : in  STD_LOGIC;
		S	 : in  STD_LOGIC;
		R	 : in  STD_LOGIC;
		D   : in  STD_LOGIC_VECTOR(11 downto 0);
		Q   : out STD_LOGIC_VECTOR(11 downto 0)
		);
end component;
signal start1 : STD_LOGIC_VECTOR(11 downto 0);
signal start2 : STD_LOGIC_VECTOR(11 downto 0);
signal X : STD_LOGIC_VECTOR(11 downto 0);
signal Y : STD_LOGIC_VECTOR(11 downto 0);
signal W : STD_LOGIC_VECTOR(11 downto 0);
signal Z : STD_LOGIC_VECTOR(11 downto 0);
signal l1 : STD_LOGIC:= '1';
signal e1 : STD_LOGIC:= '0';
signal g1 : STD_LOGIC:= '0';
signal l2 : STD_LOGIC:= '1';
signal e2: STD_LOGIC:= '0';
signal g2 : STD_LOGIC:= '0';
signal l3 : STD_LOGIC:= '1';
signal e3 : STD_LOGIC:= '0';
signal g3 : STD_LOGIC:= '0';
signal l4 : STD_LOGIC:= '1';
signal e4: STD_LOGIC:= '0';
signal g4 : STD_LOGIC:= '0';
signal r1,r2 :  STD_LOGIC;
signal r3,r4 : STD_LOGIC;
signal lf1,ef1,gf1 : STD_LOGIC;
signal lf2,ef2,gf2 : STD_LOGIC; 
signal lf3,ef3,gf3 : STD_LOGIC;
signal ls1,es1,gs1 : STD_LOGIC;
signal ls2,es2,gs2 : STD_LOGIC; 
signal lz1,ez1,gz1 : STD_LOGIC;

signal Mvq, sum: STD_LOGIC_VECTOR(11 downto 0);
signal Q1, Q2, locq1, locq2 : STD_LOGIC_VECTOR(11 downto 0);
signal ans1,ans2 : STD_LOGIC_VECTOR(11 downto 0);
signal mans1,mans2 : STD_LOGIC_VECTOR(11 downto 0);

begin
r1<= (not l1) and (not g2);
r2 <= W(11) and W(10) and W(9) and W(8) and W(7) and W(6) and W(5) and W(4) and W(3) and W(2) and W(1) and W(0);
r3<= (not l3) and (not g4);
r4 <= X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1) and X(0);

m3 : twelve_subtractor port map(Rloc1,"000000001110",start1);
m4 : comparator port map(sample,start1,l1,e1,g1);
m5 : comparator port map(sample,Rloc1,l2,e2,g2);
m6 : minimum port map(not r1,not R,clk,Rloc1,value,sample,W,Z);
m7 : minimum port map(r2,R,clk,Rloc1,value,sample,Q1,locq1);

n3 : twelve_subtractor port map(Rloc1,"000000011100",start2);
n4 : comparator port map(sample,start2,l3,e3,g3);
n5 : comparator port map(sample,Rloc1,l4,e4,g4);
n6 : minimum port map(not r3,not R,clk,Rloc1,value,sample,X,Y);
n7 : minimum port map(r4,R,clk,Rloc1,value,sample,Q2,locq2);

p1 : comparator port map(Q1,Q2,lf1,ef1,gf1);
p2 : multiplexer port map(g1,Q2,Q1,Mvq);
p3 : twelve_adder port map(Q1,"000000100100",sum); 
p4 : comparator port map(Mvq,sum,lf2,ef2,gf2);
p5 : comparator port map(locq1,locq2,lf3,ef3,gf3);
p6 : multiplexer port map(lf1,locq2,locq1,ans1);
p7 : multiplexer port map(gf2,ans1,locq2,ans2);
p8 : multiplexer port map(ef3,ans2,locq1,loc_q);
p9 : multiplexer port map(lf1,Q2,Q1,mans1);
p10 : multiplexer port map(gf2,mans1,Q2,mans2);
p11 : multiplexer port map(ef3,mans2,Q1,amp_q);

end Structural;

