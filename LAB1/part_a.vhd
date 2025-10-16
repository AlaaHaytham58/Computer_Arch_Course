library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_A is
  generic (N : integer := 16);
  port (
    A, B  : in  std_logic_vector(N-1 downto 0);
    S     : in  std_logic_vector(3 downto 0);
    Cin   : in  std_logic;
    F     : out std_logic_vector(N-1 downto 0);
    Cout  : out std_logic
  );
end ALU_A;

architecture behavioral of ALU_A is
  signal Ain, Bin : std_logic_vector(N-1 downto 0);
  signal tempSum  : std_logic_vector(N-1 downto 0);
  signal tempCout : std_logic;
  signal localCin : std_logic; 

  component n_adder
    generic (N : integer := 16);
    port (
      A    : in  std_logic_vector(N-1 downto 0);
      B    : in  std_logic_vector(N-1 downto 0);
      Cin  : in  std_logic;
      Sum  : out std_logic_vector(N-1 downto 0);
      Cout : out std_logic
    );
  end component;
  

begin
  process(A, B, S, Cin)
  begin
    Ain <= (others => '0');
    Bin <= (others => '0');
    localCin <= '0';

   case S is
      when "0000"  =>
        Ain<=A;
        Bin <= (others => '0');
        localCin <= Cin;
      when "0001"  =>
        Ain<=A;
        Bin<=not B;
        if Cin = '0' then
          localCin <= '1';   
        else
          localCin <= '0';   
        end if;
      when "0010" =>
       Ain<=A;
      if Cin='0' then
        Bin <= std_logic_vector(unsigned(not B) + 1);        localCin<='1';
      else
       Bin<= B;
       localCin<='1';
      end if;
      when "0011" =>
      if Cin = '0' then
          Ain <= A;
          Bin <= (others => '1');
          localCin <= '0';   
        else
          Ain <= (others => '0');
          Bin <= B;
          localCin <= '1'; 
        end if;
        when others =>
        Ain <= (others => '0');
        Bin <= (others => '0');
        localCin <= '0';
end case;
end process;
 U_ADDER: n_adder
    generic map (N => N)
    port map (
      A    => Ain,
      B    => Bin,
      Cin  => localCin,
      Sum  => tempSum,
      Cout => tempCout
    );

  F    <= tempSum;
  Cout <= tempCout;

end behavioral;
