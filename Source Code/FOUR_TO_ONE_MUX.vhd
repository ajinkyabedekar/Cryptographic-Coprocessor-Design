library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity multiplexer_4_1 is
	port(
		din : in STD_LOGIC_VECTOR(3 downto 0);
		sel : in STD_LOGIC_VECTOR(1 downto 0);
		dout : out STD_LOGIC
	);
end multiplexer_4_1;
architecture multiplexer4_1_arc of multiplexer_4_1 is
begin
	mux : process (din,sel) is
	begin
		if (sel="00") then
			dout <= din(3);
		elsif (sel="01") then
			dout <= din(2);
		elsif (sel="10") then
			dout <= din(1);
		else
			dout <= din(0);
		end if;
	end process mux;
end multiplexer4_1_arc;