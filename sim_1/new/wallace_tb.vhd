----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2021 18:42:58
-- Design Name: 
-- Module Name: wallace_tb - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wallace_tb is
--  Port ( );
end wallace_tb;

architecture Behavioral of wallace_tb is
signal X : std_logic_vector (7 downto 0) := x"01";
signal Y : std_logic_vector (7 downto 0) := x"02";
signal P : std_logic_vector (15 downto 0) := x"0002";
begin
DUT: entity WORK.wallace8biti port map(
        X=>X,
        Y=>Y,
        P=>P);
        
gen_vect_test: process
begin
   for i in 0 to 50 loop
          report "Valoare obtinuta " &
          STD_LOGIC'image (P(15)) &
          STD_LOGIC'image (P(14)) &
          STD_LOGIC'image (P(13)) &
          STD_LOGIC'image (P(12)) &
          STD_LOGIC'image (P(11)) &
          STD_LOGIC'image (P(10)) &
          STD_LOGIC'image (P(9)) &
          STD_LOGIC'image (P(8)) &
          STD_LOGIC'image (P(7)) &
          STD_LOGIC'image (P(6)) &
          STD_LOGIC'image (P(5)) &
          STD_LOGIC'image (P(4)) &
          STD_LOGIC'image (P(3)) &
          STD_LOGIC'image (P(2)) &
          STD_LOGIC'image (P(1)) &
          STD_LOGIC'image (P(0)) &
          ") la t = " & TIME'image (now)
          severity ERROR;
      X<=X+1;
      wait for 10 ns;
   end loop;
   wait;
end process;       

end Behavioral;
