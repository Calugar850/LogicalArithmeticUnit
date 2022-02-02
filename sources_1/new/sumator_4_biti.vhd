----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 15:34:41
-- Design Name: 
-- Module Name: sumator_4_biti - Behavioral
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

entity sumator_4_biti is
  Port (x : in std_logic_vector (3 downto 0);
        y : in std_logic_vector (3 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (3 downto 0);
        P : out std_logic;
        G : out std_logic);
end sumator_4_biti;

architecture Behavioral of sumator_4_biti is
signal g0, g1, g2, g3 : std_logic;
signal p0, p1, p2, p3 : std_logic;
signal T0, T1, T2 : std_logic;
begin
g0<=x(0) and y(0);
g1<=x(1) and y(1);
g2<=x(2) and y(2);
g3<=x(3) and y(3);

p0<=x(0) or y(0);
p1<=x(1) or y(1);
p2<=x(2) or y(2);
p3<=x(3) or y(3);

S(0)<=x(0) xor y(0) xor Tin;
T0<=g0 or (p0 and Tin);

S(1)<=x(1) xor y(1) xor T0;
T1<=g1 or (p1 and g0) or (p1 and p0 and Tin);

S(2)<=x(2) xor y(2) xor T1;
T2<=g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and Tin);

S(3)<=x(3) xor y(3) xor T2;
P<=p3 and p2 and p1 and p0;
G<=g3 or (p3 and g2) or (p3 and p2 and g1) or (p3 and p2 and p1 and g0);



end Behavioral;
