----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 14:20:53
-- Design Name: 
-- Module Name: sumator_2_biti - Behavioral
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

entity sumator_2_biti is
  Port (x : in std_logic_vector (1 downto 0);
        y : in std_logic_vector (1 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (1 downto 0);
        P : out std_logic;
        G : out std_logic);
end sumator_2_biti;

architecture Behavioral of sumator_2_biti is
signal g0, g1, p0, p1, T0 : std_logic;

begin

g0<= x(0) and y(0);
g1<= x(1) and y(1);
p0<= x(0) or y(0);
p1<= x(1) or y(1);

S(0)<=x(0) xor y(0) xor Tin;
T0<=g0 or (p0 and Tin);
S(1)<=x(1) xor y(1) xor T0;
P<=p1 and p0;
G<=g1 or (p1 and g0);

end Behavioral;
