----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 14:40:15
-- Design Name: 
-- Module Name: sumator_propagare_succesiva - Behavioral
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

entity sumator_propagare_succesiva is
  Port (X : in std_logic_vector (7 downto 0);
        Y : in std_logic_vector (7 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (7 downto 0);
        Tout : out std_logic);
end sumator_propagare_succesiva;

architecture Behavioral of sumator_propagare_succesiva is
signal T_intermediar : std_logic_vector (7 downto 0):= (others =>'0');
begin
T_intermediar(0)<=Tin;
sumator1: entity WORK.sumator_elementar port map(x=>X(0),y=>Y(0),Tin=>T_intermediar(0),S=>S(0),Tout=>T_intermediar(1));
sumator2: entity WORK.sumator_elementar port map(x=>X(1),y=>Y(1),Tin=>T_intermediar(1),S=>S(1),Tout=>T_intermediar(2));
sumator3: entity WORK.sumator_elementar port map(x=>X(2),y=>Y(2),Tin=>T_intermediar(2),S=>S(2),Tout=>T_intermediar(3));
sumator4: entity WORK.sumator_elementar port map(x=>X(3),y=>Y(3),Tin=>T_intermediar(3),S=>S(3),Tout=>T_intermediar(4));
sumator5: entity WORK.sumator_elementar port map(x=>X(4),y=>Y(4),Tin=>T_intermediar(4),S=>S(4),Tout=>T_intermediar(5));
sumator6: entity WORK.sumator_elementar port map(x=>X(5),y=>Y(5),Tin=>T_intermediar(5),S=>S(5),Tout=>T_intermediar(6));
sumator7: entity WORK.sumator_elementar port map(x=>X(6),y=>Y(6),Tin=>T_intermediar(6),S=>S(6),Tout=>T_intermediar(7));
sumator8: entity WORK.sumator_elementar port map(x=>X(7),y=>Y(7),Tin=>T_intermediar(7),S=>S(7),Tout=>Tout);

end Behavioral;
