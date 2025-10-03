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
  
  signal localCin : std_logic;  -- corrected Cin to send into adder

begin
  process(A, B, S, Cin)
  begin
    Ain <= (others => '0');
    Bin <= (others => '0');
    localCin <= '0';

    case S is
      -- F=A (Cin=0) or F=A+1 (Cin=1)
      when "0000" =>
        Ain <= A;
        Bin <= (others => '0');
        localCin <= Cin;

      -- F=A-B (Cin=0) or F=A-B-1 (Cin=1)
      when "0001" =>
        Ain <= A;
        Bin <= not B;
        -- To make Cin=0 → A-B, Cin=1 → A-B-1
        if Cin = '0' then
          localCin <= '1';   -- do A + NOT(B) + 1
        else
          localCin <= '0';   -- do A + NOT(B) + 0
        end if;

      -- F=A-B+1 (Cin=0) or F=A+B+1 (Cin=1)
      when "0010" =>
        Ain <= A;
        if Cin = '0' then
          Bin <= not B;
          localCin <= '1';   -- A + NOT(B) + 1 = A-B+1
        else
          Bin <= B;
          localCin <= '1';   -- A + B + 1
        end if;

      -- F=A-1 (Cin=0) or F=B+1 (Cin=1)
      when "0011" =>
        if Cin = '0' then
          Ain <= A;
          Bin <= (others => '1');
          localCin <= '0';   -- A + (111..1) + 0 = A-1
        else
          Ain <= (others => '0');
          Bin <= B;
          localCin <= '1';   -- 0 + B + 1 = B+1
        end if;

      when others =>
        Ain <= (others => '0');
        Bin <= (others => '0');
        localCin <= '0';
    end case;
  end process;

  -- single generic adder instance
  U_ADDER: n_adder
    generic map (N => N)
    port map (
      A    => Ain,
      B    => Bin,
      Cin  => localCin,
      Sum  => tempSum,
      Cout => tempCout
    );

  -- Outputs
  F    <= tempSum;
  Cout <= '0';   -- Lab table expects Cout=0 for all Part A ops

end behavioral;
