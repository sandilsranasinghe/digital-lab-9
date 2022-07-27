----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 04:57:47 AM
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( A_In : in STD_LOGIC_VECTOR (3 downto 0);
           B_In : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : in STD_LOGIC;
           S_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is
component RCA_4
port (
       A : in STD_LOGIC_VECTOR(3 downto 0);
       B : in STD_LOGIC_VECTOR(3 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR(3 downto 0);
       C_out : out STD_LOGIC);
end component;

signal a,s: STD_LOGIC_VECTOR(3 downto 0);

begin

--A=> input no1 to add or no to get the 2s complement--> add_sub_sel(0 add,1 neg)
--B=> input no2 to add or 0000

a(0)<=A_In(0) XOR Add_Sub_Sel;
a(1)<=A_In(1) XOR Add_Sub_Sel;
a(2)<=A_In(2) XOR Add_Sub_Sel;
a(3)<=A_In(3) XOR Add_Sub_Sel;

RCA_4_0: RCA_4
port map(
A=>a,
B=>B_In,
C_in=>Add_Sub_Sel,
S=>s,
C_out=>Overflow);

Zero <= not(s(0) or s(1) or s(2) or s(3));
S_Out<=s;

end Behavioral;
