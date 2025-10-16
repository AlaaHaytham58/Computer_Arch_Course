library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU_C is
end entity;

architecture behavioral of tb_ALU_C is
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

    constant N : integer := 16;
    signal A, B   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal S      : std_logic_vector(3 downto 0) := (others => '0');
    signal Cin    : std_logic := '0';
    signal F      : std_logic_vector(N-1 downto 0);
    signal Cout   : std_logic;
begin
    -- DUT
    uut: ALU_C
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
        report "==== Starting ALU_C Testbench ====";

        -- TEST 1: Logic shift left A00A -> 4014 Cout=1
        A   <= x"A00A";
        S   <= "1000";
        Cin <= '0';
        wait for 100 ns;
        assert (F = x"4014" and Cout = '1')
            report "TEST 1 Failed: expected F=4014 Cout=1"
            severity error;
        report "TEST 1 Passed: Logic shift left (A00A -> 4014)";

        -- TEST 2: Rotate left B00C -> 6019 Cout=1
        A   <= x"B00C";
        S   <= "1001";
        Cin <= '0';
        wait for 100 ns;
        assert (F = x"6019" and Cout = '1')
            report "TEST 2 Failed: expected F=6019 Cout=1"
            severity error;
        report "TEST 2 Passed: Rotate left (B00C -> 6019)";

        -- TEST 3: Rotate left with Cin=0 A00A -> 4014 Cout=1
        A   <= x"A00A";
        S   <= "1010";
        Cin <= '0';
        wait for 100 ns;
        assert (F = x"4014" and Cout = '1')
            report "TEST 3 Failed: expected F=4014 Cout=1"
            severity error;
        report "TEST 3 Passed: Rotate left with Cin (A00A -> 4014)";

        -- TEST 4: Clear A00A -> 0000 Cout=0
        A   <= x"A00A";
        S   <= "1011";
        Cin <= '0';
        wait for 100 ns;
        assert (F = x"0000" and Cout = '0')
            report "TEST 4 Failed: expected F=0000 Cout=0"
            severity error;
        report "TEST 4 Passed: Clear (A00A -> 0000)";

        report "==== All ALU_C Tests Completed ====";
        wait;
    end process;
end architecture;
