library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU_D is
end entity;

architecture sim of tb_ALU_D is
  constant N : integer := 16;

  -- DUT signals
  signal A, B  : std_logic_vector(N-1 downto 0);
  signal S     : std_logic_vector(3 downto 0);
  signal Cin   : std_logic;
  signal F     : std_logic_vector(N-1 downto 0);
  signal Cout  : std_logic;

begin

  uut: entity work.ALU_D
    generic map (N => N)
    port map (
      A    => A,
      B    => B,
      S    => S,
      Cin  => Cin,
      F    => F,
      Cout => Cout
    );

  stim_proc: process
  begin
    -- TEST 1: Logical shift right, fill with 0 (S=1100)
    A   <= x"8001";  
    S   <= "1100";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 2: Rotate right (S=1101)
    A   <= x"8001"; 
    S   <= "1101";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 3: Shift right with Cin in (S=1110)
    A   <= x"1234";
    S   <= "1110";
    Cin <= '1';
    wait for 100 ns;

    -- TEST 4: Arithmetic shift right (S=1111)
    A   <= x"F234";  
    S   <= "1111";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 5: Undefined/other code
    A   <= x"0F0F";
    S   <= "1010";
    Cin <= '1';
    wait for 100 ns;

    wait; -- stop simulation
  end process;

end architecture;
