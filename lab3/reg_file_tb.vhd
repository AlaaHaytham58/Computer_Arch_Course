library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file_tb is
end entity;

architecture tb of reg_file_tb is

  constant ADDR_WIDTH : integer := 3;
  constant DATA_WIDTH : integer := 12;

  signal tCLK        : std_logic := '0';
  signal tRst        : std_logic := '0';
  signal t_wr_en1    : std_logic := '0';
  signal t_wr_en2    : std_logic := '0';
  signal t_wr_addr1  : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
  signal t_wr_addr2  : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
  signal t_rd_addr1  : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
  signal t_rd_addr2  : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
  signal t_wr_data1  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal t_wr_data2  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal t_rd_data1  : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal t_rd_data2  : std_logic_vector(DATA_WIDTH-1 downto 0);

begin

  -- DUT instantiation
  uut: entity work.reg_file_dff
    port map (
      Clk       => tCLK,
      Rst       => tRst,
      wr_en1    => t_wr_en1,
      wr_en2    => t_wr_en2,
      wr_addr1  => t_wr_addr1,
      wr_addr2  => t_wr_addr2,
      rd_addr1  => t_rd_addr1,
      rd_addr2  => t_rd_addr2,
      wr_data1  => t_wr_data1,
      wr_data2  => t_wr_data2,
      rd_data1  => t_rd_data1,
      rd_data2  => t_rd_data2
    );

  -- Clock generation
  clk_gen : process
  begin
    while now < 300 ns loop
      tCLK <= '0';
      wait for 5 ns;
      tCLK <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  -- Process to print values each clock cycle
  monitor_proc : process(tCLK)
  begin
    if rising_edge(tCLK) then
      report "------------------------------------------" severity note;
      report "Time: " & time'image(now) severity note;
      report "wr_en1=" & std_logic'image(t_wr_en1) & 
             "  wr_addr1=" & integer'image(to_integer(unsigned(t_wr_addr1))) &
             "  wr_data1=" & integer'image(to_integer(unsigned(t_wr_data1))) severity note;
      report "wr_en2=" & std_logic'image(t_wr_en2) &
             "  wr_addr2=" & integer'image(to_integer(unsigned(t_wr_addr2))) &
             "  wr_data2=" & integer'image(to_integer(unsigned(t_wr_data2))) severity note;
      report "rd_addr1=" & integer'image(to_integer(unsigned(t_rd_addr1))) &
             "  rd_data1=" & integer'image(to_integer(unsigned(t_rd_data1))) severity note;
      report "rd_addr2=" & integer'image(to_integer(unsigned(t_rd_addr2))) &
             "  rd_data2=" & integer'image(to_integer(unsigned(t_rd_data2))) severity note;
    end if;
  end process;

  -- Test sequence
  stimulus: process
  begin
    report "Starting simulation..." severity note;

    -- Reset
    tRst <= '1';
    wait for 20 ns;
    tRst <= '0';
    wait for 10 ns;

    -- Cycle 1
    t_rd_addr1 <= "000";  t_rd_addr2 <= "001";
    t_wr_en1 <= '1';  t_wr_addr1 <= "000";  t_wr_data1 <= x"0F0";
    t_wr_en2 <= '1';  t_wr_addr2 <= "011";  t_wr_data2 <= x"AAA";
    wait for 20 ns;

    -- Cycle 2
    t_rd_addr1 <= "100";  t_rd_addr2 <= "011";
    t_wr_en1 <= '1';  t_wr_addr1 <= "110";  t_wr_data1 <= x"123";
    t_wr_en2 <= '1';  t_wr_addr2 <= "001";  t_wr_data2 <= x"CCC";
    wait for 20 ns;

    -- Cycle 3
    t_rd_addr1 <= "001";  t_rd_addr2 <= "110";
    t_wr_en1 <= '1';  t_wr_addr1 <= "100";  t_wr_data1 <= x"456";
    t_wr_en2 <= '0';
    wait for 20 ns;

    -- Cycle 4
    t_rd_addr1 <= "110";  t_rd_addr2 <= "000";
    t_wr_en1 <= '0';
    t_wr_en2 <= '1';  t_wr_addr2 <= "001";  t_wr_data2 <= x"789";
    wait for 20 ns;

    -- Cycle 5
    t_rd_addr1 <= "001";  t_rd_addr2 <= "010";
    t_wr_en1 <= '0';  t_wr_en2 <= '0';
    wait for 20 ns;

    -- Cycle 6
    t_rd_addr1 <= "011";  t_rd_addr2 <= "100";
    wait for 20 ns;

    report "Simulation completed!" severity note;
    wait;
  end process;

end architecture;
