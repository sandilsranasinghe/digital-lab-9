----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.07.2022 23:20:10
-- Design Name: 
-- Module Name: TB_4_bit_add_sub - Behavioral
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

entity TB_4_bit_add_sub is
--  Port ( );
end TB_4_bit_add_sub;

architecture Behavioral of TB_4_bit_add_sub is
component Add_Sub_4
 Port ( I_A : in STD_LOGIC_VECTOR (3 downto 0);
           I_B : in STD_LOGIC_VECTOR (3 downto 0);
           I_Add_Sub_Sel : in STD_LOGIC;
           O_S_Out : out STD_LOGIC_VECTOR (3 downto 0);
           O_Overflow : out STD_LOGIC;
           O_Zero : out STD_LOGIC);
end component;
signal a,b,s:STD_LOGIC_VECTOR (3 downto 0);
signal sel,o,z:STD_LOGIC;
begin
UUT:Add_Sub_4
port map(
   I_A=>a,
   I_B=>b,
   I_Add_Sub_Sel=>sel, 
   O_S_Out=>s, 
   O_Overflow=>o, 
   O_Zero=>z
   );

process
begin
sel<='0';
a<="0001";
b<="0101";
wait for 100ns;

sel<='0';
a<="1111";
b<="0001";
wait for 100ns;

sel<='1';
a<="0001";
b<="0000";
wait for 100ns;

sel<='1';
a<="0100";
b<="0000";
wait for 100ns;
end process;

end Behavioral;
