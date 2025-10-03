Library ieee;
use ieee.std_logic_1164.all;
ENTITY ALU_B IS
    PORT(A,B: IN std_logic_vector(15 DOWNTO 0);
    S: IN std_logic_vector(3 DOWNTO 0);
    F: OUT std_logic_vector(15 DOWNTO 0);
    Cout: OUT std_logic);
END ALU_B;

ARCHITECTURE Part_b OF ALU_B IS
BEGIN
    F <= A AND B WHEN S="0101" ELSE
         A OR B WHEN S="0100" ELSE
         A NOR B WHEN S="0110" ELSE
         NOT A WHEN S="0111" ELSE
         (others => '0');
    Cout <='0';
    
        
END Part_b;

