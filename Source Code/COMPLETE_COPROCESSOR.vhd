LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY COMPLETE_COPROCESSOR IS
	PORT
	(
		CLOCK , RESET : IN STD_LOGIC ;
		CTRL : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
		RA , RB , RD : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 )
	) ;
END COMPLETE_COPROCESSOR ;
ARCHITECTURE FUNC OF COMPLETE_COPROCESSOR IS
	COMPONENT REGISTER_FILE IS
	PORT
	(
		CLOCK : IN STD_LOGIC ;
		RESET : IN STD_LOGIC ;
		RDWEN : IN STD_LOGIC ;
		RES : IN STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
		RA , RB , RD : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
		SRCA , SRCB : OUT STD_LOGIC_VECTOR ( 15 DOWNTO 0 )
	) ;
	END COMPONENT REGISTER_FILE ;
	COMPONENT COMBINATIONAL_LOGIC_UNIT_OF_COPROCESSOR IS
	PORT
	(
		A_BUS : IN STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
		B_BUS : IN STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
		CTRL : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
		RESULT : OUT STD_LOGIC_VECTOR ( 15 DOWNTO 0 )
	) ;
	END COMPONENT COMBINATIONAL_LOGIC_UNIT_OF_COPROCESSOR ;
	SIGNAL WRITE_ENABLE : STD_LOGIC ;
	SIGNAL READ_DATA_1 , READ_DATA_2 , WRITE_DATA : STD_LOGIC_VECTOR ( 15 DOWNTO 0 ) ;
	SIGNAL CTRL_TEMP : STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
	SIGNAL RD_TEMP : STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
BEGIN
	REGISTER_FILE_16x16 : REGISTER_FILE PORT MAP ( CLOCK => CLOCK , RESET => RESET , RDWEN => WRITE_ENABLE , RES => WRITE_DATA , RA => RA , RB => RB , RD => RD_TEMP , SRCA => READ_DATA_1 , SRCB => READ_DATA_2 ) ;
	COMBINATIONAL_LOGIC : COMBINATIONAL_LOGIC_UNIT_OF_COPROCESSOR PORT MAP ( A_BUS => READ_DATA_1 , B_BUS => READ_DATA_2 , CTRL => CTRL_TEMP , RESULT => WRITE_DATA ) ;
	PROCESS ( CLOCK , RESET )
	BEGIN
		IF ( RISING_EDGE ( CLOCK ) ) THEN
			IF ( RESET = '1' ) THEN
				CTRL_TEMP <= x"0" ;
				RD_TEMP <= x"0" ;
			ELSE
				RD_TEMP <= RD ;
				CTRL_TEMP <= CTRL ;
				IF ( CTRL_TEMP = "0111" ) THEN
					WRITE_ENABLE <= '0' ;
				ELSE
					WRITE_ENABLE <= '1' ;
				END IF ;
			END IF ;
		END IF ;
	END PROCESS ;
END FUNC ;