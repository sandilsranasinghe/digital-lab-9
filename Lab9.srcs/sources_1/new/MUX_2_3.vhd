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
    Port ( A_In : in STD_LOGIC_VECTOR (2 downto 0);
           B_In : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y_Out : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_3;

architecture Behavioral of MUX_2_3 is

begin


end Behavioral;
