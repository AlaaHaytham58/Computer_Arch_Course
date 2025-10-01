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

architecture Part_c of alu is
begin
    process(A, B, S, Cin)   
    begin
        case S is
            when "1000" =>
                F    <= A(14 downto 0) & '0';
                Cout <= A(15);

            when "1001" =>
                F    <= A(14 downto 0) & A(15);
                Cout <= A(15);

            when "1010" =>
                F    <= A(14 downto 0) & Cin;
                Cout <= A(15);

            when "1011" =>
                F    <= (others => '0');
                Cout <= '0';

            when others =>
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Part_c;
