LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY XNOR_GATE IS
	PORT
	(
		A , B : IN STD_LOGIC ;
		F : OUT STD_LOGIC
	) ;
END XNOR_GATE ;
ARCHITECTURE FUNC OF XNOR_GATE IS
BEGIN
	F <= A XNOR B ;
END FUNC ;

LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY NOT_GATE IS
	PORT
	(
		A : IN STD_LOGIC ;
		F : OUT STD_LOGIC
	) ;
END NOT_GATE ;
ARCHITECTURE FUNC OF NOT_GATE IS
BEGIN
	F <= NOT A ;
END FUNC ;

LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY AND_GATE_1 IS
	PORT
	(
		A , B : IN STD_LOGIC ;
		F : OUT STD_LOGIC
	) ;
END AND_GATE_1 ;
ARCHITECTURE FUNC OF AND_GATE_1 IS
BEGIN
	F <= A AND B ;
END FUNC ;

LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY AND_GATE_2 IS
	PORT
	(
		A , B , C : IN STD_LOGIC ;
		F : OUT STD_LOGIC
	) ;
END AND_GATE_2 ;
ARCHITECTURE FUNC OF AND_GATE_2 IS
BEGIN
	F <= A AND B AND C ;
END FUNC ;

LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY OR_GATE IS
	PORT
	(
		A , B , C : IN STD_LOGIC ;
		F : OUT STD_LOGIC
	) ;
END OR_GATE ;
ARCHITECTURE FUNC OF OR_GATE IS
BEGIN
	F <= A OR B OR C ;
END FUNC ;

LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY TWO_BIT_COMPARATOR_USING_COMPONENTS IS
	PORT
	(
		A , B : IN STD_LOGIC_VECTOR ( 1 DOWNTO 0 ) ;
		A_LESS_THAN_B , A_EQUAL_TO_B , A_GREATER_THAN_B : OUT STD_LOGIC
	) ;
END TWO_BIT_COMPARATOR_USING_COMPONENTS ;
ARCHITECTURE FUNC OF TWO_BIT_COMPARATOR_USING_COMPONENTS IS
	COMPONENT XNOR_GATE IS
		PORT
		(
			A , B : IN STD_LOGIC ;
			F : OUT STD_LOGIC
		) ;
	END COMPONENT ;
	COMPONENT NOT_GATE IS
		PORT
		(
			A : IN STD_LOGIC ;
			F : OUT STD_LOGIC
		) ;
	END COMPONENT ;
	COMPONENT AND_GATE_1 IS
		PORT
		(
			A , B : IN STD_LOGIC ;
			F : OUT STD_LOGIC
		) ;
	END COMPONENT ;
	COMPONENT AND_GATE_2 IS
		PORT
		(
			A , B , C : IN STD_LOGIC ;
			F : OUT STD_LOGIC
		) ;
	END COMPONENT ;
	COMPONENT OR_GATE IS
		PORT
		(
			A , B , C : IN STD_LOGIC ;
			F : OUT STD_LOGIC
		) ;
	END COMPONENT ;
	SIGNAL NOT_TO_AND_1 , NOT_TO_AND_2 , NOT_TO_AND_3 , NOT_TO_AND_4 , XNOR_TO_AND_1 , XNOR_TO_AND_2 , AND_TO_OR_1 , AND_TO_OR_2 , AND_TO_OR_3 , AND_TO_OR_4 , AND_TO_OR_5 , AND_TO_OR_6 : STD_LOGIC ;
BEGIN
	G1 : NOT_GATE PORT MAP ( A ( 0 ) , NOT_TO_AND_1 ) ;
	G2 : NOT_GATE PORT MAP ( A ( 1 ) , NOT_TO_AND_2 ) ;
	G3 : NOT_GATE PORT MAP ( B ( 0 ) , NOT_TO_AND_3 ) ;
	G4 : NOT_GATE PORT MAP ( B ( 1 ) , NOT_TO_AND_4 ) ;
	TEMP1 : XNOR_GATE PORT MAP ( A ( 1 ) , B ( 1 ) , XNOR_TO_AND_1 ) ;
	TEMP2 : XNOR_GATE PORT MAP ( A ( 0 ) , B ( 0 ) , XNOR_TO_AND_2 ) ;
	OUTPUT1 : AND_GATE_1 PORT MAP ( XNOR_TO_AND_1 , XNOR_TO_AND_2 , A_EQUAL_TO_B ) ;
	TEMP3 : AND_GATE_2 PORT MAP ( NOT_TO_AND_1 , NOT_TO_AND_2 , B ( 0 ) , AND_TO_OR_1 ) ;
	TEMP4 : AND_GATE_1 PORT MAP ( NOT_TO_AND_2 , B ( 1 ) , AND_TO_OR_2 ) ;
	TEMP5 : AND_GATE_2 PORT MAP ( NOT_TO_AND_1 , B ( 1 ) , B ( 0 ) , AND_TO_OR_3 ) ;
	OUTPUT2 : OR_GATE PORT MAP ( AND_TO_OR_1 , AND_TO_OR_2 , AND_TO_OR_3 , A_LESS_THAN_B ) ;
	TEMP6 : AND_GATE_2 PORT MAP ( NOT_TO_AND_3 , NOT_TO_AND_4 , A ( 0 ) , AND_TO_OR_4 ) ;
	TEMP7 : AND_GATE_1 PORT MAP ( NOT_TO_AND_4 , A ( 1 ) , AND_TO_OR_5 ) ;
	TEMP8 : AND_GATE_2 PORT MAP ( NOT_TO_AND_3 , A ( 1 ) , A ( 0 ) , AND_TO_OR_6 ) ;
	OUTPUT3 : OR_GATE PORT MAP ( AND_TO_OR_4 , AND_TO_OR_5 , AND_TO_OR_6 , A_GREATER_THAN_B ) ;
END FUNC ;