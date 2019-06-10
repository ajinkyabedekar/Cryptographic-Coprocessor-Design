library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity demultiplexer1_4 is
	port(
		din : in STD_LOGIC;
		sel : in STD_LOGIC_VECTOR(1 downto 0);
		dout : out STD_LOGIC_VECTOR (3 downto 0)
	);
end demultiplexer1_4;
architecture demultiplexer1_4_arc of demultiplexer1_4 is
begin
	demux : process (din,sel) is
	begin
		if (sel="00") then
			dout <= din & "000";
		elsif (sel="01") then
			dout <= '0' & din & "00";
		elsif (sel="10") then
			dout <= "00" & din & '0';
		else
			dout <= "000" & din;
		end if;
	end process demux;
end demultiplexer1_4_arc;