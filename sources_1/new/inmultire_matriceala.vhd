----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 16:37:54
-- Design Name: 
-- Module Name: inmultire_matriceala - Behavioral
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

entity inmultire_matriceala is
  Port (X : in std_logic_vector (7 downto 0);
        Y : in std_logic_vector (7 downto 0);
        P : out std_logic_vector (15 downto 0));
end inmultire_matriceala;

architecture Behavioral of inmultire_matriceala is
type matrice_s is array (0 to 7, 0 to 8) of std_logic;
type matrice_p is array (0 to 7, 0 to 7) of std_logic;
type matrice_t is array (0 to 6, 0 to 8) of std_logic;
signal PP : matrice_p :=((others => (others => '0')));
signal S : matrice_s :=((others => (others => '0')));
signal T : matrice_t :=((others => (others => '0')));
begin

--pp-urile pentru matrice
generate_pp_line: for i in 0 to 7 generate
    generate_pp_colum: for j in 0 to 7 generate
                        PP(i, j)<=x(j) and y(i);
    end generate generate_pp_colum;
end generate generate_pp_line;

--prima linie de sume
generate_s_prim: for i in 1 to 7 generate
                S(0, i)<=PP(0, i);
end generate generate_s_prim;
S(0, 8)<='0';
S(0, 0)<=x(0) and y(0);

--ultima coloana de sume                                        
generate_s_ultim: for i in 1 to 7 generate
                S(i, 8)<=T(i-1, 8);
end generate generate_s_ultim;

--prima coloana de biti de transport
generate_prima_coloana: for i in 0 to 6 generate
                T(i, 0)<='0';
end generate generate_prima_coloana;

--P(0)<=PP(0, 0);
S(7,8)<=T(6,8);

--port mapare sumatoarelor elementare
generate_s_line: for i in 1 to 7 generate
    generate_s_colum: for j in 1 to 8 generate
        DUT: entity WORK.sumator_elementar port map(x=>S(i-1,j),y=>PP(i,j-1),Tin=>T(i-1,j-1),S=>S(i,j-1),Tout=>T(i-1,j));                
    end generate generate_s_colum;
end generate generate_s_line;

--prima jumatate a produsului
generate_p_first: for i in 0 to 7 generate
                P(i)<=S(i,0);
end generate generate_p_first;

--a doua jumatate a produsului
generate_p_second: for i in 1 to 8 generate
                P(i+7)<=S(7,i);
end generate generate_p_second; 

end Behavioral;
