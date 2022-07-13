----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:03:16 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( I_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           I_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           I_Clk : in STD_LOGIC;
           I_Reset: in STD_LOGIC;
           O_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           O_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           O_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           O_PC_Enable : out STD_LOGIC;
           O_Add_Sub_Sel : out STD_LOGIC;
           O_Jump_Flag : out STD_LOGIC;
           O_Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           O_Load_Sel : out STD_LOGIC;
           O_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin


end Behavioral;
