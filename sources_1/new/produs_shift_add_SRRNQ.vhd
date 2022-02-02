----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 21:41:01
-- Design Name: 
-- Module Name: produs_shift_add_SRRNQ - Behavioral
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

entity produs_shift_add_SRRNQ is
  Port (D : in std_logic_vector (7 downto 0);
        SRI : in std_logic;
        Load : in std_logic;
        CE : in std_logic;
        Clk : in std_logic;
        Rst : in std_logic;
        Q : out std_logic_vector (7 downto 0));
end produs_shift_add_SRRNQ;

architecture Behavioral of produs_shift_add_SRRNQ is
signal intermediar : std_logic_vector (7 downto 0) := (others => '0');
begin
process(Clk)
begin
    if rising_edge(Clk) then
        if Rst='1' then
            intermediar<= (others => '0');
        elsif Load='1' then 
            intermediar<=D;
        elsif CE='1' then
            intermediar<= SRI & intermediar (7 downto 1);
        end if;
    end if;
end process;

Q<=intermediar;

end Behavioral;
