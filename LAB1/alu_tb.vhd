library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;
architecture behavior of alu_tb is 

    component alu_top
    port(
        A,B  : in  std_logic_vector(15 downto 0);
        S    : in  std_logic_vector(3 downto 0);
        Sel  : in  std_logic_vector(1 downto 0); 
        Cin  : in  std_logic;
        F    : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
    end component;
    
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(3 downto 0) := (others => '0');
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

   signal F : std_logic_vector(15 downto 0);
   signal Cout : std_logic;

   constant clk_period : time := 10 ns;
begin

   uut: alu_top
   port map(
       A => A,
       B => B,
       S => S,
       Sel => Sel,
       Cin => Cin,
       F => F,
       Cout => Cout
   );
