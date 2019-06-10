library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity jk_flip_flop is
	port(
		j : in STD_LOGIC;
		k : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		q : out STD_LOGIC;
		qb : out STD_LOGIC
	);
end jk_flip_flop;
architecture jk_flip_flop_arc of jk_flip_flop is
begin
	jkff : process (j,k,clk,reset) is
	variable m : std_logic := '0';
	begin
		if (reset='1') then
			m := '0';
		elsif (rising_edge (clk)) then
			if (j/=k) then
				m := j;
			elsif (j='1' and k='1') then
				m := not m;
			end if;
		end if;
		q <= m;
		qb <= not m;
	end process jkff;
end jk_flip_flop_arc;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity jk_flip_flop is
	port(
		j : in STD_LOGIC;
		k : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		q : out STD_LOGIC;
		qb : out STD_LOGIC
	);
end jk_flip_flop;
architecture jk_flip_flop_arc of jk_flip_flop is
begin
	jkff : process (j,k,clk,reset) is
	variable m : std_logic := '0';
	begin
		if (reset='1') then
			m := '0';
		elsif (falling_edge (clk)) then
			if (j/=k) then
				m := j;
			elsif (j='1' and k='1') then
				m := not m;
			end if;
		end if;
		q <= m;
		qb <= not m;
	end process jkff;
end jk_flip_flop_arc;