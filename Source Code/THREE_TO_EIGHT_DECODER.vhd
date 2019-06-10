library ieee;
use ieee.std_logic_1164.all;
entity andGate is
	port( A, B, C : in std_logic;
		    F : out std_logic);
end andGate;
architecture func of andGate is
begin
	F <= A and B and C;
end func;

library ieee;
use ieee.std_logic_1164.all;
entity notGate is
	port( inPort : in std_logic;
	     outPort : out std_logic);
end notGate;
architecture func of notGate is
begin
	outPort <= not inPort;
end func;

library ieee;
use ieee.std_logic_1164.all;
entity Decoder_3to8 is
	port(	    A0, A1, A2 : in std_logic;
D0, D1, D2, D3, D4, D5, D6, D7 : out std_logic);
end Decoder_3to8;
architecture func of Decoder_3to8 is
	component andGate is         --import AND Gate entity
		port( A, B, C : in std_logic;
			    F : out std_logic);
	end component;
	component notGate is         --import NOT Gate entity
		port( inPort  : in std_logic;
		      outPort : out std_logic);
	end component;
	signal invA0, invA1, invA2  : std_logic;
begin
	GI1: notGate  port map(A0, invA0);
	GI2: notGate  port map(A1, invA1);
	GI3: notGate  port map(A2, invA2);
	GA1: andGate  port map(invA0, invA1, invA2, D0);
	GA2: andGate  port map(   A0, invA1, invA2, D1);
	GA3: andGate  port map(invA0,    A1, invA2, D2);
	GA4: andGate  port map(   A0,    A1, invA2, D3);
	GA5: andGate  port map(invA0, invA1,    A2, D4);
	GA6: andGate  port map(   A0, invA1,    A2, D5);
	GA7: andGate  port map(invA0,    A1,    A2, D6);
	GA8: andGate  port map(   A0,    A1,    A2, D7);
end func;
---------------------------------------------------------END
---------------------------------------------------------END