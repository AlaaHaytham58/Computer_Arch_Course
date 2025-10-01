Library ieee;
use ieee.std_logic_1164.all;
ENTITY alu IS
    PORT(A,B: IN std_logic_vector(15 DOWNTO 0);
    S: IN std_logic_vector(3 DOWNTO 0);
    F: OUT std_logic_vector(15 DOWNTO 0);
    Cout: OUT std_logic);
END alu;

ARCHITECTURE Part_b OF alu IS
BEGIN
    F <= A AND B WHEN S="0101" ELSE
         A OR B WHEN S="0100" ELSE
         A NOR B WHEN S="0110" ELSE
         NOT A WHEN S="0111" ;
    Cout <='0';
    
        
END Part_b;

