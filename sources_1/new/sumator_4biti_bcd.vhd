----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:35:27
-- Design Name: 
-- Module Name: sumator_4biti_bcd - Behavioral
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

entity sumator_4biti_bcd is
  Port (x : in std_logic_vector (3 downto 0);
        y : in std_logic_vector (3 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (3 downto 0);
        Tout : out std_logic);
end sumator_4biti_bcd;

architecture Behavioral of sumator_4biti_bcd is
signal sum : std_logic_vector (3 downto 0):="0000";
signal x_inter : std_logic_vector (3 downto 0):="0000";
signal Tinter : std_logic :='0';
signal T_out_inter : std_logic :='0';

signal P00, P11 : std_logic :='0';
signal G0, G1 : std_logic :='0';

component sumator_4_biti is
  Port (x : in std_logic_vector (3 downto 0);
        y : in std_logic_vector (3 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (3 downto 0);
        P : out std_logic;
        G : out std_logic);
end component;

begin

sumator1: sumator_4_biti port map(x=>x,y=>y,Tin=>Tin,S=>sum,P=>P00,G=>G0);

T_out_inter<=( sum(3) and sum(1) ) or ( sum(3) and sum(2) ) or Tinter;

x_inter(3)<='0';
x_inter(2)<=T_out_inter;
x_inter(1)<=T_out_inter;
x_inter(0)<='0';

sumator2: sumator_4_biti port map(x=>x_inter,y=>sum,Tin=>'0',S=>S,P=>P11,G=>G1);
Tinter<=G0 or (P00 and Tin);
Tout<=T_out_inter;


end Behavioral;
