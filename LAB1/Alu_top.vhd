library ieee;
use ieee.std_logic_1164.all;

entity alu_top is
    port(
        A,B  : in  std_logic_vector(15 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Sel  : in  std_logic_vector(1 downto 0); 
        Cin  : in  std_logic;
        F    : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
end alu_top;

architecture top of alu_top is
    signal F_B, F_C, F_D : std_logic_vector(15 downto 0);
    signal Cout_B, Cout_C, Cout_D : std_logic;

    component Part_b
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;

    component Part_c
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;

    component Part_d
        port(A,B: in std_logic_vector(15 downto 0);
             S: in std_logic_vector(3 downto 0);
             Cin: in std_logic;
             F: out std_logic_vector(15 downto 0);
             Cout: out std_logic);
    end component;
begin
    uB: Part_b port map(A=>A, B=>B, S=>S, Cin=>Cin, F=>F_B, Cout=>Cout_B);
    uC: Part_c port map(A=>A, B=>B, S=>S, Cin=>Cin, F=>F_C, Cout=>Cout_C);
    uD: Part_d port map(A=>A, B=>B, S=>S, Cin=>Cin, F=>F_D, Cout=>Cout_D);

    process(Sel, F_B, F_C, F_D, Cout_B, Cout_C, Cout_D)
    begin
        case Sel is
            when "01" =>   --  Part B
                F    <= F_B;
                Cout <= Cout_B;
            when "10" =>   --  Part C
                F    <= F_C;
                Cout <= Cout_C;
            when "11" =>   --  Part D
                F    <= F_D;
                Cout <= Cout_D;
            when others => 
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end top;
