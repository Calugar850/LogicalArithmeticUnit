----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 19:19:43
-- Design Name: 
-- Module Name: booth_ADDN - Behavioral
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

entity booth_ADDN is
  generic (n : natural);
  Port (X : in std_logic_vector (n-1 downto 0);
        Y : in std_logic_vector (n-1 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (n-1 downto 0);
        Tout : out std_logic;
        OVF : out std_logic);
end booth_ADDN;

architecture Behavioral of booth_ADDN is
signal Tran : std_logic_vector (n downto 0) := (others =>'0');
begin
Tran(0)<=Tin;

generate_suma: for i in 0 to n-1 generate
                    S(i)<=X(i) xor Y(i) xor Tran(i);
                    Tran(i+1)<=(X(i) and Y(i)) or ( (X(i) or Y(i)) and Tran(i) );
end generate generate_suma;                    

Tout<=Tran(n);
OVF<=Tran(n) xor Tran(n-1);

end Behavioral;
