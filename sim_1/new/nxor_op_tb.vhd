----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2021 19:26:13
-- Design Name: 
-- Module Name: nxor_op_tb - Behavioral
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

entity nxor_op_tb is
--  Port ( );
end nxor_op_tb;

architecture Behavioral of nxor_op_tb is
signal x : STD_LOGIC_VECTOR (7 downto 0) :=x"FB"; 
signal y : STD_LOGIC_VECTOR (7 downto 0) :=x"02"; 
signal output : STD_LOGIC_VECTOR (7 downto 0) :=x"00"; 

begin
DUT: entity WORK.nxor_op port map(
        x=>x,
        y=>y,
        output=>output);
         
gen_vect_test: process
begin
    for i in 0 to 50 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (output(7)) &
            STD_LOGIC'image (output(6)) &
            STD_LOGIC'image (output(5)) &
            STD_LOGIC'image (output(4)) &
            STD_LOGIC'image (output(3)) &
            STD_LOGIC'image (output(2)) &
            STD_LOGIC'image (output(1)) &
            STD_LOGIC'image (output(0)) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       y<=y+1;
       wait for 10 ns;
    end loop;
    wait;
end process;


end Behavioral;
