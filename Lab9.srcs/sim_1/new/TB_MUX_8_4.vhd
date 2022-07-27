----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 08:21:53 PM
-- Design Name: 
-- Module Name: TB_MUX_8_4 - Behavioral
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

entity TB_MUX_8_4 is
--  Port ( );
end TB_MUX_8_4;

architecture Behavioral of TB_MUX_8_4 is
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
signal d0,d1,d2,d3,d4,d5,d6,d7,output:std_logic_vector(3 downto 0);
signal reg_sel:std_logic_vector(2 downto 0);
begin
UUT: MUX_8_4
    PORT MAP(
        I_Data_0=>d0,
        I_Data_1=>d1,
        I_Data_2=>d2,
        I_Data_3=>d3,
        I_Data_4=>d4,
        I_Data_5=>d5,
        I_Data_6=>d6,
        I_Data_7=>d7,
        I_Reg_Sel=>reg_sel,
        O_MUX_8_4=>output
    );
    process
    begin
        reg_sel<="000";
        d0<="0101";
        d1<="1001";
        d2<="0001";
        d3<="0111";
        d4<="1011";
        d5<="1111";
        d6<="0011";
        d7<="1100";
        wait for 50ns;
        reg_sel<="001";
        wait for 50ns;
        reg_sel<="010";
        wait for 50ns;
        reg_sel<="011";
        wait for 50ns;
        reg_sel<="100";
        wait for 50ns;
        reg_sel<="101";
        wait for 50ns;
        reg_sel<="110";
        wait for 50ns;
        reg_sel<="111";
        wait for 50ns;

        reg_sel<="000";
        d0<="1110";
        d1<="0000";
        d2<="0110";
        d3<="0100";
        d4<="1000";
        d5<="1010";
        d6<="0010";
        d7<="1101";
        wait for 50ns;
        reg_sel<="001";
        wait for 50ns;
        reg_sel<="010";
        wait for 50ns;
        reg_sel<="011";
        wait for 50ns;
        reg_sel<="100";
        wait for 50ns;
        reg_sel<="101";
        wait for 50ns;
        reg_sel<="110";
        wait for 50ns;
        reg_sel<="111";
        wait;
    end process;
end Behavioral;
