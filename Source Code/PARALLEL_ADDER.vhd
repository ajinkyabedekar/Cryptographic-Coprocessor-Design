LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY FA IS
PORT(A,B,CIN:IN STD_LOGIC;SUM,COUT:OUT STD_LOGIC);
END FA;
ARCHITECTURE BEHV OF FA IS
BEGIN
SUM<=A XOR B XOR CIN;
COUT<=(A AND B) OR (B AND CIN) OR (A AND CIN);
END BEHV;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ADDER_4BIT IS
PORT(A,B:IN STD_LOGIC_VECTOR(3 DOWNTO 0);S:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);C:OUT STD_LOGIC);
END ADDER_4BIT;
ARCHITECTURE BEHV OF ADDER_4BIT IS
SIGNAL TEMP:STD_LOGIC:='0';
SIGNAL CAR:STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
FA1:ENTITY WORK.FA PORT MAP(A(0),B(0),TEMP,S(0),CAR(0));
FA2:ENTITY WORK.FA PORT MAP(A(1),B(1),CAR(0),S(1),CAR(1));
FA3:ENTITY WORK.FA PORT MAP(A(2),B(2),CAR(1),S(2),CAR(2));
FA4:ENTITY WORK.FA PORT MAP(A(3),B(3),CAR(2),S(3),C);
END BEHV;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity adder_4 is
	port(
		a : in STD_LOGIC_VECTOR(3 downto 0);
		b : in STD_LOGIC_VECTOR(3 downto 0);
		sum : out STD_LOGIC_VECTOR(4 downto 0)
	);
end adder_4;
architecture adder4_arc of adder_4 is
begin
	adder4 : process (a,b) is
	variable s : std_logic_vector (4 downto 0);
	begin
		s(0) := '0';
		for i in 0 to 3 loop
			sum(i) <= a(i) xor b(i) xor s(i) ;
			s(i+1) := (a(i) and b(i)) or (b(i) and s(i)) or (s(i) and a(i));
		end loop;
		sum(4) <= s(4);
	end process;
end adder4_arc;