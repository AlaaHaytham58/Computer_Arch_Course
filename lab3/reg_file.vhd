LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_file_dff IS
    PORT(
        CLK,Rst                : IN  std_logic;
        wr_en1, wr_en2     : IN  std_logic;
        wr_addr1, wr_addr2 : IN  std_logic_vector(2 DOWNTO 0);
        rd_addr1, rd_addr2 : IN  std_logic_vector(2 DOWNTO 0);
        wr_data1, wr_data2 : IN  std_logic_vector(11 DOWNTO 0);
        rd_data1, rd_data2 : OUT std_logic_vector(11 DOWNTO 0)
    );
END reg_file_dff;

ARCHITECTURE B_REG_FILE OF reg_file_dff IS
    COMPONENT my_nDFF
        GENERIC ( n : integer := 12);
        PORT( Clk, Rst : IN std_logic;
              d : IN std_logic_vector(n-1 DOWNTO 0);
              q : OUT std_logic_vector(n-1 DOWNTO 0));
    END COMPONENT;
    --  Make  array of 7 registers each 12 bits wide
    TYPE reg_array IS ARRAY (0 TO 6) OF std_logic_vector(11 DOWNTO 0);
    SIGNAL Q,D : reg_array;
BEGIN
    --  Instantiate 7 12-bit D flip-flops
    gen_regs:for i in 0 TO 6 GENERATE
        regs: my_nDFF
            PORT MAP (Clk => CLK,
                      Rst => Rst,
                      d => D(i),
                      q => Q(i));
    END GENERATE;
    process(CLK,Rst)
    begin 
        if Rst='1' then 
            for j in 0 to 6 loop
                D(j) <= (others => '0');
            end loop;
        elsif rising_edge(CLK) then
            for j in 0 to 6 loop 
            D(j) <= Q(j);
            end loop;
           if wr_en1='1' then 
                D(to_integer(unsigned(wr_addr1))) <= wr_data1;
            end if;
            if wr_en2='1'  then 
                 D(to_integer(unsigned(wr_addr2))) <= wr_data2;
            end if;
            if wr_en1='1' and wr_en2='1'  then
                D(to_integer(unsigned(wr_addr1))) <= wr_data1;
            end if;
        end if;
    
    end process;

--  Read data from registers
            rd_data1 <= Q(to_integer(unsigned(rd_addr1)));
            rd_data2 <= Q(to_integer(unsigned(rd_addr2)));
        
end B_REG_FILE;