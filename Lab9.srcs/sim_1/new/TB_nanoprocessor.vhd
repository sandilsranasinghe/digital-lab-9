----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 03:22:44 PM
-- Design Name: 
-- Module Name: TB_nanoprocessor - Behavioral
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

entity TB_nanoprocessor is
--  Port ( );
end TB_nanoprocessor;

architecture Behavioral of TB_nanoprocessor is

component Nanoprocessor 
        Port ( Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Overflow_led : out STD_LOGIC;
               Zero_led : out STD_LOGIC;
               Reg_7:out std_logic_vector(3 downto 0);
               Reg_1 : out std_logic_vector(3 downto 0);
               Seg7_Anode : out STD_LOGIC_VECTOR(3 downto 0);
               Seg7_Out : out STD_LOGIC_VECTOR(6 downto 0)
              );
    end component;

signal  S_Clk : STD_LOGIC := '0';
signal S_Res : STD_LOGIC;
signal S_Overflow_led : STD_LOGIC;
signal S_Zero_led : STD_LOGIC;
signal S_Reg_7: std_logic_vector(3 downto 0);

begin

UUT: Nanoprocessor
    port map (
                Clk => S_Clk,
                Res => S_Res,
                Overflow_led => S_Overflow_led,
                Zero_led => S_Zero_led,
                Reg_7 => S_Reg_7
    );
    
  process
  begin
  
  wait for 4ns;
  S_Clk <= not(S_Clk);
  
  end process;
  
  process
  begin
  
  S_Res <= '1';
  wait for 50ns;
  S_Res <= '0';
  wait;
    
  end process;
  


end Behavioral;
