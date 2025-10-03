library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_A is
end entity;

architecture sim of tb_ALU_A is
  constant N : integer := 16; 

  signal A, B   : std_logic_vector(N-1 downto 0);
  signal S      : std_logic_vector(3 downto 0);
  signal Cin    : std_logic;
  signal F      : std_logic_vector(N-1 downto 0);
  signal Cout   : std_logic;

begin

  uut: entity work.ALU_A
    generic map (N => N)
    port map (
      A    => A,
      B    => B,
      S    => S,
      Cin  => Cin,
      F    => F,
      Cout => Cout
    );

  -- Test process
  stim_proc: process
  begin
    report "==== Starting ALU_A Testbench ====";

    -- TEST 1: F=A
    A <= x"0F0F"; B <= (others => '0'); S <= "0000"; Cin <= '0';
    wait for 100 ns;

    -- TEST 2: F=A-B
    A <= x"0F0F"; B <= x"0001"; S <= "0001"; Cin <= '0';
    wait for 100 ns;

    -- TEST 3: F=A-B+1
    A <= x"FFFF"; B <= x"0001"; S <= "0010"; Cin <= '0';
    wait for 100 ns;

    -- TEST 4: F=A-1
    A <= x"FFFF"; B <= (others => '0'); S <= "0011"; Cin <= '0';
    wait for 100 ns;

    -- TEST 5: F=A+1
    A <= x"0F0E"; B <= (others => '0'); S <= "0000"; Cin <= '1';
    wait for 100 ns;

    -- TEST 6: F=A-B-1
    A <= x"FFFF"; B <= x"0001"; S <= "0001"; Cin <= '1';
    wait for 100 ns;

    -- TEST 7: F=A+B+1
    A <= x"0F0F"; B <= x"0001"; S <= "0010"; Cin <= '1';
    wait for 100 ns;

    -- TEST 8: F=B+1
    A <= x"0F0F"; B <= x"0001"; S <= "0011"; Cin <= '1';
    wait for 100 ns;

    report "==== All tests completed ====";
    wait;
  end process;

end architecture;
