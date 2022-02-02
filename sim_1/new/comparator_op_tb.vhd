----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2021 19:29:45
-- Design Name: 
-- Module Name: comparator_op_tb - Behavioral
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

entity comparator_op_tb is
--  Port ( );
end comparator_op_tb;

architecture Behavioral of comparator_op_tb is
signal x : STD_LOGIC_VECTOR (7 downto 0) :=x"FB"; 
signal y : STD_LOGIC_VECTOR (7 downto 0) :=x"D2"; 
signal output : STD_LOGIC :='0'; 

begin
DUT: entity WORK.comparator_op port map(
        x=>x,
        y=>y,
        output=>output);
         
gen_vect_test: process
begin
    for i in 0 to 50 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (output) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       y<=y+1;
       wait for 10 ns;
    end loop;
    wait;
end process;


end Behavioral;
