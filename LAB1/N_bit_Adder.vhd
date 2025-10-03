library ieee;
use ieee.std_logic_1164.all;

entity n_adder is
  generic (N : integer := 16);  
  port (
    A, B : in  std_logic_vector(N-1 downto 0);
    Cin  : in  std_logic;
    Sum  : out std_logic_vector(N-1 downto 0);
    Cout : out std_logic
  );
end entity;

architecture structural of n_adder is
  constant BLOCKS : integer := N/4;  
  signal carry : std_logic_vector(BLOCKS downto 0);
  component four_bit_adder
    port (
      A    : in  std_logic_vector(3 downto 0);
      B    : in  std_logic_vector(3 downto 0);
      Cin  : in  std_logic;
      Sum  : out std_logic_vector(3 downto 0);
      Cout : out std_logic
    );
  end component;
    component carry_adder
        port (
        A    : in  std_logic_vector(3 downto 0);
        B    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        Sum  : out std_logic_vector(3 downto 0);
        Cout : out std_logic
        );
    end component;
begin
  carry(0) <= Cin;

  -- ripple adder
  ripple_block: four_bit_adder
    port map (
      A    => A(3 downto 0),
      B    => B(3 downto 0),
      Cin  => carry(0),
      Sum  => Sum(3 downto 0),
      Cout => carry(1)
    );

  -- carry select adders
  gen_blocks: for i in 1 to BLOCKS-1 generate
    block_inst: carry_adder
      port map (
        A    => A(i*4+3 downto i*4),
        B    => B(i*4+3 downto i*4),
        Cin  => carry(i),
        Sum  => Sum(i*4+3 downto i*4),
        Cout => carry(i+1)
      );
  end generate;

  Cout <= carry(BLOCKS);
end architecture;
