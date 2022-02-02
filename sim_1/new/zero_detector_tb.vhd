----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.12.2021 23:11:10
-- Design Name: 
-- Module Name: zero_detector_tb - Behavioral
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

entity zero_detector_tb is
--  Port ( );
end zero_detector_tb;

architecture Behavioral of zero_detector_tb is
signal x : STD_LOGIC_VECTOR (7 downto 0) :=x"38";
signal output : STD_LOGIC :='0'; 

begin
DUT: entity WORK.zero_detector port map(
        x=>x,
        output=>output);
         
gen_vect_test: process
begin
    for i in 0 to 70 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (output) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       x<=x-1;
       wait for 10 ns;
    end loop;
    wait;
end process;



end Behavioral;
