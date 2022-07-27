----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 02:20:08 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

-- Uncomment the followiny Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_16_7 is
    Port ( I_address : in STD_LOGIC_VECTOR (3 downto 0);
           O_data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is
type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
 
 signal sevenSegment_ROM : rom_type := (
 "1000000", -- 0
 "1111001",
 "0100100",
 "0110000",
 "0011001",
 "0010010",
 "0000010",
 "1111000",
 "0000000",
 "0010000",
 "0001000", -- a
 "0000011",
 "1000110",
 "0100001",
 "0000110",
 "0001110"
 );

begin
O_data <= sevenSegment_ROM(to_integer(unsigned(I_address)));


end Behavioral;
