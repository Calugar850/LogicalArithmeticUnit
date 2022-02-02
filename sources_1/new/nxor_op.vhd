----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 19:01:16
-- Design Name: 
-- Module Name: nxor_op - Behavioral
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

entity nxor_op is
  Port (x : in std_logic_vector (7 downto 0);
       y : in std_logic_vector (7 downto 0);
       output : out std_logic_vector (7 downto 0));
end nxor_op;

architecture Behavioral of nxor_op is

begin
output<=not(x xor y);

end Behavioral;
