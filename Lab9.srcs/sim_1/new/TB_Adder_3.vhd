----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2022 19:06:20
-- Design Name: 
-- Module Name: TB_Adder_3 - Behavioral
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

entity TB_Adder_3 is
--  Port ( );
end TB_Adder_3;

architecture Behavioral of TB_Adder_3 is
component Adder_3
Port(I_A : in STD_LOGIC_VECTOR (2 downto 0);
     I_B : in STD_LOGIC_VECTOR (2 downto 0);
     O_S_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal a,b,s:STD_LOGIC_VECTOR(2 downto 0);
begin
UUT: Adder_3
Port map(
I_A=>a,
I_B=>b,
O_S_Out=>s
);

process
begin

a<="000";
b<="001";
wait for 100ns;

a<="010";
b<="011";
wait for 100ns;

a<="111";
b<="001";
wait for 100ns;

end process;

end Behavioral;
