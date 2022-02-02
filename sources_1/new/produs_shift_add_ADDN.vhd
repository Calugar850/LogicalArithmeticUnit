----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 21:40:24
-- Design Name: 
-- Module Name: produs_shift_add_ADDN - Behavioral
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

entity produs_shift_add_ADDN is
  Port (X : in std_logic_vector (7 downto 0);
        Y : in std_logic_vector (7 downto 0);
        Tin : in std_logic;
        S : out std_logic_vector (7 downto 0);
        Tout : out std_logic;
        OVF : out std_logic);
end produs_shift_add_ADDN;

architecture Behavioral of produs_shift_add_ADDN is
signal Tran : std_logic_vector (8 downto 0) := (others =>'0');
begin
Tran(0)<=Tin;
Tran(1)<=(X(0) and Y(0)) or ( (X(0) or Y(0)) and Tran(0));
Tran(2)<=(X(1) and Y(1)) or ( (X(1) or Y(1)) and Tran(1));
Tran(3)<=(X(2) and Y(2)) or ( (X(2) or Y(2)) and Tran(2));
Tran(4)<=(X(3) and Y(3)) or ( (X(3) or Y(3)) and Tran(3));
Tran(5)<=(X(4) and Y(4)) or ( (X(4) or Y(4)) and Tran(4));
Tran(6)<=(X(5) and Y(5)) or ( (X(5) or Y(5)) and Tran(5));
Tran(7)<=(X(6) and Y(6)) or ( (X(6) or Y(6)) and Tran(6));
Tran(8)<=(X(7) and Y(7)) or ( (X(7) or Y(7)) and Tran(7));

S(0)<=X(0) xor Y(0) xor Tran(0);
S(1)<=X(1) xor Y(1) xor Tran(1);
S(2)<=X(2) xor Y(2) xor Tran(2);
S(3)<=X(3) xor Y(3) xor Tran(3);
S(4)<=X(4) xor Y(4) xor Tran(4);
S(5)<=X(5) xor Y(5) xor Tran(5);
S(6)<=X(6) xor Y(6) xor Tran(6);
S(7)<=X(7) xor Y(7) xor Tran(7);

Tout<=Tran(8);
OVF<=Tran(8) xor Tran(7);

end Behavioral;
