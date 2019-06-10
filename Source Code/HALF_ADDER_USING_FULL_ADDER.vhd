library ieee;
use ieee.std_logic_1164.all;
entity andGate is
	port( A, B : in std_logic;
		 F : out std_logic);
end andGate;
architecture func of andGate is
begin
	F <= A and B;
end func;

library ieee;
use ieee.std_logic_1164.all;
entity xorGate is
	port( A, B : in std_logic;
		 F : out std_logic);
end xorGate;
architecture func of xorGate is
begin
	F <= A xor B;
end func;

library ieee;
use ieee.std_logic_1164.all;
entity halfAdder is
	port( A, B : in std_logic;
	 sum, Cout : out std_logic);
end halfAdder;
architecture halfAdder of halfAdder is
	component andGate is -- import AND Gate
		port( A, B : in std_logic;
			 F : out std_logic);
	end component;
	component xorGate is -- import XOR Gate
		port( A, B : in std_logic;
			 F : out std_logic);
	end component;
begin
	G1 : xorGate port map(A, B, sum);
	G2 : andGate port map(A, B, Cout);
end halfAdder;

library ieee;
use ieee.std_logic_1164.all;
entity orGate is
	port( A, B : in std_logic;
		 F : out std_logic);
end orGate;
architecture func of orGate is
begin
	F <= A or B;
end func;

library ieee;
use ieee.std_logic_1164.all;
entity fullAdder is
	port( A, B, Cin : in std_logic;
	      sum, Cout : out std_logic);
end fullAdder;
architecture fullAdder of fullAdder is
	component halfAdder is --import Half Adder entity
		port( A, B  : in std_logic;
		  sum, Cout : out std_logic);
	end component;
	component orGate is --import OR Gate entity
		port( A, B : in std_logic;
			 F : out std_logic);
	end component;
	signal halfTohalf, halfToOr1, halfToOr2: std_logic;
begin
	G1: halfAdder port map(A, B, halfTohalf, halfToOr1);
	G2: halfAdder port map(halfTohalf, Cin, sum, halfToOr2);
	G3: orGate port map(halfToOr1, halfToOr2, Cout);
end fullAdder;