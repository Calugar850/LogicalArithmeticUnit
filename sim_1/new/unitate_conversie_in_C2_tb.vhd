----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 11:48:29
-- Design Name: 
-- Module Name: unitate_conversie_in_C2_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unitate_conversie_in_C2_tb is
--  Port ( );
end unitate_conversie_in_C2_tb;

architecture Behavioral of unitate_conversie_in_C2_tb is
signal X : STD_LOGIC_VECTOR (7 downto 0) :=x"09"; 
signal Y : STD_LOGIC_VECTOR (7 downto 0) :=x"17"; 

begin
DUT: entity WORK.unitate_conversie_in_C2 port map
        (Yin=>X,
         Yout=>Y);
         
gen_vect_test: process
begin
    for i in 0 to 50 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (Y(7)) &
            STD_LOGIC'image (Y(6)) &
            STD_LOGIC'image (Y(5)) &
            STD_LOGIC'image (Y(4)) &
            STD_LOGIC'image (Y(3)) &
            STD_LOGIC'image (Y(2)) &
            STD_LOGIC'image (Y(1)) &
            STD_LOGIC'image (Y(0)) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       X<=X+1;
       wait for 10 ns;
    end loop;
    wait;
end process;


end Behavioral;
