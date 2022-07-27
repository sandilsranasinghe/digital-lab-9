----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 05:36:01 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR (1 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component Instruction_Decoder 
    Port ( I_Instruction : in STD_LOGIC_VECTOR (11 downto 0); -- the instruction from the PC register address
           I_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0); -- for the JZR instruction
           I_Clk : in STD_LOGIC;
           I_Reset: in STD_LOGIC;
           O_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0); -- enabling the relevant register in register bank
           O_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0); -- selecting the relevant register input A for Add/Sub unit
           O_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0); -- selecting the relevant register input B for Add/Sub unit
           O_EN_PC : out STD_LOGIC; -- enable writing to PC register
           O_EN_Store : out STD_LOGIC; -- enable writing to register bank registers
           O_Add_Sub_Sel : out STD_LOGIC; -- add or sub for Add/Sub unit (1 for subtraction)
           O_Jump_Flag : out STD_LOGIC; -- to determine if PC is incremented normally or by address from JZR instruction (1 to jump)
           O_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0); -- jump address from JZR instruction
           O_Load_Sel : out STD_LOGIC; -- load immediate value or add/sub result (0 for imm, 1 for add/sub)
           O_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0)); -- immediate value passed from instruction
end component;

component Program_Counter 
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           EN: in STD_LOGIC;
           A_In : in STD_LOGIC_VECTOR (2 downto 0);
           Y_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM 
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Reg_Bank 
    Port ( Clk : in STD_LOGIC;
           Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder_3
    Port ( A_In : in STD_LOGIC_VECTOR (2 downto 0);
           B_In : in STD_LOGIC_VECTOR (2 downto 0);
           S_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Add_Sub_4 
    Port ( A_In : in STD_LOGIC_VECTOR (3 downto 0);
           B_In : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : in STD_LOGIC;
           S_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component MUX_8_4
    Port ( Data_In : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_4
    Port ( A_In : in STD_LOGIC_VECTOR (3 downto 0);
           B_In : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_3
    Port ( I_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Flag : in STD_LOGIC;
           O_MUX_2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end component;


begin


end Behavioral;
