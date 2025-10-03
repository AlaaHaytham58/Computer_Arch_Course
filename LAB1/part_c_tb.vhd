library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU_C is
end entity;

architecture sim of tb_ALU_C is
  constant N : integer := 16;

  -- DUT signals
  signal A, B  : std_logic_vector(N-1 downto 0);
  signal S     : std_logic_vector(3 downto 0);
  signal Cin   : std_logic;
  signal F     : std_logic_vector(N-1 downto 0);
  signal Cout  : std_logic;

begin
  -- DUT instantiation
  uut: entity work.ALU_C
    generic map (N => N)
    port map (
      A    => A,
      B    => B,
      S    => S,
      Cin  => Cin,
      F    => F,
      Cout => Cout
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- TEST 1: Shift left with '0' (S=1000)
    A   <= x"8001";  
    S   <= "1000";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 2: Shift left with MSB copy (S=1001)
    A   <= x"8001";  
    S   <= "1001";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 3: Shift left with Cin in (S=1010)
    A   <= x"1234";
    S   <= "1010";
    Cin <= '1';
    wait for 100 ns;

    -- TEST 4: Clear (S=1011)
    A   <= x"ABCD";
    S   <= "1011";
    Cin <= '0';
    wait for 100 ns;

    -- TEST 5: Undefined/other code
    A   <= x"0F0F";
    S   <= "1111";
    Cin <= '1';
    wait for 100 ns;

    wait; -- stop simulation
  end process;

end architecture;
