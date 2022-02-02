----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 14:29:36
-- Design Name: 
-- Module Name: sumator_elementar - Behavioral
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

entity sumator_elementar is
  Port (x : in std_logic;
        y : in std_logic;
        Tin : in std_logic;
        S : out std_logic;
        Tout : out std_logic);
end sumator_elementar;

architecture Behavioral of sumator_elementar is

begin

S<=x xor y xor Tin;
Tout<=(x and y) or ((x or y) and Tin);

end Behavioral;
