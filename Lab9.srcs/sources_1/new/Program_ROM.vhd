----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:13:45 AM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
--start
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 
 signal sevenSegment_ROM : rom_type := (
 "100000000000", -- 0    --to be changed
 "111100100000", --1
 "010010000000", --2
 "011000000000", --3
 "001100100000", --4
 "001001000000", --5
 "000001000000", --6
 "111100000000" --7
 );

begin

Instruction <= sevenSegment_ROM(to_integer(unsigned(Mem_Sel)));

end Behavioral;