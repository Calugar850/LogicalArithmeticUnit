----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 16:38:33
-- Design Name: 
-- Module Name: div_refacere_rest_FDN - Behavioral
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

entity div_refacere_rest_FDN is
  generic(n : natural);
  Port (D : in std_logic_vector (n-1 downto 0);
        CE : in std_logic;
        Clk : in std_logic;
        Rst : in std_logic;
        Q : out std_logic_vector(n-1 downto 0));
end div_refacere_rest_FDN;

architecture Behavioral of div_refacere_rest_FDN is
signal intermediar : std_logic_vector (n-1 downto 0) := (others => '0');
begin
process(Clk)
begin
    if rising_edge(Clk) then
        if Rst='1' then
            Q<=intermediar; 
        elsif CE='1' then
            Q<=D;
        end if;       
    end if;    
end process;

end Behavioral;
