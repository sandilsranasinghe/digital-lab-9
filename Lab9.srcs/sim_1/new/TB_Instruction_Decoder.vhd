----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 08:00:21 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

    component Instruction_Decoder
        Port ( 
            I_Instruction : in STD_LOGIC_VECTOR (11 downto 0); 
            I_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0); 
            I_Clk : in STD_LOGIC;
            I_Reset: in STD_LOGIC;
            O_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0); 
            O_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0); 
            O_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0); 
            O_EN_PC : out STD_LOGIC; 
            O_EN_Store : out STD_LOGIC; 
            O_Add_Sub_Sel : out STD_LOGIC;
            O_Jump_Flag : out STD_LOGIC;
            O_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0);
            O_Load_Sel : out STD_LOGIC; 
            O_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0)
        ); 
    end component;
    signal i_instruction : STD_LOGIC_VECTOR (11 downto 0);
    signal i_jump_check, o_imm_val : STD_LOGIC_VECTOR (3 downto 0);
    signal Clk : STD_LOGIC := '0';
    signal i_reset, o_en_pc, o_en_store, o_add_sub_sel, o_jump_flag, o_load_sel : STD_LOGIC;
    signal o_reg_enable, o_reg_sel_a, o_reg_sel_b, o_jump_addr : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : Instruction_Decoder
        PORT MAP (
            I_Instruction => i_instruction,
            I_Jump_Check => i_jump_check,
            I_Clk => Clk,
            I_Reset => i_reset,
            O_Reg_Enable => o_reg_enable,
            O_Reg_Sel_A => o_reg_sel_a,
            O_Reg_Sel_B => o_reg_sel_b,
            O_EN_PC => o_en_pc,
            O_EN_Store => o_en_store,
            O_Add_Sub_Sel => o_add_sub_sel,
            O_Jump_Flag => o_jump_flag,
            O_Jump_Addr => o_jump_addr,
            O_Load_Sel => o_load_sel,
            O_Imm_Val => o_imm_val
        );

    process begin
        wait for 11ns; 
        Clk <= NOT(Clk);
    end process;

    process begin

        i_reset <= '1';
        wait for 30ns;

        i_reset <= '0';
        i_jump_check <= "0011";
        wait for 30ns;

        i_instruction <= "101010001101";
        wait for 120ns;

        i_reset <= '1';
        wait for 60ns;

        i_reset <= '0';
        i_instruction <= "101100001001";
        wait for 80ns;

        i_instruction <= "001111010000";
        wait for 80ns;

        i_instruction <= "110000000111";
        wait for 80ns;

        i_instruction <= "110110000101";
        i_jump_check <= "0000";
        wait for 80ns;

        i_instruction <= "011100000000";
        wait;
        
    end process;

end Behavioral;
