----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:35:47
-- Design Name: 
-- Module Name: sumator_bcd_2cifre - Behavioral
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

entity sumator_bcd_2cifre is
    Port (X : in std_logic_vector (7 downto 0);
          Y : in std_logic_vector (7 downto 0);
          Tin : in std_logic;
          S : out std_logic_vector (7 downto 0);
          Tout : out std_logic);
end sumator_bcd_2cifre;

architecture Behavioral of sumator_bcd_2cifre is
signal T0: std_logic;
component sumator_4biti_bcd is
  Port (x : in std_logic_vector (3 downto 0);
        y : in std_logic_vector (3 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (3 downto 0);
        Tout : out std_logic);
end component;
begin

sumator_bcd1: sumator_4biti_bcd port map(x=>X(3 downto 0),y=>Y(3 downto 0),Tin=>Tin,S=>S(3 downto 0),Tout=>T0);
sumator_bcd2: sumator_4biti_bcd port map(x=>X(7 downto 4),y=>Y(7 downto 4),Tin=>T0,S=>S(7 downto 4),Tout=>Tout);


end Behavioral;
