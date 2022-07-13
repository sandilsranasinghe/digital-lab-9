----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 05:17:44 PM
-- Design Name: 
-- Module Name: TB_Controller - Behavioral
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

entity TB_Controller is
--  Port ( );
end TB_Controller;

architecture Behavioral of TB_Controller is

    component Controller 
        Port ( I_Clk : in STD_LOGIC;
            I_Reset : in STD_LOGIC;
            O_EN_Ins : out STD_LOGIC;
            O_EN_Store : out STD_LOGIC;
            O_EN_PC : out STD_LOGIC);
    end component;
    signal Clk : STD_LOGIC := '0';
    signal Res, EN_Ins, EN_Store, EN_PC : STD_LOGIC;

begin

    UUT : Controller
        PORT MAP (
            I_Clk => Clk,
            I_Reset => Res,
            O_EN_Ins => EN_Ins,
            O_EN_Store => EN_Store,
            O_EN_PC => EN_PC
        );

    process begin
        wait for 11ns; 
        Clk <= NOT(Clk);
    end process;

    process begin
        
        Res <= '0';
        wait for 70ns;

        Res <= '1';
        wait for 95ns;

        Res <= '0';
        wait;

    end process;

end Behavioral;
