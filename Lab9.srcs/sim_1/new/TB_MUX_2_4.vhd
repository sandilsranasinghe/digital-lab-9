----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 07:40:31 PM
-- Design Name: 
-- Module Name: TB_MUX_2_4 - Behavioral
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

entity TB_MUX_2_4 is
--  Port ( );
end TB_MUX_2_4;

architecture Behavioral of TB_MUX_2_4 is
component MUX_2_4
    Port ( I_Imm_Val : in STD_LOGIC_VECTOR (3 downto 0);
            I_Adder_4 : in STD_LOGIC_VECTOR (3 downto 0);
            I_Load_Sel : in STD_LOGIC;
            O_MUX_2_4 : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal value,adder,output:std_logic_vector(3 downto 0);
signal load_select:std_logic;
begin
UUT: MUX_2_4
    PORT MAP(
        I_Imm_Val=>value,
        I_Adder_4=>adder,
        I_Load_Sel=>load_select,
        O_MUX_2_4=>output
    );
    process
    begin
            value<="1101";
            adder<="0001";
            load_select<='0';
            wait for 100ns;
            load_select<='1';
            wait for 100ns;

            value<="1111";
            adder<="0011";
            load_select<='0';
            wait for 100ns;
            load_select<='1';
            wait for 100ns;
            
            value<="0000";
            adder<="1011";
            load_select<='0';
            wait for 100ns;
            load_select<='1';
            wait for 100ns;

            value<="0011";
            adder<="1000";
            load_select<='0';
            wait for 100ns;
            load_select<='1';
            wait;
    end process;
end Behavioral;
