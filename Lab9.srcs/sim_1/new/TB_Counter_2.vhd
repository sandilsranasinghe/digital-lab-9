----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 01:35:22 PM
-- Design Name: 
-- Module Name: TB_Counter_2 - Behavioral
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

entity TB_Counter_2 is
--  Port ( );
end TB_Counter_2;

architecture Behavioral of TB_Counter_2 is

    component Counter_2
        Port ( 
            I_Clk : in STD_LOGIC;
            I_Reset : in STD_LOGIC;
            O_Q0 : out STD_LOGIC;
            O_Q1 : out STD_LOGIC
        );
    end component;
    signal Res, Q0, Q1 : STD_LOGIC;
    signal Clk : STD_LOGIC := '0';

begin
    UUT : Counter_2
        PORT MAP (
            I_Clk => Clk,
            I_Reset => Res,
            O_Q0 => Q0,
            O_Q1 => Q1
        );

    process begin
        wait for 10ns; 
        Clk <= NOT(Clk);
    end process;

    process begin
        
        Res <= '1';
        wait for 80ns;

        Res <= '0';
        wait for 120ns;

        Res <= '1';
        wait for 80ns;

        Res <= '0';
        wait;

    end process;

end Behavioral;
