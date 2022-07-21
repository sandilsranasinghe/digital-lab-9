----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 10:55:49 AM
-- Design Name: 
-- Module Name: Register_12_Bit - Behavioral
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

entity Register_12_Bit is
    Port ( I_Data : in STD_LOGIC_VECTOR (11 downto 0);
           I_Enable : in STD_LOGIC;
           I_Clk : in STD_LOGIC;
           O_Q : out STD_LOGIC_VECTOR (11 downto 0));
end Register_12_Bit;

architecture Behavioral of Register_12_Bit is

begin

    process (I_Clk) begin
        if (rising_edge(I_Clk)) then
            if I_Enable = '1' then
                O_Q <= I_Data;
            end if;
        end if ;
    end process;


end Behavioral;
