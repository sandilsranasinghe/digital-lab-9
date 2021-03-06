----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:28:34 AM
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( I_A : in STD_LOGIC_VECTOR (2 downto 0);
           I_B : in STD_LOGIC_VECTOR (2 downto 0);
           O_S_Out : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3;

architecture Behavioral of Adder_3 is
component FA
port (
A: in std_logic;
B: in std_logic;
C_in: in std_logic;
S: out std_logic;
C_out: out std_logic);
end component;
signal FA_C:STD_LOGIC_VECTOR(2 downto 0);
begin
FA_0 : FA
port map (
A => I_A(0),
B => I_B(0),
C_in => '0', -- Set to ground
S => O_S_Out(0),
C_Out => FA_C(0));

FA_1 : FA
port map (
A => I_A(1),
B => I_B(1),
C_in => FA_C(0),
S => O_S_Out(1),
C_Out => FA_C(1));

FA_2 : FA
port map (
A => I_A(2),
B => I_B(2),
C_in => FA_C(1),
S => O_S_Out(2),
C_Out => FA_C(2));

end Behavioral;
