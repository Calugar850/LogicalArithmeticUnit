----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:29:21
-- Design Name: 
-- Module Name: div_fara_refacere_rest_tb - Behavioral
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

entity div_fara_refacere_rest_tb is
--  Port ( );
end div_fara_refacere_rest_tb;

architecture Behavioral of div_fara_refacere_rest_tb is
signal Clk, Rst, Term, Start : std_logic :='0';
signal X : std_logic_vector (15 downto 0);  
signal Y : std_logic_vector (7 downto 0); 
signal Q : std_logic_vector (7 downto 0);
signal A : std_logic_vector (7 downto 0); 
CONSTANT CLK_PERIOD : TIME := 10 ns;
begin

DUT: entity WORK.div_fara_refacere_rest generic map(n=>8) port map(
            Clk=>Clk,
            Rst=>Rst,
            Start=>Start,
            X=>X,
            Y=>Y,
            A=>A,
            Q=>Q,
            Term=>Term );

gen_clk: PROCESS
	BEGIN
		Clk <= '1';
		WAIT FOR (CLK_PERIOD/2);
		Clk <= '0';
		WAIT FOR (CLK_PERIOD/2);
END PROCESS gen_clk;

gen_vec_test: process       
begin

Rst <= '1';
wait for clk_period;
Rst <= '0';
        
Start <= '1';
X<=x"0085";
Y<=x"05";
wait for 20ns;
Start<='0';
--rez este 1A in c ,rest:3 in r
wait;
end process; 


end Behavioral;
