Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_partb is
GENERIC (n : integer := 16);
end entity;

Architecture mytb_partb of tb_partb is

	component ALUpartb is
	GENERIC (n : integer := 16);
	PORT(
			Cin		:IN  STD_LOGIC;
			S		:IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			A,B		:IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			F		:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			Cout	:OUT STD_LOGIC
	);

	end component;

	SIGNAL tCin		: std_logic;
	SIGNAL tS		: std_logic_vector(3 DOWNTO 0);
	SIGNAL tA,tB,tF	: std_logic_vector(n-1 DOWNTO 0);
	SIGNAL tCout	: std_logic;

begin

UI: ALUpartb GENERIC MAP (16) port map (tCin,tS,tA,tB,tF,tCout);

process
begin

tCin <= 'X';

--testcase: S = 0100
tS <=  "0100";
tA <= x"F000";
tB <= x"00B0";
wait for 1 ns;
assert(tF = x"F0B0")	report" Cin: "  & STD_LOGIC'image(tCin)
							& " S: "    & to_hstring(tS)
							& " A: "    & to_hstring(tA)
							& " B: "    & to_hstring(tB)
							& " F: "    & to_hstring(tF)
							& " Cout: " & STD_LOGIC'image(tCout)
						severity error;

--testcase: S = 0101
tS <=  "0101";
tA <= x"F000";
tB <= x"000B";
wait for 1 ns;
assert(tF = x"0000")	report" Cin: "  & STD_LOGIC'image(tCin)
							& " S: "    & to_hstring(tS)
							& " A: "    & to_hstring(tA)
							& " B: "    & to_hstring(tB)
							& " F: "    & to_hstring(tF)
							& " Cout: " & STD_LOGIC'image(tCout)
						severity error;

--testcase: S = 0110
tS <=  "0110";
tA <= x"F000";
tB <= x"B000";
wait for 1 ns;
assert(tF = x"0FFF")	report" Cin: "  & STD_LOGIC'image(tCin)
							& " S: "    & to_hstring(tS)
							& " A: "    & to_hstring(tA)
							& " B: "    & to_hstring(tB)
							& " F: "    & to_hstring(tF)
							& " Cout: " & STD_LOGIC'image(tCout)
						severity error;

--testcase: S = 0111
tS <=  "0111";
tA <= x"F000";
tB <= x"----";
wait for 1 ns;
assert(tF = x"0FFF") 	report" Cin: "  & STD_LOGIC'image(tCin)
							& " S: "    & to_hstring(tS)
							& " A: "    & to_hstring(tA)
							& " B: "    & to_hstring(tB)
							& " F: "    & to_hstring(tF)
							& " Cout: " & STD_LOGIC'image(tCout)
						severity error;

wait;

end process;

end mytb_partb;
