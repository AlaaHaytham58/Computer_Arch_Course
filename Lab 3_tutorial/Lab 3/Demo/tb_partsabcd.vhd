Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_partsabcd is
GENERIC (n : integer := 16);
end entity;

Architecture mytb_partsabcd of tb_partsabcd is

	component ALUpartsabcd is
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

UI: ALUpartsabcd GENERIC MAP (16) port map (tCin,tS,tA,tB,tF,tCout);

process
begin

tCin <= '0';

--testcase: S = 0000 , Cin = 0
tS <=  "0000";
tA <= x"0F0F";
tB <= x"----";
wait for 1 ns;
assert(tF = x"0F0F")
					report  "Error in testcase: S = 0000 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
						& " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0000 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 0001 , Cin = 0
tS <=  "0001";
tA <= x"0F0F";
tB <= x"0001";
wait for 1 ns;
assert(tF = x"0F0E")
					report  "Error in testcase: S = 0001 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0001 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 0010 , Cin = 0
tS <=  "0010";
tA <= x"FFFF";
tB <= x"0001";
wait for 1 ns;
assert(tF = x"FFFF")
					report  "Error in testcase: S = 0010 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0010 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

--testcase: S = 0011 , Cin = 0
tS <=  "0011";
tA <= x"FFFF";
tB <= x"----";
wait for 1 ns;
assert(tF = x"FFFE")
					report  "Error in testcase: S = 0011 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0011 , Cin = 0"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;

tCin <= '1';

--testcase: S = 0000 , Cin = 1
tS <=  "0000";
tA <= x"0F0E";
tB <= x"----";
wait for 1 ns;
assert(tF = x"0F0F")
					report  "Error in testcase: S = 0000 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
					severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0000 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
					severity error;
--testcase: S = 0001 , Cin = 1
tS <=  "0001";
tA <= x"FFFF";
tB <= x"0001";
wait for 1 ns;
assert(tF = x"FFFD")
					report  "Error in testcase: S = 0001 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0001 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
					severity error;
--testcase: S = 0010 , Cin = 1
tS <=  "0010";
tA <= x"0F0F";
tB <= x"0001";
wait for 1 ns;
assert(tF = x"0F11")
					report  "Error in testcase: S = 0010 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0010 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
--testcase: S = 0011 , Cin = 1
tS <=  "0011";
tA <= x"0F0F";
tB <= x"0001";
wait for 1 ns;
assert(tF = x"0002")
					report  "Error in testcase: S = 0011 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;
wait for 1 ns;
assert(tCout = '0')
					report  "Error in testcase: S = 0011 , Cin = 1"
						& " Cin: "  & STD_LOGIC'image(tCin)
						& " S: "    & to_hstring(tS)
			      	    & " A: "    & to_hstring(tA)
			            & " B: "    & to_hstring(tB)
			            & " F: "    & to_hstring(tF)
			            & " Cout: " & STD_LOGIC'image(tCout)
			        severity error;


tCin <= 'X';

--testcase: S = 0100
tS <=  "0100";
tA <= x"F000";
tB <= x"00B0";
wait for 1 ns;
assert(tF = x"F0B0")	 report" Cin: "  & STD_LOGIC'image(tCin)
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
assert(tF = x"0000") 	report" Cin: "  & STD_LOGIC'image(tCin)
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
assert(tF = x"0FFF") 	report" Cin: "  & STD_LOGIC'image(tCin)
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
assert(tF = x"0FFF")	report" Cin: "  & STD_LOGIC'image(tCin)
							& " S: "    & to_hstring(tS)
							& " A: "    & to_hstring(tA)
			                & " B: "    & to_hstring(tB)
			                & " F: "    & to_hstring(tF)
			                & " Cout: " & STD_LOGIC'image(tCout)
						severity error;

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
tS <= "1010";
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

end mytb_partsabcd;
