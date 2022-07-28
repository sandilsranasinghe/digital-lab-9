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
type rom_type is array (0 to 5) of std_logic_vector(11 downto 0);
 
-- signal program_ROM : rom_type := (
--        "100010000011", --MOVI R1,3
--        "100100000001", --MOVI R2,1
--        "010100000000", --NEG R2
--        "001000010000", --ADD R4,R1
--        "000010100000", --ADD R1,R2
--        "110010000111", --JZR R1 7
--        "110000000011", --JZR R0 3
--        "001111000000"  --ADD R7,R4
-- );
 signal program_ROM : rom_type := (
    "100010000001",--mov r1,1
    "100100000010",--mov r2,2
    "100110000011",--mov r3,3
    "001110010000",--add r7,r1
    "001110100000",--add r7,r2
    "001110110000"--add r7,r3
);
begin

O_Instruction <= program_ROM(to_integer(unsigned(I_Mem_Sel)));

end Behavioral;