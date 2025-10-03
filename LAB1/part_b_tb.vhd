library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_B is
end entity;

architecture sim of tb_ALU_B is
  constant N : integer := 16; 

  signal A, B   : std_logic_vector(N-1 downto 0);
  signal S      : std_logic_vector(3 downto 0);
  signal F      : std_logic_vector(N-1 downto 0);
  signal Cout   : std_logic;
begin   
    uut:  entity work.ALU_B
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
    
        -- TEST 1: F=A AND B
        A <= x"0F0F"; B <= x"00FF"; S <= "0101";
        wait for 100 ns;
    
        -- TEST 2: F=A OR B
        A <= x"0F0F"; B <= x"00FF"; S <= "0100";
        wait for 100 ns;
    
        -- TEST 3: F=A NOR B
        A <= x"0F0F"; B <= x"00FF"; S <= "0110";
        wait for 100 ns;
    
        -- TEST 4: F=NOT A
        A <= x"0F0F"; B <= (others => '0'); S <= "0111";
        wait for 100 ns;
    
        -- TEST 5: Default case
        A <= x"0F0F"; B <= x"00FF"; S <= "1111";
        wait for 100 ns;
    
        report "==== Ending ALU_B Testbench ====";
        wait;
    end process;
    
    end architecture;