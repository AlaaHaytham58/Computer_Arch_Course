Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_partc is
GENERIC (n : integer := 16);
end entity;

Architecture mytb_partc of tb_partc is

	component ALUpartc is
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

UI: ALUpartc GENERIC MAP (16) port map (tCin,tS,tA,tB,tF,tCout);

process
begin

tCin <= 'X';
tB <= x"----";

--testcase: S = 1000 , A = A00A
tS <=  "1000";
tA <= x"A00A";
wait for 1 ns;
assert(tF = x"4014")
					report  "Error in testcase: S = 1000 , A = A00A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1000 , A = A00A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1000 , A = 000A
tS <=  "1000";
tA <= x"000A";
wait for 1 ns;
assert(tF = x"0014")
					report  "Error in testcase: S = 1000 , A = 000A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 1000 , A = 000A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1001 , A = B00C
tS <=  "1001";
tA <= x"B00C";
wait for 1 ns;
assert(tF = x"6019")
					report  "Error in testcase: S = 1001 , A = B00C"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1001 , A = B00C"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1001 , A = 000C
tS <=  "1001";
tA <= x"000C";
wait for 1 ns;
assert(tF = x"0018")
					report  "Error in testcase: S = 1001 , A = 000C"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 1001 , A = 000C"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1010 , A = A00A , Cin = 0
tCin <= '0';
tS <=  "1010";
tA <= x"A00A";
wait for 1 ns;
assert(tF = x"4014")
					report  "Error in testcase: S = 1010 , A = A00A , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1010 , A = A00A , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1010 , A = A00A , Cin = 1
tCin <= '1';
tS <=  "1010";
tA <= x"A00A";
wait for 1 ns;
assert(tF = x"4015")
					report  "Error in testcase: S = 1010 , A = A00A , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '1')
					report  "Error in testcase: S = 1010 , A = A00A , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 1011 , A = A00A
tCin <= 'X';
tS <=  "1011";
tA <= x"A00A";
wait for 1 ns;
assert(tF = x"0000")
					report  "Error in testcase: S = 1011 , A = A00A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 1011 , A = A00A"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

wait;

end process;

end mytb_partc;
