library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity sipo_behavior is
	port(
		din : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		dout : out STD_LOGIC_VECTOR(3 downto 0)
	);
end sipo_behavior;
architecture sipo_behavior_arc of sipo_behavior is
begin
	sipo : process (clk,din,reset) is
	variable s : std_logic_vector(3 downto 0) := "0000" ;
	begin
		if (reset='1') then
			s := "0000";
		elsif (rising_edge (clk)) then
			s := (din & s(3 downto 1));
		end if;
		dout <= s;
	end process sipo;
end sipo_behavior_arc;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity sipo_behavior is
	port(
		din : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		dout : out STD_LOGIC_VECTOR(3 downto 0)
	);
end sipo_behavior;
architecture sipo_behavior_arc of sipo_behavior is
begin
	sipo : process (clk,din,reset) is
	variable s : std_logic_vector(3 downto 0) := "0000" ;
	begin
		if (reset='1') then
			s := "0000";
		elsif (falling_edge (clk)) then
			s := (din & s(3 downto 1));
		end if;
		dout <= s;
	end process sipo;
end sipo_behavior_arc;