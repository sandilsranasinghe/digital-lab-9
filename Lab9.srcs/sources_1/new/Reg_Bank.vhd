----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 05:17:49 AM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( I_Clk : in STD_LOGIC;
           I_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           I_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           I_Reset : STD_LOGIC;
           O_Data_Out : out STD_LOGIC_VECTOR (31 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is


component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_Sel : STD_LOGIC_VECTOR (7 downto 0);
signal En : STD_LOGIC; --Not sure

begin



Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
    I => I_Reg_Enable, --Not sure
    EN => I_Clk, --Not sure
    Y => Reg_sel
    );
 
    
O_Data_Out(31 downto 28) <= "0000";
-- Reg_0 : Reg
--    port map(
--              D => I_Data_In,
--              En => Reg_Sel(0),
--              Clk => I_Clk,
--              Q => O_Data_Out(31 downto 28)
--    ); --need to hardcode to store all 0s
 Reg_1 : Reg
    port map(
              D => I_Data_In,
              En => Reg_Sel(1),
              Clk => I_Clk,
              Q => O_Data_Out(27 downto 24)
        );  
 Reg_2 : Reg
       port map(
                 D => I_Data_In,
                 En => Reg_Sel(2),
                 Clk => I_Clk,
                 Q => O_Data_Out(23 downto 20)
       );
 Reg_3 : Reg
      port map(
                D => I_Data_In,
                En => Reg_Sel(3),
                Clk => I_Clk,
                Q => O_Data_Out(19 downto 16)
      );  
 Reg_4 : Reg
    port map(
              D => I_Data_In,
              En => Reg_Sel(4),
              Clk => I_Clk,
              Q => O_Data_Out(15 downto 12)
    );
Reg_5 : Reg
      port map(
                D => I_Data_In,
                En => Reg_Sel(5),
                Clk => I_Clk,
                Q => O_Data_Out(11 downto 8)
      );
Reg_6 : Reg
    port map(
              D => I_Data_In,
              En => Reg_Sel(6),
              Clk => I_Clk,
              Q => O_Data_Out(7 downto 4)
        );
Reg_7 : Reg
      port map(
                D => I_Data_In,
                En => Reg_Sel(7),
                Clk => I_Clk,
                Q => O_Data_Out(3 downto 0)
      );

end Behavioral;
