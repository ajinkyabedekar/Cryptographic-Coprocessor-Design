LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY AND_GATE IS
	PORT ( A , B : IN STD_LOGIC ;
		   F : OUT STD_LOGIC ) ;
END AND_GATE ;
ARCHITECTURE FUNC OF AND_GATE IS
BEGIN
	F <= A AND B ;
END FUNC ;
LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY XOR_GATE IS
	PORT ( A , B : IN STD_LOGIC ;
		   F : OUT STD_LOGIC ) ;
END XOR_GATE ;
ARCHITECTURE FUNC OF XOR_GATE IS
BEGIN
	F <= A XOR B ;
END FUNC ;
LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY HALF_ADDER IS
	PORT ( A , B : IN STD_LOGIC ;
	  SUM , COUT : OUT STD_LOGIC ) ;
END HALF_ADDER ;
ARCHITECTURE FUNC OF HALF_ADDER IS
	COMPONENT AND_GATE IS
		PORT ( A , B : IN STD_LOGIC ;
			   F : OUT STD_LOGIC ) ;
	END COMPONENT ;
	COMPONENT XOR_GATE IS
		PORT ( A , B : IN STD_LOGIC ;
			   F : OUT STD_LOGIC ) ;
	END COMPONENT ;
BEGIN
	G1 : XOR_GATE PORT MAP ( A , B , SUM ) ;
	G2 : AND_GATE PORT MAP ( A , B , COUT ) ;
END FUNC ;
LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY OR_GATE IS
	PORT ( A , B : IN STD_LOGIC ;
		   F : OUT STD_LOGIC ) ;
END OR_GATE ;
ARCHITECTURE FUNC OF OR_GATE IS
BEGIN
	F <= A OR B ;
END FUNC ;
LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY FULL_ADDER IS
	PORT ( A , B , CIN : IN STD_LOGIC ;
		SUM , COUT : OUT STD_LOGIC ) ;
END FULL_ADDER ;
ARCHITECTURE FUNC OF FULL_ADDER IS
	COMPONENT HALF_ADDER IS
		PORT ( A , B  : IN STD_LOGIC ;
		   SUM , COUT : OUT STD_LOGIC ) ;
	END COMPONENT ;
	COMPONENT OR_GATE IS
		PORT ( A , B : IN STD_LOGIC ;
			   F : OUT STD_LOGIC ) ;
	END COMPONENT ;
	SIGNAL HALF_TO_HALF , HALF_TO_OR_1 , HALF_TO_OR_2 : STD_LOGIC ;
BEGIN
	G1 : HALF_ADDER PORT MAP ( A , B , HALF_TO_HALF , HALF_TO_OR_1 ) ;
	G2 : HALF_ADDER PORT MAP ( HALF_TO_HALF , CIN , SUM , HALF_TO_OR_2 ) ;
	G3 : OR_GATE PORT MAP ( HALF_TO_OR_1 , HALF_TO_OR_2 , COUT ) ;
END FUNC ;