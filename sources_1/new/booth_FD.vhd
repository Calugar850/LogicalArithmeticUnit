----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 19:16:23
-- Design Name: 
-- Module Name: booth_FD - Behavioral
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

entity booth_FD is
  Port (D : in std_logic;
        CE : in std_logic;
        Clk : in std_logic;
        Rst : in std_logic;
        Q : out std_logic);
end booth_FD;

architecture Behavioral of booth_FD is

begin
process(Clk)
begin
    if rising_edge(Clk) then
        if Rst='1' then
            Q<='0';
        elsif CE='1' then
            Q<=D;
        end if;         
    end if;
end process;

end Behavioral;
