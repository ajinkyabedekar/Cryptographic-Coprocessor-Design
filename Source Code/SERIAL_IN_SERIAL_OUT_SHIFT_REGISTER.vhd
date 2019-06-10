library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity siso_behavior is
	port(
		din : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		dout : out STD_LOGIC
	);
end siso_behavior;
architecture siso_behavior_arc of siso_behavior is
begin
	siso : process (clk,din,reset) is
	variable s : std_logic_vector(3 downto 0) := "0000" ;
	begin
		if (reset='1') then
			s := "0000";
		elsif (rising_edge (clk)) then
			s := (din & s(3 downto 1));
		dout <= s(0);
		end if;
	end process siso;
end siso_behavior_arc;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity siso_behavior is
	port(
		din : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		dout : out STD_LOGIC
	);
end siso_behavior;
architecture siso_behavior_arc of siso_behavior is
begin
	siso : process (clk,din,reset) is
	variable s : std_logic_vector(3 downto 0) := "0000" ;
	begin
		if (reset='1') then
			s := "0000";
		elsif (falling_edge (clk)) then
			s := (din & s(3 downto 1));
		dout <= s(0);
		end if;
	end process siso;
end siso_behavior_arc;