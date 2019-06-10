library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity sr_flip_flop is
	port(
		s : in STD_LOGIC;
		r : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		q : out STD_LOGIC;
		qb : out STD_LOGIC
	);
end sr_flip_flop;
architecture sr_flip_flop_arc of sr_flip_flop is
begin
	srff : process (s,r,clk,reset) is
	begin
		if (reset='1') then
			q <= '0';
			qb <= '1';
		elsif (rising_edge (clk)) then
			if (s/=r) then
				q <= s;
				qb <= r;
			elsif (s='1' and r='1') then
				q <= 'Z';
				qb <= 'Z';
			end if;
		end if;
	end process srff;
end sr_flip_flop_arc;