library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_A is
end entity;

architecture behavioral of tb_ALU_A is
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

    constant N : integer := 16;
    signal A, B   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal S      : std_logic_vector(3 downto 0) := (others => '0');
    signal Cin    : std_logic := '0';
    signal F      : std_logic_vector(N-1 downto 0);
    signal Cout   : std_logic;
begin
    -- DUT
    uut: ALU_A
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
        report "==== Starting ALU_A Testbench ====";

        -- TEST 1: F = A -> 0F0F Cout=0
        A <= x"0F0F"; B <= (others => '0'); S <= "0000"; Cin <= '0';
        wait for 100 ns;
        assert (F = x"0F0F" and Cout = '0')
            report "TEST 1 Failed: expected F=0F0F Cout=0"
            severity error;
        report "TEST 1 Passed: F = A (0F0F)";

        -- TEST 2: F = A - B -> 0F0E Cout=0
        A <= x"0F0F"; B <= x"0001"; S <= "0001"; Cin <= '0';
        wait for 100 ns;
        assert (F = x"0F0E" and Cout = '0')
            report "TEST 2 Failed: expected F=0F0E Cout=0"
            severity error;
        report "TEST 2 Passed: F = A - B (0F0F - 0001)";

        -- TEST 3: F = A - B + 1 -> FFFF Cout=0
        A <= x"FFFF"; B <= x"0001"; S <= "0010"; Cin <= '0';
        wait for 100 ns;
        assert (F = x"FFFF" and Cout = '0')
            report "TEST 3 Failed: expected F=FFFF Cout=0"
            severity error;
        report "TEST 3 Passed: F = A - B + 1 (FFFF - 0001 + 1)";

        -- TEST 4: F = A - 1 -> FFFE Cout=0
        A <= x"FFFF"; B <= (others => '0'); S <= "0011"; Cin <= '0';
        wait for 100 ns;
        assert (F = x"FFFE" and Cout = '0')
            report "TEST 4 Failed: expected F=FFFE Cout=0"
            severity error;
        report "TEST 4 Passed: F = A - 1 (FFFF - 1)";

        -- TEST 5: F = A + 1 -> 0F0F Cout=0
        A <= x"0F0E"; B <= (others => '0'); S <= "0000"; Cin <= '1';
        wait for 100 ns;
        assert (F = x"0F0F" and Cout = '0')
            report "TEST 5 Failed: expected F=0F0F Cout=0"
            severity error;
        report "TEST 5 Passed: F = A + 1 (0F0E + 1)";

        -- TEST 6: F = A - B - 1 -> FFFD Cout=0
        A <= x"FFFF"; B <= x"0001"; S <= "0001"; Cin <= '1';
        wait for 100 ns;
        assert (F = x"FFFD" and Cout = '0')
            report "TEST 6 Failed: expected F=FFFD Cout=0"
            severity error;
        report "TEST 6 Passed: F = A - B - 1 (FFFF - 0001 - 1)";

        -- TEST 7: F = A + B + 1 -> 0F11 Cout=0
        A <= x"0F0F"; B <= x"0001"; S <= "0010"; Cin <= '1';
        wait for 100 ns;
        assert (F = x"0F11" and Cout = '0')
            report "TEST 7 Failed: expected F=0F11 Cout=0"
            severity error;
        report "TEST 7 Passed: F = A + B + 1 (0F0F + 0001 + 1)";

        -- TEST 8: F = B + 1 -> 0002 Cout=0
        A <= x"0F0F"; B <= x"0001"; S <= "0011"; Cin <= '1';
        wait for 100 ns;
        assert (F = x"0002" and Cout = '0')
            report "TEST 8 Failed: expected F=0002 Cout=0"
            severity error;
        report "TEST 8 Passed: F = B + 1 (0001 + 1)";

        report "==== All ALU_A Tests Completed ====";
        wait;
    end process;
end architecture;
