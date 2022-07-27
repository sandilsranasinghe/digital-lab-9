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
    Port ( I_Res : in STD_LOGIC;
           I_Clk : in STD_LOGIC;
           I_EN_PC: in STD_LOGIC;
           I_A_In : in STD_LOGIC_VECTOR (2 downto 0);
           O_Mem_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM 
    Port ( I_Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           O_Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Reg_Bank 
    Port ( I_Clk : in STD_LOGIC;
           I_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           I_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           I_Reset : STD_LOGIC;
           O_Data_Out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder_3
    Port ( I_A : in STD_LOGIC_VECTOR (2 downto 0);
           I_B : in STD_LOGIC_VECTOR (2 downto 0);
           O_S_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Add_Sub_4 
    Port ( I_A : in STD_LOGIC_VECTOR (3 downto 0);
           I_B : in STD_LOGIC_VECTOR (3 downto 0);
           I_Add_Sub_Sel : in STD_LOGIC;
           O_S_Out : out STD_LOGIC_VECTOR (3 downto 0);
           O_Overflow : out STD_LOGIC;
           O_Zero : out STD_LOGIC);
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

signal EN_PC : STD_LOGIC;

begin

Instruction_Decoder_0 : Instruction_Decoder 
    Port map ( I_Instruction => ,
           I_Jump_Check => ,
           I_Clk => Clk,
           I_Reset=> Res,
           O_Reg_Enable => ,
           O_Reg_Sel_A => ,
           O_Reg_Sel_B => ,
           O_EN_PC => EN_PC,
           O_EN_Store => ,
           O_Add_Sub_Sel => ,
           O_Jump_Flag => ,
           O_Jump_Addr => ,
           O_Load_Sel => ,
           O_Imm_Val => 
);

Program_Counter_0 : Program_Counter
    port map(
               I_Res  => Res,
               I_Clk  => Clk,
               I_EN_PC => EN_PC,
               I_A_In  => ,
               O_Y_Out  => 
    );

Program_ROM _0 : Program_ROM 
    Port map( 
        I_Mem_Sel => ,
        O_Instruction => 
);

Reg_Bank_0 : Reg_Bank 
    Port ( Clk => Clk,
           Reg_Enable => ,
           Data_In => ,
           Data_Out => ,
           );

Adder_3_0 : Adder_3
    Port ( I_A => ,
           I_B => ,
           O_S_Out => ,
           );

Add_Sub_4_0 : Add_Sub_4 
    Port ( I_A=> ,
           I_B => ,
           I_Add_Sub_Sel => ,
           O_S_Out => ,
           O_Overflow => ,
           O_Zero => 
        );

MUX_8_4_0 : MUX_8_4
    Port ( Data_In => ,
           Sel => ,
           EN => ,
           Y_Out => ,
           );

MUX_8_4_1 : MUX_8_4
    Port ( Data_In => ,
           Sel => ,
           EN => ,
           Y_Out => ,
           );



end Behavioral;
