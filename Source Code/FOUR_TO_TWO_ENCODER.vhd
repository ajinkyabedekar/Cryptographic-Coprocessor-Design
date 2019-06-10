library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity encoder4_2 is
	port(
		din : in STD_LOGIC_VECTOR(3 downto 0);
		dout : out STD_LOGIC_VECTOR(1 downto 0)
	);
end encoder4_2;
architecture encoder4_2_arc of encoder4_2 is
begin
	encoder : process (din) is
	begin
		if (din="1000") then
			dout <= "00";
		elsif (din="0100") then
			dout <= "01";
		elsif (din="0010") then
			dout <= "10";
		elsif (din="0001") then
			dout <= "11";
		else
			dout <= "ZZ";
		end if;
	end process encoder;
end encoder4_2_arc;