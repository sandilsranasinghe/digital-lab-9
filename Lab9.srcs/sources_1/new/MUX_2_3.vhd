----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:40:47 AM
-- Design Name: 
-- Module Name: MUX_2_3 - Behavioral
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

entity MUX_2_3 is
    Port ( I_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Flag : in STD_LOGIC;
           O_MUX_2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_3;

architecture Behavioral of MUX_2_3 is
--when jump flag is 0 output is jump adder
--when jum flag is 1 output is output from 3 bit adder
begin
O_MUX_2_3(0)<=(NOT(I_Jump_Flag) AND I_Jump_Addr(0)) OR (I_Jump_Flag AND I_Adder_3(0));
O_MUX_2_3(1)<=(NOT(I_Jump_Flag) AND I_Jump_Addr(1)) OR (I_Jump_Flag AND I_Adder_3(1));
O_MUX_2_3(2)<=(NOT(I_Jump_Flag) AND I_Jump_Addr(2)) OR (I_Jump_Flag AND I_Adder_3(2));

end Behavioral;
