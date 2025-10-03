library ieee;
use ieee.std_logic_1164.all;

entity ALU_C is
    generic (N : integer := 16);
    port(
        A,B  : in  std_logic_vector(N-1 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
end ALU_C;

architecture Part_c of ALU_C is
begin
    process(A, B, S, Cin)   
    begin
        case S is
            when "1000" =>
                F    <= A(N-2 downto 0) & '0';
                Cout <= A(N-1);

            when "1001" =>
                F    <= A(N-2 downto 0) & A(N-1);
                Cout <= A(N-1);

            when "1010" =>
                F    <= A(N-2 downto 0) & Cin;
                Cout <= A(N-1);

            when "1011" =>
                F    <= (others => '0');
                Cout <= '0';

            when others =>
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Part_c;
