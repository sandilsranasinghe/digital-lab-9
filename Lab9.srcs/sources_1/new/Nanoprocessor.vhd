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
           Overflow_led : out STD_LOGIC;
           Zero_led : out STD_LOGIC;
           Reg_1 : out std_logic_vector(3 downto 0);
           Seg7_Anode : out STD_LOGIC_VECTOR(3 downto 0);
           Seg7_Out : out STD_LOGIC_VECTOR(6 downto 0)
           );
           
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
           I_Reset : in STD_LOGIC;
           I_EN_Store : in STD_LOGIC;
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
    Port ( I_Data_0 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_1 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_2 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_3 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_5 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_6 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Data_7 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            O_MUX_8_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
 Port ( Clk_in : in STD_LOGIC;
          Clk_out : out STD_LOGIC);
end component;

component MUX_2_4
     Port ( I_Imm_Val : in STD_LOGIC_VECTOR (3 downto 0);
            I_Adder_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Load_Sel : in STD_LOGIC;
            O_MUX_2_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_3
    Port ( I_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           I_Jump_Flag : in STD_LOGIC;
           O_MUX_2_3 : out STD_LOGIC_VECTOR (2 downto 0)
           );
end component;

component LUT_16_7
    Port ( I_address : in STD_LOGIC_VECTOR (3 downto 0);
             O_data : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

signal EN_PC, Add_Sub_Sel, jmpflg, Load_Sel, EN_Store,S_Clk: STD_LOGIC;
signal Data_Out : STD_LOGIC_VECTOR(31 downto 0);
signal Mem_Sel, Mux_2_3_out,Reg_Sel_A, Reg_Sel_B,jmpaddr: STD_LOGIC_VECTOR(2 downto 0);
signal Mux_8_4_A_out, Mux_8_4_B_out : STD_LOGIC_VECTOR(3 downto 0);
signal Imm_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Adder_4 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_In : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR(2 downto 0);
signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
signal bit_3_out : STD_LOGIC_VECTOR(2 downto 0);
signal led_address : STD_LOGIC_VECTOR (3 downto 0);
signal led_data : STD_LOGIC_VECTOR (6 downto 0);

begin
Slow_Clk_0:Slow_Clk
port map(   Clk_in=>Clk,
            Clk_out=>S_Clk
            );
            
Instruction_Decoder_0 : Instruction_Decoder 
    Port map ( I_Instruction => Instruction,
           I_Jump_Check => Mux_8_4_A_out,
           I_Clk => S_Clk,
           I_Reset=> Res,
           O_Reg_Enable => Reg_Enable,
           O_Reg_Sel_A => Reg_Sel_A,
           O_Reg_Sel_B => Reg_Sel_B,
           O_EN_PC => EN_PC,
           O_EN_Store => EN_Store,
           O_Add_Sub_Sel => Add_Sub_Sel,
           O_Jump_Flag => jmpflg,
           O_Jump_Addr =>jmpaddr ,
           O_Load_Sel => Load_Sel,
           O_Imm_Val => Imm_Val
);

Program_Counter_0 : Program_Counter
    port map(
               I_Res  => Res,
               I_Clk  => S_Clk,
               I_EN_PC => EN_PC,
               I_A_In  => Mux_2_3_out,
               O_Mem_Sel  => Mem_Sel
    );

Program_ROM_0 : Program_ROM 
    Port map( 
        I_Mem_Sel => Mem_Sel,
        O_Instruction => Instruction
);

Reg_Bank_0 : Reg_Bank 
    Port map (
           I_Clk => S_Clk,
           I_Reg_Enable => Reg_Enable,
           I_Data_In => Data_In,
           I_EN_Store => EN_store,
           O_Data_Out => Data_Out,
           I_Reset => Res
           );

Adder_3_0 : Adder_3
    Port map(I_A => Mem_Sel,
           I_B => "001",
           O_S_Out => bit_3_out
           );

Add_Sub_4_0 : Add_Sub_4 
    Port map( I_A=> Mux_8_4_A_out,
           I_B => Mux_8_4_B_out,
           I_Add_Sub_Sel => Add_Sub_Sel,
           O_S_Out => Adder_4,
           O_Overflow => Overflow_led,
           O_Zero => Zero_led
        );

MUX_8_4_A : MUX_8_4
    Port map( I_Data_0 => Data_Out(31 downto 28) ,
            I_Data_1 => Data_Out(27 downto 24),
            I_Data_2 => Data_Out(23 downto 20),
            I_Data_3 => Data_Out(19 downto 16),
            I_Data_4 => Data_Out(15 downto 12),
            I_Data_5 => Data_Out(11 downto 8),
            I_Data_6 => Data_Out(7 downto 4),
            I_Data_7 => Data_Out(3 downto 0),
            I_Reg_Sel => Reg_Sel_A,
            O_MUX_8_4 => Mux_8_4_A_out
            );

MUX_8_4_B : MUX_8_4
    Port map(I_Data_0 => Data_Out(31 downto 28) ,
            I_Data_1 => Data_Out(27 downto 24),
            I_Data_2 => Data_Out(23 downto 20),
            I_Data_3 => Data_Out(19 downto 16),
            I_Data_4 => Data_Out(15 downto 12),
            I_Data_5 => Data_Out(11 downto 8),
            I_Data_6 => Data_Out(7 downto 4),
            I_Data_7 => Data_Out(3 downto 0),
            I_Reg_Sel => Reg_Sel_B,
            O_MUX_8_4 => Mux_8_4_B_out
            );

MUX_2_4_0 : MUX_2_4
     Port map( I_Imm_Val  => Imm_Val,
            I_Adder_4 => Adder_4,
            I_Load_Sel  => Load_Sel,
            O_MUX_2_4 => Data_In
            );
            
MUX_2_3_0 : MUX_2_3
    Port map( I_Adder_3 => bit_3_out, 
           I_Jump_Addr=> jmpaddr , 
           I_Jump_Flag => jmpflg, 
           O_MUX_2_3 => Mux_2_3_out  
           );
           
 LUT_16_7_0 : LUT_16_7
    port map(
            I_address => led_address,
            O_data => Seg7_Out
            );

Reg_1<=Data_Out(27 downto 24);

led_address <= Data_Out(27 downto 24);

Seg7_Anode <= "1110";

end Behavioral;
