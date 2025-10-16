library ieee;
use ieee.std_logic_1164.all;

entity tb_ALU_B is
end entity;

architecture behavioral of tb_ALU_B is
    component ALU_B
        generic (N : integer := 16);
        port (
            A, B  : in  std_logic_vector(N-1 downto 0);
            S     : in  std_logic_vector(3 downto 0);
            F     : out std_logic_vector(N-1 downto 0);
            Cout  : out std_logic
        );
    end component;

    constant N : integer := 16;
    signal A, B   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal S      : std_logic_vector(3 downto 0) := (others => '0');
    signal F      : std_logic_vector(N-1 downto 0);
    signal Cout   : std_logic;

begin
    uut: ALU_B
        generic map (N => N)
        port map (
            A    => A,
            B    => B,
            S    => S,
            F    => F,
            Cout => Cout
        );

    stim_proc: process
    begin
        report "==== Starting ALU_B Testbench ====";

     
        -- TEST 1: AND Operation (S = 0101)
        
        A <= x"0F0F"; 
        B <= x"00FF"; 
        S <= "0101";
        wait for 100 ns;
        assert F = (x"0F0F" and x"00FF")
            report "TEST 1 Failed: AND operation incorrect."
            severity error;
        report "TEST 1 Passed: AND";

        
        -- TEST 2: OR Operation (S = 0100)
        
        A <= x"0F0F"; 
        B <= x"00FF"; 
        S <= "0100";
        wait for 100 ns;
        assert F = (x"0F0F" or x"00FF")
            report "TEST 2 Failed: OR operation incorrect."
            severity error;
        report "TEST 2 Passed: OR";

        
        -- TEST 3: NOR Operation (S = 0110)
        
        A <= x"0F0F"; 
        B <= x"00FF"; 
        S <= "0110";
        wait for 100 ns;
        assert F = not (x"0F0F" or x"00FF")
            report "TEST 3 Failed: NOR operation incorrect."
            severity error;
        report "TEST 3 Passed: NOR";

        
        -- TEST 4: NOT Operation (S = 0111)
        
        A <= x"0F0F"; 
        B <= (others => '0'); 
        S <= "0111";
        wait for 100 ns;
        assert F = not (x"0F0F")
            report "TEST 4 Failed: NOT operation incorrect."
            severity error;
        report "TEST 4 Passed: NOT";

        
        -- TEST 5: Default Case (S = 1111)
        
        A <= x"0F0F"; 
        B <= x"00FF"; 
        S <= "1111";
        wait for 100 ns;
        assert F = (F'range => '0')
            report "TEST 5 Failed: Default case incorrect."
            severity error;
        report "TEST 5 Passed: Default";

        report "==== All ALU_B Tests Completed ====";
        wait;
    end process;
end architecture;
