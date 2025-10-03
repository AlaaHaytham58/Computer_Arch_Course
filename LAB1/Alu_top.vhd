library ieee;
use ieee.std_logic_1164.all;

entity alu_top is
    generic (N : integer := 16);
    port(
        A,B  : in  std_logic_vector(N-1 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
end alu_top;

architecture top of alu_top is
    signal F_B, F_C, F_D, F_A : std_logic_vector(N-1 downto 0);
    signal Cout_B, Cout_C, Cout_D, Cout_A : std_logic;
    component ALU_A
      generic (N : integer := 16);
      port (
        A, B  : in  std_logic_vector(N-1 downto 0);
        S     : in  std_logic_vector(3 downto 0);
        Cin   : in  std_logic;
        F     : out std_logic_vector(N-1 downto 0);
        Cout  : out std_logic
      );
    end component;
    component ALU_B
      generic (N : integer := 16);
      port (
        A, B  : in  std_logic_vector(N-1 downto 0);
        S     : in  std_logic_vector(3 downto 0);
        F     : out std_logic_vector(N-1 downto 0);
        Cout  : out std_logic
      );
    end component;
    component ALU_C
      generic (N : integer := 16);
      port (
        A, B  : in  std_logic_vector(N-1 downto 0);
        S     : in  std_logic_vector(3 downto 0);
        Cin   : in  std_logic;
        F     : out std_logic_vector(N-1 downto 0);
        Cout  : out std_logic
      );
    end component;
    component ALU_D
      generic (N : integer := 16);
      port (
        A, B  : in  std_logic_vector(N-1 downto 0);
        S     : in  std_logic_vector(3 downto 0);
        Cin   : in  std_logic;
        F     : out std_logic_vector(N-1 downto 0);
        Cout  : out std_logic
      );
    end component;
begin
    uA: ALU_A
      generic map ( N => N )
      port map ( A => A, B => B, S => S, Cin => Cin, F => F_A, Cout => Cout_A );

    uB: ALU_B
      generic map ( N => N )
      port map ( A => A, B => B, S => S, F => F_B, Cout => Cout_B );

    uC: ALU_C
      generic map ( N => N )
      port map ( A => A, B => B, S => S, Cin => Cin, F => F_C, Cout => Cout_C );

    uD: ALU_D
      generic map ( N => N )
      port map ( A => A, B => B, S => S, Cin => Cin, F => F_D, Cout => Cout_D );

    -- Multiplex final output by top 2 bits of S
    with S(3 downto 2) select
        F <= F_A when "00",
             F_B when "01",
             F_C when "10",
             F_D when "11",
             (others => '0') when others;

    with S(3 downto 2) select
        Cout <= Cout_A when "00",
                Cout_B when "01",
                Cout_C when "10",
                Cout_D when "11",
                '0' when others;
end top;
