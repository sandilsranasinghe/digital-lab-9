----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 11:38:54 AM
-- Design Name: 
-- Module Name: Counter_2 - Behavioral
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

entity Counter_2 is
    Port ( I_Clk : in STD_LOGIC;
           I_Reset : in STD_LOGIC;
           O_Q0 : out STD_LOGIC;
           O_Q1 : out STD_LOGIC);
end Counter_2;
-- Note here that Q0 is the LSB and Q1 is the MSB, so `01` would be Q0=1 and Q1=0

architecture Behavioral of Counter_2 is

    component D_FF 
        port ( 
            D : in STD_LOGIC; 
            Res: in STD_LOGIC; 
            Clk : in STD_LOGIC; 
            Q : out STD_LOGIC; 
            Qbar : out STD_LOGIC
        ); 
    end component; 
    signal D0, D1, Q0, Q1 : STD_LOGIC;

begin

    D_FF_0 : D_FF
        PORT MAP (
            D => D0,
            Res => I_Reset,
            Clk => I_Clk,
            Q => Q0
        );
    D_FF_1 : D_FF
        PORT MAP (
            D => D1,
            Res => I_Reset,
            Clk => I_Clk,
            Q => Q1
        );

    D0 <= NOT Q0;
    D1 <= Q0 XOR Q1;
    O_Q0 <= Q0;
    O_Q1 <= Q1;

end Behavioral;
