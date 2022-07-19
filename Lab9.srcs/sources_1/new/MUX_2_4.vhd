----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:44:24 AM
-- Design Name: 
-- Module Name: MUX_2_4 - Behavioral
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

entity MUX_2_4 is
    Port ( I_Imm_Val : in STD_LOGIC_VECTOR (3 downto 0);
            I_Adder_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Load_Sel : in STD_LOGIC;
            O_MUX_2_3 : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_4;
--when load select is 0 output value
--when load select is 1 output the output of 4 bit adder
architecture Behavioral of MUX_2_4 is

begin
O_MUX_2_3(0)<=(NOT (I_Load_Sel) AND I_Imm_Val(0)) OR (I_Load_Sel AND I_Adder_4(0));
O_MUX_2_3(1)<=(NOT (I_Load_Sel) AND I_Imm_Val(1)) OR (I_Load_Sel AND I_Adder_4(1));
O_MUX_2_3(2)<=(NOT (I_Load_Sel) AND I_Imm_Val(2)) OR (I_Load_Sel AND I_Adder_4(2));
O_MUX_2_3(3)<=(NOT (I_Load_Sel) AND I_Imm_Val(3)) OR (I_Load_Sel AND I_Adder_4(3));
end Behavioral;
