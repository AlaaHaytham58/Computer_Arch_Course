library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU_D is
end entity;

architecture sim of tb_ALU_D is
  component ALU_D
    generic (N : integer := 16);
    port(
        A,B  : in  std_logic_vector(N-1 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        F    : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
  end component;

  constant N : integer := 16;

  -- DUT signals
  signal A, B  : std_logic_vector(N-1 downto 0);
  signal S     : std_logic_vector(3 downto 0);
  signal Cin   : std_logic;
  signal F     : std_logic_vector(N-1 downto 0);
  signal Cout  : std_logic;

begin

  uut:  ALU_D
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
    report "==== Starting ALU_D Testbench ====";

    -- TEST 1: Logic shift right 000F -> 0007 Cout=1
    A   <= x"000F";
    S   <= "1100";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"0007" and Cout = '1')
      report "TEST 1 Failed: expected F=0007 Cout=1"
      severity error;
    report "TEST 1 Passed: Logic shift right (000F -> 0007)";

    -- TEST 2: Rotate right 0F0F -> 8787 Cout=1
    A   <= x"0F0F";
    S   <= "1101";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"8787" and Cout = '1')
      report "TEST 2 Failed: expected F=8787 Cout=1"
      severity error;
    report "TEST 2 Passed: Rotate right (0F0F -> 8787)";

    -- TEST 3: Rotate right with Cin=0 0F0F -> 0787 Cout=1
    A   <= x"0F0F";
    S   <= "1110";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"0787" and Cout = '1')
      report "TEST 3 Failed: expected F=0787 Cout=1"
      severity error;
    report "TEST 3 Passed: Rotate right with Cin (0F0F -> 0787)";

    -- TEST 4: Arithmetic shift right F000 -> F800 Cout=0
    A   <= x"F000";
    S   <= "1111";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"F800" and Cout = '0')
      report "TEST 4 Failed: expected F=F800 Cout=0"
      severity error;
    report "TEST 4 Passed: Arithmetic shift right (F000 -> F800)";

    -- TEST 5: Logic shift left 000A -> 0014 Cout=0
    A   <= x"000A";
    S   <= "1000";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"0014" and Cout = '0')
      report "TEST 5 Failed: expected F=0014 Cout=0"
      severity error;
    report "TEST 5 Passed: Logic shift left (000A -> 0014)";

    -- TEST 6: Rotate left 000C -> 0018 Cout=0
    A   <= x"000C";
    S   <= "1001";
    Cin <= '0';
    wait for 100 ns;
    assert (F = x"0018" and Cout = '0')
      report "TEST 6 Failed: expected F=0018 Cout=0"
      severity error;
    report "TEST 6 Passed: Rotate left (000C -> 0018)";

    -- TEST 7: Rotate left with Cin=1 A00A -> 4015 Cout=1
    A   <= x"A00A";
    S   <= "1010";
    Cin <= '1';
    wait for 100 ns;
    assert (F = x"4015" and Cout = '1')
      report "TEST 7 Failed: expected F=4015 Cout=1"
      severity error;
    report "TEST 7 Passed: Rotate left with Cin (A00A -> 4015)";

    -- TEST 8: Rotate right with Cin=1 0F00 -> 8780 Cout=0
    A   <= x"0F00";
    S   <= "1110";
    Cin <= '1';
    wait for 100 ns;
    assert (F = x"8780" and Cout = '0')
      report "TEST 8 Failed: expected F=8780 Cout=0"
      severity error;
    report "TEST 8 Passed: Rotate right with Cin (0F00 -> 8780)";

    report "==== All ALU_D Tests Completed ====";
    wait;
  end process;

end architecture;
