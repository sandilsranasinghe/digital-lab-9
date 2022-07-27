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
    component D_FF
        Port ( D : in STD_LOGIC;
                Res : in STD_LOGIC;
                Clk : in STD_LOGIC;
                Q : out STD_LOGIC;
                Qbar : out STD_LOGIC);
    end component;

    signal D0,D1,D2 : STD_LOGIC;
    signal yout : STD_LOGIC_VECTOR (2 downto 0);
begin

    D_FF_0 : D_FF
    PORT MAP(
        D => D0,
        Res => I_Res,
        Clk => I_Clk,
        Q =>yout(0)
        );     
        
       
    D_FF_1 : D_FF
        PORT MAP(
            D => D1,
            Res => I_Res,
            Clk => I_Clk,
            Q =>yout(1)
            );     
    D_FF_2 : D_FF
            PORT MAP(
                D => D2,
                Res => I_Res,
                Clk => I_Clk,
                Q =>yout(2)
                );     
process(I_Clk)
    begin   
    if (I_EN_PC='1') then 
        if(rising_edge(I_Clk)) then
            
            if I_Res = '1' then
            O_Mem_Sel <= "000";
            
            else    
            D0 <= I_A_In(0);
            D1 <=  I_A_In(1);
            D2 <= I_A_In(2);            
            
            O_Mem_Sel <= yout;
         
            end if;  
        end if;   
    end if;
end process;  
--to here
end Behavioral;
