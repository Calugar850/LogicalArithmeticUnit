----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2021 19:37:26
-- Design Name: 
-- Module Name: right_rol_tb - Behavioral
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

entity right_rol_tb is
--  Port ( );
end right_rol_tb;

architecture Behavioral of right_rol_tb is
signal x : STD_LOGIC_VECTOR (7 downto 0) :=x"FB"; 
signal y : STD_LOGIC_VECTOR (7 downto 0) :=x"00"; 

begin
DUT: entity WORK.right_rol_op port map(
        x=>x,
        y=>y);
         
gen_vect_test: process
begin
    for i in 0 to 50 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (y(7)) &
            STD_LOGIC'image (y(6)) &
            STD_LOGIC'image (y(5)) &
            STD_LOGIC'image (y(4)) &
            STD_LOGIC'image (y(3)) &
            STD_LOGIC'image (y(2)) &
            STD_LOGIC'image (y(1)) &
            STD_LOGIC'image (y(0)) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       x<=x+1;
       wait for 10 ns;
    end loop;
    wait;
end process;


end Behavioral;
