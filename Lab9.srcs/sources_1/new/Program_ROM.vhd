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
    Port ( I_Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           O_Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
--start
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 
 signal program_ROM : rom_type := (
        "100010000011", --MOVI R1,3
        "100100000001", --MOVI R2,1
        "101110000000", --MOVI R7,0
        "010100000000", --NEG R2
        "001110010000", --ADD R7,R1
        "000010100000", --ADD R1,R2
        "110010000000", --JZR R1 0
        "110000000100" --JZR R0 4
 );

begin

O_Instruction <= program_ROM(to_integer(unsigned(I_Mem_Sel)));

end Behavioral;