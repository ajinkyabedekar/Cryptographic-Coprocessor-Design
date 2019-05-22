LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
USE IEEE . NUMERIC_STD . ALL ;
ENTITY REGISTER_FILE IS
	PORT
	(
		CLOCK : IN STD_LOGIC ;
		RESET : IN STD_LOGIC ;
		RDWEN : IN STD_LOGIC ;
		RES : IN STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
		RA , RB , RD : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
		SRCA , SRCB : OUT STD_LOGIC_VECTOR ( 15 DOWNTO 0 )
	) ;
END REGISTER_FILE ;
ARCHITECTURE FUNC OF REGISTER_FILE IS
	TYPE MEM_TYPE IS ARRAY ( 0 TO 15 ) OF STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
	SIGNAL REG_FILE : MEM_TYPE :=
	(
		0 => x"0001" ,
		1 => x"c505" ,
		2 => x"3c07" ,
		3 => x"4d05" ,
		4 => x"1186" ,
		5 => x"f407" ,
		6 => x"1086" ,
		7 => x"4706" ,
		8 => x"6808" ,
		9 => x"baa0" ,
		10 => x"c902" ,
		11 => x"100b" ,
		12 => x"c000" ,
		13 => x"c902" ,
		14 => x"100b" ,
		15 => x"B000" ,
		OTHERS => ( OTHERS => '0' )
	) ;
BEGIN
	WRTIE_OPERATION : PROCESS ( CLOCK )
	BEGIN
		IF ( RISING_EDGE ( CLOCK ) ) THEN
			IF ( RDWEN = '1' ) THEN
				REG_FILE ( TO_INTEGER ( UNSIGNED ( RD ) ) ) <= RES ;
			END IF ;
		END IF ;
	END PROCESS ;
	READ_OPERATION : PROCESS ( CLOCK )
	BEGIN
		IF ( RISING_EDGE ( CLOCK ) ) THEN
			IF ( RESET = '1' ) THEN
				SRCA <= x"0000" ;
				SRCB <= x"0000" ;
			ELSE
				SRCA <= REG_FILE ( TO_INTEGER ( UNSIGNED ( RA ) ) ) ;
				SRCB <= REG_FILE ( TO_INTEGER ( UNSIGNED ( RB ) ) ) ;
			END IF ;
		END IF ;
	END PROCESS ;
END FUNC ;