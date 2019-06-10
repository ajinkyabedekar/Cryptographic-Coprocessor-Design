library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity mod13_counter is
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		dout : out STD_LOGIC_VECTOR(3 downto 0)
	);
end mod13_counter;
architecture mod13_counter_arc of mod13_counter is
begin
	counter : process (clk,reset) is
	variable m : integer range 0 to 14 := 0;
	begin
		if (reset='1') then
			m := 0;
		elsif (rising_edge (clk)) then
			m := m + 1;
		end if;
		if (m=13) then
			m := 0;
		end if;
		dout <= conv_std_logic_vector (m,4);
	end process counter;
end mod13_counter_arc;