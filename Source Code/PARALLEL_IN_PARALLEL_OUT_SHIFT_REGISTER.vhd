library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity pipo_behavior is
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		din : in STD_LOGIC_VECTOR(3 downto 0);
		dout : out STD_LOGIC_VECTOR(3 downto 0)
	);
end pipo_behavior;
architecture pipo_behavior_arc of pipo_behavior is
begin
	pipo : process (clk,din,reset) is
	begin
		if (reset='1') then
			dout <= "0000";
		elsif (rising_edge (clk)) then
			dout <= din;
		end if;
	end process pipo;
end pipo_behavior_arc;