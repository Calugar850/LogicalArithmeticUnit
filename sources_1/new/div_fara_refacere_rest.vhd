----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 19:46:31
-- Design Name: 
-- Module Name: div_fara_refacere_rest - Behavioral
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

entity div_fara_refacere_rest is
  generic (n: natural:=8);
  Port (Clk: in std_logic;
        Rst: in std_logic;
        Start: in std_logic;
        X: in std_logic_vector(2*n-1 downto 0);
        Y: in std_logic_vector(n-1 downto 0);
        A: out std_logic_vector(n-1 downto 0);  --rest
        Q: out std_logic_vector(n-1  downto 0);  --cat
        Term: out std_logic);
end div_fara_refacere_rest;

architecture Behavioral of div_fara_refacere_rest is
signal Iesire_RegB, Iesire_RegQ, Suma, Intrare_Sumator : std_logic_vector(n-1 downto 0):= (others => '0');
signal SubB, LoadB, ShlAQ, LoadQ, LoadA, Tout, Update, OVF, QBS, UpdateBS: std_logic := '0';
signal Iesire_RegA, Intrare_RegA, IntrareX : std_logic_vector(n downto 0):= (others => '0');

begin

Intrare_Sumator <= Iesire_RegB when SubB ='0' else not(Iesire_RegB);
Intrare_RegA <= Tout & Suma;
IntrareX <= '0' & X(2*n-1 downto n);

bistabilBS: entity WORK.booth_FD port map(
        D=>Tout,
        CE=>UpdateBS,
        Clk=>Clk,
        Rst=>Rst,
        Q=>QBS);
        
registruB: entity WORK.div_refacere_rest_FDN generic map (n=>n) port map(
        D=>Y, 
        CE=>LoadB,
        Clk=>Clk,
        Rst=>Rst,
        Q=>Iesire_RegB);      

unitate_control: entity WORK.div_fara_refacere_UC generic map (n=>n) port map(
        Clk=>Clk,
        Rst=>Rst,
        Start=>Start,
        An=>Tout,
        BS=>QBS,
        SubB=>SubB,
        Update=>Update,
        UpdateBS=>UpdateBS,
        LoadA=>LoadA,
        LoadB=>LoadB,
        LoadQ=>LoadQ, 
        ShlAQ=>ShlAQ,
        Term=>Term );

sumator: entity WORK.div_refacere_rest_ADDN generic map (n=>n) port map (
        X=>Iesire_RegA(n-1 downto 0),
        Y=>Intrare_Sumator,
        Tin=>SubB,
        S=>Suma,
        Tout=>Tout,
        OVF=>OVF);                        

registruA: entity WORK.div_refacere_rest_SRRN_A generic map (n+1) port map (
        D=>Intrare_RegA,
        D_initial=>IntrareX,
        Load_initial=>LoadQ,
        SLI=>Iesire_RegQ(n-1),
        Load=>LoadA,
        CE=>ShlAQ,
        Clk=>Clk,
        Rst=>Rst,
        Q=>Iesire_RegA);

registruQ: entity WORK.div_refacere_rest_SRRN_Q generic map (n=>n) port map (
        D=>X(n-1 downto 0),
        SLI=>'0',
        Load=>LoadQ,
        Update=>Update,
        An=>Tout,
        CE=>ShlAQ,
        Clk=>Clk,
        Rst=>Rst,
        Q=>Iesire_RegQ);

A <= Iesire_RegA(n-1 downto 0);
Q <= Iesire_RegQ;
end Behavioral;
