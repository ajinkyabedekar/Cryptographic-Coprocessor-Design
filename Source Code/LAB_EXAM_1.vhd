LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY LAB_EXAM_1 IS
	PORT
	(
		A : IN STD_LOGIC_VECTOR ( 2 DOWNTO 0 ) ;
		B : IN STD_LOGIC ;
		F : OUT STD_LOGIC_VECTOR ( 2 DOWNTO 0 )
	) ;
END LAB_EXAM_1 ;
ARCHITECTURE FUNC OF LAB_EXAM_1 IS
BEGIN
	STORAGE : PROCESS ( A , B ) IS
	VARIABLE M : INTEGER RANGE 0 TO 7 := 0 ;
	VARIABLE N : INTEGER RANGE 0 TO 1 := 0 ;
	VARIABLE T : INTEGER RANGE 0 TO 1 := 0 ;
	VARIABLE TEMP : STD_LOGIC_VECTOR ( 2 DOWNTO 0 ) ;
	BEGIN
	FOR I IN 0 TO 3 LOOP
		IF ( A ( 0 ) = '0' AND A ( 1 ) = '0' AND A ( 2 ) = '0' ) THEN
			M := 0 ;
		ELSIF ( A ( 0 ) = '0' AND A ( 1 ) = '0' AND A ( 2 ) = '1' ) THEN
			M := 1 ;
		ELSIF ( A ( 0 ) = '0' AND A ( 1 ) = '1' AND A ( 2 ) = '0' ) THEN
			M := 2 ;
		ELSIF ( A ( 0 ) = '0' AND A ( 1 ) = '1' AND A ( 2 ) = '1' ) THEN
			M := 3 ;
		ELSIF ( A ( 0 ) = '1' AND A ( 1 ) = '0' AND A ( 2 ) = '0' ) THEN
			M := 4 ;
		ELSIF ( A ( 0 ) = '1' AND A ( 1 ) = '0' AND A ( 2 ) = '1' ) THEN
			M := 5 ;
		ELSIF ( A ( 0 ) = '1' AND A ( 1 ) = '1' AND A ( 2 ) = '0' ) THEN
			M := 6 ;
		ELSIF ( A ( 0 ) = '1' AND A ( 1 ) = '1' AND A ( 2 ) = '1' ) THEN
			M := 7 ;
		END IF ;
		IF ( I = 3 ) THEN
			N := N + 1 ;
			I := 0 ;
		ELSE
			IF ( N = 0 ) THEN
				TEMP ( I ) <= M ;
			ELSE
				T <= TEMP ( 0 ) ;
				TEMP ( 0 ) <= TEMP ( 1 ) ;
				TEMP ( 1 ) <= TEMP ( 2 ) ;
				TEMP ( 2 ) <= M ;
			END IF ;
		END IF ;
		IF ( B = '0' OR B = 'U' OR B = 'Z' ) THEN
			F ( 0 ) <= 'Z' ;
			F ( 1 ) <= 'Z' ;
			F ( 2 ) <= 'Z' ;
			TEMP ( 2 ) <= TEMP ( 1 ) ;
			TEMP ( 1 ) <= TEMP ( 0 ) ;
			TEMP ( 0 ) <= T ;
		ELSE
			F <= CONV_STD_LOGIC_VECTOR ( TEMP ( B ) , 3 ) ;
		END IF ;
	END LOOP ;
	END PROCESS ;
END FUNC ;