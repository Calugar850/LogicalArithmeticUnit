----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:08:20
-- Design Name: 
-- Module Name: produs_shiftare_adunare_tb - Behavioral
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

entity produs_shiftare_adunare_tb is
--  Port ( );
end produs_shiftare_adunare_tb;

architecture Behavioral of produs_shiftare_adunare_tb is
signal Clk, Rst, Tem, Start : std_logic :='0';
signal X : std_logic_vector (7 downto 0) :=x"7F"; --x"0C", x"01", x"02", x"7D"
signal Y : std_logic_vector (7 downto 0) :=x"7F"; --x"0C", x"02", x"04", x"7D"
signal A : std_logic_vector (8 downto 0) :="000111111";
signal Q : std_logic_vector (7 downto 0) :=x"01";
signal P : std_logic_vector (15 downto 0) :=x"0000";
CONSTANT CLK_PERIOD : TIME := 10 ns;
begin
DUT: entity WORK.produs_shift_add port map
                (Clk=>Clk,
                 Rst=>Rst,
                 Start=>Start,
                 X=>X,
                 Y=>Y,
                 A=>A,
                 Q=>Q,
                 Term=>Tem);

gen_clk: PROCESS
	BEGIN
		Clk <= '1';
		WAIT FOR (CLK_PERIOD/2);
		Clk <= '0';
		WAIT FOR (CLK_PERIOD/2);
END PROCESS gen_clk;

gen_vec_test: process
variable NrErori : INTEGER := 0;       
begin
   Start<='1';
   wait for 320ns;
   P(15 DOWNTO 8)<=A(7 downto 0);
   P(7 DOWNTO 0)<=Q;
   if ((A/="000111111") or (Q/=x"01")) then
        NrErori:=NrErori+1;
        report "EROARE"
        severity ERROR;
   end if;
   wait for 300ns;
   if NrErori/=0 then
        report "Numar Erori egal cu " & INTEGER'image(NrErori);
   end if;
   wait;           
end process; 


end Behavioral;
