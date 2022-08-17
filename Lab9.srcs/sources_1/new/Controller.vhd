----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 04:52:45 PM
-- Design Name: 
-- Module Name: Controller - Behavioral
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

entity Controller is
    Port ( I_Clk : in STD_LOGIC;
           I_Reset : in STD_LOGIC;
           O_EN_Store : out STD_LOGIC;
           O_EN_PC : out STD_LOGIC);
end Controller;

architecture Behavioral of Controller is

    component Counter_2
        Port ( 
            I_Clk : in STD_LOGIC;
            I_Reset : in STD_LOGIC;
            O_Q0 : out STD_LOGIC;
            O_Q1 : out STD_LOGIC
        );
    end component;
    signal Q0, Q1, temp : STD_LOGIC;
    -- Note here that Q0 is the LSB and Q1 is the MSB, so `01` would be Q0=1 and Q1=0

begin

    Counter : Counter_2
        PORT MAP (
            I_Clk => I_Clk,
            I_Reset => I_Reset,
            O_Q0 => Q0,
            O_Q1 => Q1
        );

    O_EN_Store <= Q0 AND NOT(Q1);
    O_EN_PC <= Q0 AND Q1;

end Behavioral;
