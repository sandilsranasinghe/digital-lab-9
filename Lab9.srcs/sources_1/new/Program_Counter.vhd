----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 05:26:38 AM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( I_Res : in STD_LOGIC;
           I_Clk : in STD_LOGIC;
           I_EN_PC: in STD_LOGIC;
           I_A_In : in STD_LOGIC_VECTOR (2 downto 0);
           O_Mem_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin

    process (I_Clk) begin
        if (rising_edge(I_Clk)) then
            if I_Res = '1' then
                O_Mem_Sel <= "000";
            else
                if I_EN_PC = '1' then
                    O_Mem_Sel <= I_A_In;
                end if;
            end if;
        end if ;
    end process;

--to here
end Behavioral;
