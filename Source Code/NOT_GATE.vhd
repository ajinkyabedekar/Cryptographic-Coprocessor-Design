LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY NOT_GATE IS
	PORT ( A : IN STD_LOGIC ;
	       F : OUT STD_LOGIC ) ;
END NOT_GATE ;
ARCHITECTURE FUNC OF NOT_GATE IS
BEGIN
	F <= NOT A ;
END FUNC ;