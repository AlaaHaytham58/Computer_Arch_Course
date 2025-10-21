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
   
    --  Make  array of 7 registers each 12 bits wide
    TYPE reg_array IS ARRAY (0 TO 6) OF std_logic_vector(11 DOWNTO 0);
    SIGNAL mem_reg : reg_array;
BEGIN
  
    process(CLK,Rst)
    begin 
        if Rst='1' then 
            mem_reg <= (OTHERS => (OTHERS => '0'));
        elsif rising_edge(CLK) then
            
           if wr_en1='1' then 
                mem_reg(to_integer(unsigned(wr_addr1))) <= wr_data1;
            end if;
            if wr_en2='1'  then 
                 mem_reg(to_integer(unsigned(wr_addr2))) <= wr_data2;
            end if;
            if wr_en1='1' and wr_en2='1'  then
                mem_reg(to_integer(unsigned(wr_addr1))) <= wr_data1;
            end if;
        end if;
    
    end process;

--  Read data from registers
            rd_data1 <= mem_reg(to_integer(unsigned(rd_addr1)));
            rd_data2 <= mem_reg(to_integer(unsigned(rd_addr2)));
        
end B_REG_FILE;