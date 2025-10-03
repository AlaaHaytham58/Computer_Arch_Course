library ieee;
use ieee.std_logic_1164.all;

entity ALU_D is
    generic (N : integer := 16);
    port(
        A,B  : in  std_logic_vector(N-1 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
end ALU_D;

architecture Part_d of ALU_D is
begin
    process(A, B, S, Cin)
    begin
        case S is
          
            when "1100" =>
                F    <= '0' & A(N-1 downto 1);
                Cout <= A(0);

            
            when "1101" =>
                F    <= A(0) & A(N-1 downto 1);
                Cout <= A(0);

            
            when "1110" =>
                F    <= Cin & A(N-1 downto 1);
                Cout <= A(0);

           
            when "1111" =>
                F    <= A(N-1) & A(N-1 downto 1);
                Cout <= A(0);

   
            when others =>
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Part_d;
