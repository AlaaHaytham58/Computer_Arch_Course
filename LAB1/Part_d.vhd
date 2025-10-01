library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        A,B  : in  std_logic_vector(15 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
end alu;

architecture Part_d of alu is
begin
    process(A, B, S, Cin)
    begin
        case S is
          
            when "1100" =>
                F    <= '0' & A(15 downto 1);
                Cout <= A(0);

            
            when "1101" =>
                F    <= A(0) & A(15 downto 1);
                Cout <= A(0);

            
            when "1110" =>
                F    <= Cin & A(15 downto 1);
                Cout <= A(0);

           
            when "1111" =>
                F    <= A(15) & A(15 downto 1);
                Cout <= A(0);

   
            when others =>
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Part_d;
