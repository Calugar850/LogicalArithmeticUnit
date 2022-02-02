----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 21:42:12
-- Design Name: 
-- Module Name: produs_shift_add - Behavioral
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

entity produs_shift_add is
  Port (Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;
        Start : in STD_LOGIC;
        X   : in STD_LOGIC_VECTOR(7 downto 0);
        Y   : in STD_LOGIC_VECTOR(7 downto 0);
        A   : out STD_LOGIC_VECTOR(8 downto 0);
        Q   : out STD_LOGIC_VECTOR(7 downto 0);
        Term : out STD_LOGIC);
end produs_shift_add;

architecture Behavioral of produs_shift_add is
signal LoadQ, ShrAQ, LoadA, RstA, LoadB, Q0 :  std_logic;
signal Tout, OVF : std_logic; 
signal TinInt, Aintermediar, Intrare : STD_LOGIC_VECTOR(8 downto 0):=(others => '0');
signal Suma, QB, QQ : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin

sumator: entity WORK.produs_shift_add_ADDN port map(
            X=>QB,
            Y=>Aintermediar(7 downto 0),
            Tin=>'0',
            S=>Suma,
            Tout=>Tout,
            OVF=>OVF);
            
Intrare(8)<=Tout;            
Intrare(7 downto 0)<=Suma;            
    
registru_B: entity WORK.produs_shift_add_FDN port map(
                D=>X,
                CE=>LoadB,
                Clk=>Clk,
                Rst=>Rst,
                Q=>QB);
                
registru_A: entity WORK.produs_shift_add_SRRNA port map(
                D=>Intrare,
                SRI=>'0',
                Load=>LoadA,
                CE=>ShrAQ,
                Clk=>Clk,
                Rst=>RstA,
                Q=>Aintermediar);
                
registru_Q: entity WORK.produs_shift_add_SRRNQ port map(            
                D=>Y,
                SRI=>Aintermediar(0),
                Load=>LoadQ,
                CE=>ShrAQ,
                Clk=>Clk,
                Rst=>Rst,
                Q=>QQ);
                
Q0 <= QQ(0);                                                
                
unitate_control: entity WORK.produs_shift_add_UC port map(
                Clk=>Clk,
                Rst=>Rst,
                Start=>Start,
                Q0=>Q0,
                LoadQ=>LoadQ,
                ShrAQ=>ShrAQ,
                LoadA=>LoadA,
                RstA=>RstA,
                LoadB=>LoadB,
                Term=>Term);
   
A <= Aintermediar;
Q <= QQ;

end Behavioral;
