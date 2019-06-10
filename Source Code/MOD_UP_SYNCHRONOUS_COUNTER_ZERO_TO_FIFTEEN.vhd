library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity JK_Flipflop is
	port ( clk: in std_logic;
	      J, K: in std_logic;
	   Q, Qbar: out std_logic;
	     reset: in std_logic
	);
end JK_Flipflop;
architecture Behavioral of JK_Flipflop is
	signal qtemp,qbartemp : std_logic :='0';
begin
	Q <= qtemp;
	Qbar <= qbartemp;
	process(clk,reset)
	begin
		if(reset = '1') then           --Reset the output.
			qtemp <= '0';
			qbartemp <= '1';
		elsif( rising_edge(clk) ) then
			if(J='0' and K='0') then       --No change in the output
				NULL;
			elsif(J='0' and K='1') then    --Set the output.
				qtemp <= '0';
				qbartemp <= '1';
			elsif(J='1' and K='0') then    --Reset the output.
				qtemp <= '1';
				qbartemp <= '0';
			else                           --Toggle the output.
				qtemp <= not qtemp;
				qbartemp <= not qbartemp;
			end if;
		end if;
	end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity syn_count4 is
	port ( clk: in std_logic;
	     reset: in std_logic;
	  counter : out std_logic_vector(3 downto 0)
	);
end syn_count4;
architecture Behavioral of syn_count4 is
	signal J3,J4,Q1,Q2,Q3,Q4,Qbar1,Qbar2,Qbar3,Qbar4 : std_logic :='0';
begin
	J3 <= Q1 and Q2;
	J4<= J3 and Q3;
	FF1 : entity work.JK_Flipflop port map (clk,'1','1',Q1,Qbar1,reset);
	FF2 : entity work.JK_Flipflop port map (clk,Q1,Q1,Q2,Qbar2,reset);
	FF3 : entity work.JK_Flipflop port map (clk,J3,J3,Q3,Qbar3,reset);
	FF4 : entity work.JK_Flipflop port map (clk,J4,J4,Q4,Qbar4,reset);
	counter <= Q4 & Q3 & Q2 & Q1;
end Behavioral;