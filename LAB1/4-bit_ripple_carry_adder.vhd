library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder is
port (
    A,B :IN std_logic_vector(3 DOWNTO 0);
    Cin: IN std_logic;
    Sum: out std_logic_vector(3 DOWNTO 0);
    Cout: out std_logic
);
end four_bit_adder;
architecture structure of four_bit_adder is
   signal result : unsigned(4 downto 0);
begin
  result  <= ('0' & unsigned(A)) + ('0' & unsigned(B)) + ("0000" & Cin);
  Sum  <= std_logic_vector(result(3 downto 0));
  Cout <= result(4);
  
end architecture;
