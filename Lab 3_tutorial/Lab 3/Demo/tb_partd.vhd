Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_partd is
GENERIC (n : integer := 16);
end entity;

Architecture mytb_partd of tb_partd is

	component ALUpartd is
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

UI: ALUpartd GENERIC MAP (16) port map (tCin,tS,tA,tB,tF,tCout);

process
begin

tCin <= 'X';
tB <= x"----";

--testcase: S = 1100 , A = 000F
tS <=  "1100";
tA <= x"000F";
wait for 1 ns;
assert(tF = x"0007")
					report  "Error in testcase: S = 1100 , A = 000F"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1100 , A = 000F"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1101 , A = 0F0F
tS <=  "1101";
tA <= x"0F0F";
wait for 1 ns;
assert(tF = x"8787")
					report  "Error in testcase: S = 1101 , A = 0F0F"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1101 , A = 0F0F"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1110 , A = 0F0F
tCin <= '0';
tS <=  "1110";
tA <= x"0F0F";
wait for 1 ns;
assert(tF = x"0787")
					report  "Error in testcase: S = 1110 , A = 0F0F , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			         severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1110 , A = 0F0F , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1111 , A = F000
tCin <= 'X';
tS <=  "1111";
tA <= x"F000";
wait for 1 ns;
assert(tF = x"F800")
					report  "Error in testcase: S = 1111 , A = F000"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 1111 , A = F000"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1110 , A = 0F00 , Cin = 1
tCin <= '1';
tS <=  "1110";
tA <= x"0F00";
wait for 1 ns;
assert(tF = x"8780")
					report  "Error in testcase: S = 1110 , A = 0F00 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 1110 , A = 0F00 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

wait;

end process;

end mytb_partd;
