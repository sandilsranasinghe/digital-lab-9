----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 05:11:10 PM
-- Design Name: 
-- Module Name: TB_MUX_2_3 - Behavioral
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

entity TB_MUX_2_3 is
--  Port ( );
end TB_MUX_2_3;

architecture Behavioral of TB_MUX_2_3 is
component MUX_2_3
    Port ( I_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
        I_Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
        I_Jump_Flag : in STD_LOGIC;
        O_MUX_2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal adder_3,jump_adder,output:std_logic_vector(2 downto 0);
signal jump_flag:std_logic;
begin
UUT:MUX_2_3
    PORT MAP(
        I_Adder_3=>adder_3,
        I_Jump_Addr=>jump_adder,
        I_Jump_Flag=>jump_flag,
        O_MUX_2_3=>output       
    );
    process
    begin
        adder_3<="101";
        jump_adder<="001";
        jump_flag<='0';
        wait for 100ns;
        jump_flag<='1';
        wait for 100ns;

        adder_3<="100";
        jump_adder<="110";
        jump_flag<='0';
        wait for 100ns;
        jump_flag<='1';
        wait for 100ns;

        adder_3<="000";
        jump_adder<="111";
        jump_flag<='0';
        wait for 100ns;
        jump_flag<='1';
        wait for 100ns;

        adder_3<="010";
        jump_adder<="011";
        jump_flag<='0';
        wait for 100ns;
        jump_flag<='1';
        wait for 100ns;
    end process;
end Behavioral;
