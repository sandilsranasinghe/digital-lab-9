----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:50:39 AM
-- Design Name: 
-- Module Name: MUX_8_4 - Behavioral
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

entity MUX_8_4 is
    Port ( I_Data_0 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_1 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_2 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_3 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_5 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_6 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_7 : in STD_LOGIC_VECTOR (3 downto 0);
            O_Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            O_MUX_8_4 : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_4;

architecture Behavioral of MUX_8_4 is

begin
O_MUX_8_4(0)<=(NOT(O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_0(0)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_1(0))) 
            OR(NOT(O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_2(0))) 
            OR((O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_3(0)))  
            OR((NOT(O_Reg_Sel(0)))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_4(0)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_5(0))) 
            OR((NOT(O_Reg_Sel(0)))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_6(0))) 
            OR((O_Reg_Sel(0))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_7(0)));  

O_MUX_8_4(1)<=(NOT(O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_0(1)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_1(1))) 
            OR(NOT(O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_2(1))) 
            OR((O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_3(1)))  
            OR((NOT(O_Reg_Sel(0)))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_4(1)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_5(1))) 
            OR((NOT(O_Reg_Sel(0)))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_6(1))) 
            OR((O_Reg_Sel(0))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_7(1))); 

O_MUX_8_4(2)<=(NOT(O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_0(2)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_1(2))) 
            OR(NOT(O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_2(2))) 
            OR((O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_3(2)))  
            OR((NOT(O_Reg_Sel(0)))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_4(2)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_5(2))) 
            OR((NOT(O_Reg_Sel(0)))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_6(2))) 
            OR((O_Reg_Sel(0))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_7(2))); 
            
O_MUX_8_4(3)<=(NOT(O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_0(3)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (NOT(O_Reg_Sel(2))) AND (I_Data_1(3))) 
            OR(NOT(O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_2(3))) 
            OR((O_Reg_Sel(0))AND O_Reg_Sel(1) AND (NOT(O_Reg_Sel(2))) AND (I_Data_3(3)))  
            OR((NOT(O_Reg_Sel(0)))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_4(3)))  
            OR((O_Reg_Sel(0))AND (NOT(O_Reg_Sel(1))) AND (O_Reg_Sel(2)) AND (I_Data_5(3))) 
            OR((NOT(O_Reg_Sel(0)))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_6(3))) 
            OR((O_Reg_Sel(0))AND (O_Reg_Sel(1)) AND (O_Reg_Sel(2)) AND (I_Data_7(3))); 
end Behavioral;
