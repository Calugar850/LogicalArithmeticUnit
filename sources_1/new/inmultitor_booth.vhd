----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 19:20:53
-- Design Name: 
-- Module Name: inmultitor_booth - Behavioral
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

entity inmultitor_booth is
  generic (n : natural := 8);
  Port (Clk : in std_logic;
        Rst : in std_logic;
        Start : in std_logic;
        X : in std_logic_vector (n-1 downto 0);
        Y : in std_logic_vector (n-1 downto 0);
        A : out std_logic_vector (n-1 downto 0);
        Q : out std_logic_vector (n-1 downto 0);
        Term : out std_logic);
end inmultitor_booth;

architecture Behavioral of inmultitor_booth is
signal RstQ1, LoadQ, ShrAQ, LoadA, RstA, SubB, LoadB :  std_logic;
signal Aintermediar, Bintermediar, Qintermediar : std_logic_vector (n-1 downto 0);
signal OVF : std_logic;
signal Tout : std_logic;
signal QQ0_1 : std_logic_vector (1 downto 0);
signal Suma : std_logic_vector (n-1 downto 0);
signal vector_de_xor : std_logic_vector (n-1 downto 0);

begin
bistabil_FD: entity WORK.booth_FD port map(
                D=>Qintermediar(0),
                CE=>ShrAq,
                Clk=>Clk,
                Rst=>RstQ1,
                Q=>QQ0_1(0));

QQ0_1(1)<=Qintermediar(0);                
                
registru_FDN: entity WORK.booth_FDN generic map(n) port map(
                D=>X,
                CE=>LoadB,
                Clk=>Clk,
                Rst=>'0',
                Q=>Bintermediar);
                
registru_SRRN_A: entity WORK.booth_SRRN generic map(n) port map(
                D=>Suma,
                SRI=>Aintermediar(7),
                Load=>LoadA,
                CE=>ShrAQ,
                Clk=>Clk,
                Rst=>RstA,
                Q=>Aintermediar);
               
registru_SRRN_Q: entity WORK.booth_SRRN generic map(n) port map(
                D=>Y,
                SRI=>Aintermediar(0),
                Load=>LoadQ,
                CE=>ShrAQ,
                Clk=>Clk,
                Rst=>Rst,
                Q=>Qintermediar);                
               
sumator_ADDN: entity WORK.booth_ADDN generic map(n) port map(
                X=>Aintermediar,
                Y=>vector_de_xor, 
                Tin=>SubB,
                S=>Suma,
                Tout=>Tout,
                OVF=>OVF);
                
unitate_de_control: entity WORK.booth_UC generic map(n) port map(
                Clk=>Clk,
                Rst=>Rst,
                Start=>Start,
                QQ0_1=>QQ0_1,
                RstQ1=>RstQ1,
                LoadQ=>LoadQ,
                ShrAQ=>ShrAQ,
                LoadA=>LoadA,
                RstA=>RstA,
                SubB=>SubB,
                LoadB=>LoadB,
                Term=>Term);
                
vector_xor: for i in 0 to n-1 generate
            vector_de_xor(i)<=Bintermediar(i) xor SubB;
end generate vector_xor;

A<=Aintermediar;
Q<=Qintermediar;            

end Behavioral;
