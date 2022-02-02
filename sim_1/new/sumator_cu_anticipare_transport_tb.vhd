----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 12:10:40
-- Design Name: 
-- Module Name: sumator_cu_anticipare_transport_tb - Behavioral
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

entity sumator_cu_anticipare_transport_tb is
--  Port ( );
end sumator_cu_anticipare_transport_tb;

architecture Behavioral of sumator_cu_anticipare_transport_tb is
signal X : STD_LOGIC_VECTOR (7 downto 0) :=x"FB"; 
signal Y : STD_LOGIC_VECTOR (7 downto 0) :=x"01"; 
signal Tin : STD_LOGIC:='0';
signal S : STD_LOGIC_VECTOR (7 downto 0) :=x"FC"; 
signal Tout : STD_LOGIC :='0';
begin
DUT: entity WORK.sumator_anticipare_transport port map
        (X=>X,
         Y=>Y,
         Tin=>Tin,
         S=>S,
         Tout=>Tout);
         
gen_vect_test: process
begin
    for i in 0 to 50 loop
            report "Valoare obtinuta " &
            STD_LOGIC'image (S(7)) &
            STD_LOGIC'image (S(6)) &
            STD_LOGIC'image (S(5)) &
            STD_LOGIC'image (S(4)) &
            STD_LOGIC'image (S(3)) &
            STD_LOGIC'image (S(2)) &
            STD_LOGIC'image (S(1)) &
            STD_LOGIC'image (S(0)) &
            ") la t = " & TIME'image (now)
            severity ERROR;
       X<=X+1;
       wait for 10 ns;
    end loop;
    wait;
end process;

end Behavioral;
