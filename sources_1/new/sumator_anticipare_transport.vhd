----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 14:22:38
-- Design Name: 
-- Module Name: sumator_anticipare_transport - Behavioral
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

entity sumator_anticipare_transport is
  Port (X : in std_logic_vector (7 downto 0);
        Y : in std_logic_vector (7 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (7 downto 0);
        Tout : out std_logic);
end sumator_anticipare_transport;

architecture Behavioral of sumator_anticipare_transport is
signal T2, T4, T6 : std_logic :='0';
signal P01, P23, P45, P67 : std_logic :='0';
signal G01, G23, G45, G67 : std_logic :='0';
signal P : std_logic_vector(3 downto 0):="0000";
signal G : std_logic_vector(3 downto 0):="0000";
signal T : std_logic_vector(3 downto 0):="0000";

component sumator_2_biti is
  Port (x : in std_logic_vector (1 downto 0);
        y : in std_logic_vector (1 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (1 downto 0);
        P : out std_logic;
        G : out std_logic);
end component;

begin

sumator1: sumator_2_biti port map(x=>X(1 downto 0),y=>Y(1 downto 0),Tin=>Tin,S=>S(1 downto 0),P=>P01,G=>G01);
sumator2: sumator_2_biti port map(x=>X(3 downto 2),y=>Y(3 downto 2),Tin=>T2,S=>S(3 downto 2),P=>P23,G=>G23);
sumator3: sumator_2_biti port map(x=>X(5 downto 4),y=>Y(5 downto 4),Tin=>T4,S=>S(5 downto 4),P=>P45,G=>G45);
sumator4: sumator_2_biti port map(x=>X(7 downto 6),y=>Y(7 downto 6),Tin=>T6,S=>S(7 downto 6),P=>P67,G=>G67);

T2<=G01 or (P01 and Tin);
T4<=G23 or (P23 and T2);
T6<=G45 or (P45 and T4);
Tout<=G67 or (P67 and T6);

end Behavioral;
