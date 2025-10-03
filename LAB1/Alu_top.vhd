library ieee;
use ieee.std_logic_1164.all;

entity alu_top is
    port(
        A,B  : in  std_logic_vector(15 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
end alu_top;

architecture top of alu_top is
    signal F_B, F_C, F_D : std_logic_vector(15 downto 0);
    signal Cout_B, Cout_C, Cout_D : std_logic;

    component ALU_B
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;

    component ALU_C
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;

    component ALU_D
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;
begin
    uB: ALU_B port map(A=>A, B=>B, S=>S, F=>F_B, Cout=>Cout_B);
    uC: ALU_C port map(A=>A, B=>B, S=>S, Cin=>Cin, F=>F_C, Cout=>Cout_C);
    uD: ALU_D port map(A=>A, B=>B, S=>S, Cin=>Cin, F=>F_D, Cout=>Cout_D);

    WITH S(3 DOWNTO 2) SELECT
        F <= F_B WHEN "01",
                 F_C WHEN "10",
                 F_D WHEN "11",
                 (others => '0') WHEN others;
    WITH S(3 DOWNTO 2) SELECT    
        Cout <= Cout_B WHEN "00",
                    Cout_C WHEN "01",
                    Cout_D WHEN "10",
                    '0' WHEN others;
        
end top;