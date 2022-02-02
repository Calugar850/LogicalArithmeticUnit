----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 19:18:42
-- Design Name: 
-- Module Name: booth_SRRN - Behavioral
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

entity booth_SRRN is
  generic (n : natural);
  Port (D : in std_logic_vector (n-1 downto 0);
        SRI : in std_logic;
        Load : in std_logic;
        CE : in std_logic;
        Clk : in std_logic;
        Rst : in std_logic;
        Q : out std_logic_vector (n-1 downto 0));
end booth_SRRN;

architecture Behavioral of booth_SRRN is
signal intermediar : std_logic_vector (n-1 downto 0) := (others => '0');
begin

process(Clk)
begin
    if rising_edge(Clk) then
        if Rst='1' then
            intermediar<= (others => '0');
        elsif Load='1' then 
            intermediar<=D;
        elsif CE='1' then
            intermediar<= SRI & intermediar (n-1 downto 1);
        end if;
    end if;
end process;

Q<=intermediar;

end Behavioral;
