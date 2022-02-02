----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2021 19:02:34
-- Design Name: 
-- Module Name: sumator_produs - Behavioral
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

entity sumator_produs is
  Port (x : in std_logic;
        y : in std_logic;
        Tin : in std_logic;
        S : out std_logic;
        Tout : out std_logic);
end sumator_produs;

architecture Behavioral of sumator_produs is

begin
S<= X xor Y xor Tin;
Tout<= (X and Y) or ((x or y) and Tin);

end Behavioral;
