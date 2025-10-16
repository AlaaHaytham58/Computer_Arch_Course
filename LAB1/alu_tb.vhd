library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end entity;

architecture sim of alu_tb is
    component alu_top
        generic (N : integer := 16);
        port(
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
    uut: alu_top
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
        report "==== Starting ALU_TOP Testbench ====";

        
        -- ALU A TESTS (S(3 downto 2) = "00")
        
        report "---- Testing ALU_A ----";

        -- TEST 1: F=A (0000)
        A <= x"0F0F"; B <= (others => '0'); Cin <= '0'; S <= "0000";
        wait for 100 ns;
        assert (F = x"0F0F" and Cout = '0')
            report "TEST A1 Failed: expected F=0F0F Cout=0"
            severity error;
        report "TEST A1 Passed: F=A";

        -- TEST 2: F=A-B (0001)
        A <= x"0F0F"; B <= x"0001"; Cin <= '0'; S <= "0001";
        wait for 100 ns;
        assert (F = x"0F0E" and Cout = '0')
            report "TEST A2 Failed: expected F=0F0E Cout=0"
            severity error;
        report "TEST A2 Passed: F=A-B";

        -- TEST 3: F=A-B+1 (0010)
        A <= x"FFFF"; B <= x"0001"; Cin <= '0'; S <= "0010";
        wait for 100 ns;
        assert (F = x"FFFF" and Cout = '0')
            report "TEST A3 Failed: expected F=FFFF Cout=0"
            severity error;
        report "TEST A3 Passed: F=A-B+1";

        -- TEST 4: F=A-1 (0011)
        A <= x"FFFF"; B <= (others => '0'); Cin <= '0'; S <= "0011";
        wait for 100 ns;
        assert (F = x"FFFE" and Cout = '0')
            report "TEST A4 Failed: expected F=FFFE Cout=0"
            severity error;
        report "TEST A4 Passed: F=A-1";

        -- TEST 5: F=A+1 (0100)
        A <= x"0F0E"; B <= (others => '0'); Cin <= '1'; S <= "0100";
        wait for 100 ns;
        assert (F = x"0F0F" and Cout = '0')
            report "TEST A5 Failed: expected F=0F0F Cout=0"
            severity error;
        report "TEST A5 Passed: F=A+1";

        -- TEST 6: F=A-B-1 (0101)
        A <= x"FFFF"; B <= x"0001"; Cin <= '1'; S <= "0101";
        wait for 100 ns;
        assert (F = x"FFFD" and Cout = '0')
            report "TEST A6 Failed: expected F=FFFD Cout=0"
            severity error;
        report "TEST A6 Passed: F=A-B-1";

        -- TEST 7: F=A+B+1 (0110)
        A <= x"0F0F"; B <= x"0001"; Cin <= '1'; S <= "0110";
        wait for 100 ns;
        assert (F = x"0F11" and Cout = '0')
            report "TEST A7 Failed: expected F=0F11 Cout=0"
            severity error;
        report "TEST A7 Passed: F=A+B+1";

        -- TEST 8: F=B+1 (0111)
        A <= x"0F0F"; B <= x"0001"; Cin <= '1'; S <= "0111";
        wait for 100 ns;
        assert (F = x"0002" and Cout = '0')
            report "TEST A8 Failed: expected F=0002 Cout=0"
            severity error;
        report "TEST A8 Passed: F=B+1";

        
        -- ALU B TESTS (S(3 downto 2) = "01")
        
        report "---- Testing ALU_B ----";

        -- TEST 9: F=A AND B (0101)
        A <= x"0F0F"; B <= x"00FF"; S <= "0101";
        wait for 100 ns;
        assert (F = x"000F")
            report "TEST B1 Failed: expected F=000F"
            severity error;
        report "TEST B1 Passed: F=A AND B";

        -- TEST 10: F=A OR B (0100)
        A <= x"0F0F"; B <= x"00FF"; S <= "0100";
        wait for 100 ns;
        assert (F = x"0FFF")
            report "TEST B2 Failed: expected F=0FFF"
            severity error;
        report "TEST B2 Passed: F=A OR B";

        -- TEST 11: F=A NOR B (0110)
        A <= x"0F0F"; B <= x"00FF"; S <= "0110";
        wait for 100 ns;
        assert (F = x"F000")
            report "TEST B3 Failed: expected F=F000"
            severity error;
        report "TEST B3 Passed: F=A NOR B";

        -- TEST 12: F=NOT A (0111)
        A <= x"0F0F"; B <= (others => '0'); S <= "0111";
        wait for 100 ns;
        assert (F = x"F0F0")
            report "TEST B4 Failed: expected F=F0F0"
            severity error;
        report "TEST B4 Passed: F=NOT A";

        
        -- ALU C TESTS (S(3 downto 2) = "10")
        
        report "---- Testing ALU_C ----";

        -- TEST 13: Logic shift left 000A -> 0014
        A <= x"000A"; Cin <= '0'; S <= "1000";
        wait for 100 ns;
        assert (F = x"0014" and Cout = '0')
            report "TEST C1 Failed: expected F=0014 Cout=0"
            severity error;
        report "TEST C1 Passed: Logic shift left";

        -- TEST 14: Rotate left 000C -> 0018
        A <= x"000C"; Cin <= '0'; S <= "1001";
        wait for 100 ns;
        assert (F = x"0018" and Cout = '0')
            report "TEST C2 Failed: expected F=0018 Cout=0"
            severity error;
        report "TEST C2 Passed: Rotate left";

        -- TEST 15: Rotate left with Cin A00A -> 4015 Cout=1
        A <= x"A00A"; Cin <= '1'; S <= "1010";
        wait for 100 ns;
        assert (F = x"4015" and Cout = '1')
            report "TEST C3 Failed: expected F=4015 Cout=1"
            severity error;
        report "TEST C3 Passed: Rotate left with Cin";

        -- TEST 16: Clear A00A -> 0000 Cout=0
        A <= x"A00A"; Cin <= '0'; S <= "1011";
        wait for 100 ns;
        assert (F = x"0000" and Cout = '0')
            report "TEST C4 Failed: expected F=0000 Cout=0"
            severity error;
        report "TEST C4 Passed: Clear";

        
        -- ALU D TESTS (S(3 downto 2) = "11")
        
        report "---- Testing ALU_D ----";

        -- TEST 17: Logic shift right 000F -> 0007 Cout=1
        A <= x"000F"; Cin <= '0'; S <= "1100";
        wait for 100 ns;
        assert (F = x"0007" and Cout = '1')
            report "TEST D1 Failed: expected F=0007 Cout=1"
            severity error;
        report "TEST D1 Passed: Logic shift right";

        -- TEST 18: Rotate right 0F0F -> 8787 Cout=1
        A <= x"0F0F"; Cin <= '0'; S <= "1101";
        wait for 100 ns;
        assert (F = x"8787" and Cout = '1')
            report "TEST D2 Failed: expected F=8787 Cout=1"
            severity error;
        report "TEST D2 Passed: Rotate right";

        -- TEST 19: Rotate right with Cin=0 0F0F -> 0787 Cout=1
        A <= x"0F0F"; Cin <= '0'; S <= "1110";
        wait for 100 ns;
        assert (F = x"0787" and Cout = '1')
            report "TEST D3 Failed: expected F=0787 Cout=1"
            severity error;
        report "TEST D3 Passed: Rotate right with Cin=0";

        -- TEST 20: Arithmetic shift right F000 -> F800 Cout=0
        A <= x"F000"; Cin <= '0'; S <= "1111";
        wait for 100 ns;
        assert (F = x"F800" and Cout = '0')
            report "TEST D4 Failed: expected F=F800 Cout=0"
            severity error;
        report "TEST D4 Passed: Arithmetic shift right";

        report "==== All ALU_TOP Tests Completed Successfully ====";
        wait;
    end process;
end architecture;
