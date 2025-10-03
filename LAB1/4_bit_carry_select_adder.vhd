library ieee;
use ieee.std_logic_1164.all;

entity carry_adder is
port (
    A, B : in  std_logic_vector(3 downto 0);
    Cin  : in  std_logic;
    Sum  : out std_logic_vector(3 downto 0);
    Cout : out std_logic
  );
end carry_adder;

architecture structure of carry_adder is 
  component four_bit_adder
    port (
      A    : in  std_logic_vector(3 downto 0);
      B    : in  std_logic_vector(3 downto 0);
      Cin  : in  std_logic;
      Sum  : out std_logic_vector(3 downto 0);
      Cout : out std_logic
    );
  end component;

  signal sum0, sum1 : std_logic_vector(3 downto 0);
  signal cout0, cout1 : std_logic;
  
  begin 
    option1:four_bit_adder port map(A => A, B => B, Cin => '0', Sum => sum0, Cout => cout0);
    option2:four_bit_adder port map(A => A, B => B, Cin => '1', Sum => sum1, Cout => cout1);
--selector mux
    Sum  <= sum0 when Cin='0' else sum1;
    Cout <= cout0 when Cin='0' else cout1;
end structure;