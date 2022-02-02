----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 19:15:54
-- Design Name: 
-- Module Name: parity_detector - Behavioral
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

entity parity_detector is
  Port (x : in std_logic_vector (7 downto 0);
        output : out std_logic);
end parity_detector;

architecture Behavioral of parity_detector is

begin

output<= x(7) xor x(6) xor x(5) xor x(4) xor x(3) xor x(2) xor x(1) xor x(0);

end Behavioral;
