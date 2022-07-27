----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 02:43:12 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
    Port ( I_Res : in STD_LOGIC;
       I_Clk : in STD_LOGIC;
       I_EN_PC: in STD_LOGIC;
       I_A_In : in STD_LOGIC_VECTOR (2 downto 0);
       O_Mem_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Clk: STD_LOGIC:='0';
signal EN,Res: STD_LOGIC;
signal A_In, Y_Out: STD_LOGIC_VECTOR (2 downto 0);
begin
UUT: Program_Counter
    PORT MAP(
    I_Res => Res,
    I_Clk => Clk,
    I_EN_PC => EN,
    I_A_In => A_In,
    O_Mem_Sel => Y_Out
    );
    
    process
    begin
        wait for 5ns;
        Clk <= NOT Clk;
      
    end process;
    
    process
    begin
    Res<='0';
    EN <='1';
    A_In <= "110";
    wait for 100ns;
    
    EN <= '0';
    wait for 100ns;
    
    A_In <= "111";
    wait for 100ns;
    
    EN <= '1';
    wait for 100ns;
    
    A_In<= "010";
    wait for 100ns;
    EN<='0';
    Res <='1';
    wait for 100ns;
    
    EN <= '1';
    wait for 100ns;
    
    Res<='0';
    A_In <= "101";
    wait;
    
    end process;
end Behavioral;
