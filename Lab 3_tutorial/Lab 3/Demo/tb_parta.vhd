Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_parta is
GENERIC (n : integer := 16);
end entity;

Architecture mytb_parta of tb_parta is

	component ALUparta is
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

UI: ALUparta GENERIC MAP (16) port map (tCin,tS,tA,tB,tF,tCout);

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

wait;

end process;

end mytb_parta;
