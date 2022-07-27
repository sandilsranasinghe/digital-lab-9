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
            I_Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            O_MUX_8_4 : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_4;

architecture Behavioral of MUX_8_4 is

begin
    process(I_Reg_Sel) is
    begin
        if I_Reg_Sel="000" then
            O_MUX_8_4<=I_Data_0;
        elsif I_Reg_Sel="001" then
            O_MUX_8_4<=I_Data_1;
        elsif I_Reg_Sel="010" then
            O_MUX_8_4<=I_Data_2;
        elsif I_Reg_Sel="011" then
            O_MUX_8_4<=I_Data_3;
        elsif I_Reg_Sel="100" then
            O_MUX_8_4<=I_Data_4;
        elsif I_Reg_Sel="101" then
            O_MUX_8_4<=I_Data_5;
        elsif I_Reg_Sel="110" then
            O_MUX_8_4<=I_Data_6;
        else
            O_MUX_8_4<=I_Data_7;
        end if;
    end process;
end Behavioral;
