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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

    component Controller
        Port ( 
            I_Clk : in STD_LOGIC;
            I_Reset : in STD_LOGIC;
            O_EN_Ins : out STD_LOGIC;
            O_EN_Store : out STD_LOGIC;
            O_EN_PC : out STD_LOGIC
        );
    end component;
    component Register_12_Bit
        Port ( 
            I_Data : in STD_LOGIC_VECTOR (11 downto 0);
            I_Enable : in STD_LOGIC;
            I_Clk : in STD_LOGIC;
            O_Q : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;
    signal EN_Ins : STD_LOGIC;
    signal instruction : STD_LOGIC_VECTOR (11 downto 0);

begin

    Controller_0 : Controller
        PORT MAP (
            I_Clk => I_Clk,
            I_Reset => I_Reset,
            O_EN_Ins => EN_Ins,
            O_EN_Store => O_EN_Store,
            O_EN_PC => O_EN_PC
        );

    Instruction_Register : Register_12_Bit
        PORT MAP (
            I_Data => I_Instruction,
            I_Enable => EN_Ins,
            I_Clk => I_Clk,
            O_Q => instruction
        );

    -- load add/sub value only for ADD and NEG instructions
    O_Load_Sel <= NOT(instruction(11)); 

    -- We set the register address to enable for register bank regardless of whether it's actually needed 
    -- for the instruction, since when it's needed it's always the same bit positions, and the controller
    -- handles whether we actually write the value to the register bank or not.
    O_Reg_Enable <= instruction(9 downto 7); 

    -- Similarly to the previous, we set the register addresses for A and B inputs of Add/Sub unit
    O_Reg_Sel_A <= instruction(9 downto 7);
    O_Reg_Sel_B <= instruction(6 downto 4);

    -- Again similarly we set the jump address
    O_Jump_Addr <= instruction(2 downto 0);

    -- If relevant register value is "0000" set jump flag to 1
    O_Jump_Flag <= (
        NOT(I_Jump_Check(3)) AND
        NOT(I_Jump_Check(2)) AND
        NOT(I_Jump_Check(1)) AND
        NOT(I_Jump_Check(0))
    );

    -- this is set to 1 only for NEG operations
    O_Add_Sub_Sel <= NOT(instruction(11)) AND instruction(10);

    O_Imm_Val <= instruction(3 downto 0);




end Behavioral;
