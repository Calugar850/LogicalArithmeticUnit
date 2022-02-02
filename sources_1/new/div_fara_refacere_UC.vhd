----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 19:46:11
-- Design Name: 
-- Module Name: div_fara_refacere_UC - Behavioral
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

entity div_fara_refacere_UC is
  generic(n : natural);
  Port (Clk : in std_logic;
        Rst : in std_logic;
        Start : in std_logic;
        An : in std_logic;
        BS : in std_logic;
        SubB : out std_logic;
        Update : out std_logic;
        UpdateBS : out std_logic;
        LoadA : out std_logic;
        LoadB : out std_logic;
        LoadQ : out std_logic;
        ShlAQ : out std_logic;
        Term : out std_logic);
end div_fara_refacere_UC;

architecture Behavioral of div_fara_refacere_UC is
type TIP_STARE is (idle, inceput, shiftare, verificareBS, scadeB, adunaB, modificaQ0, modificaBS, decrementeazaC, verificareC, reverificaBS, readunaB, stop);
signal stare : TIP_STARE;
signal C : natural;
begin
proc1: process(Clk)
begin
    if rising_edge(Clk) then
        if Rst='1' then
            stare<=idle;
        else
            case stare is
                when idle=>
                    if Start='1' then
                        stare<=inceput;
                    else
                        stare<=idle;
                   end if;
                when inceput=>
                    C<=n;
                    stare<=shiftare; 
                when shiftare=>
                    stare<=verificareBS;
                when verificareBS=> 
                    if BS='1' then
                        stare<=adunaB;
                    else
                        stare<=scadeB;
                    end if;
                when scadeB =>
                    stare<=modificaQ0;                                                 
                when adunaB => 
                    stare<=modificaQ0;
                when modificaQ0=>
                    stare<=modificaBS;
                when modificaBS=>
                    stare<=decrementeazaC;
                when decrementeazaC=>
                    C<=C-1;
                    stare<=verificareC;
                when verificareC=>
                    if (C=0) then
                        stare<=reverificaBS;
                    else
                        stare<=shiftare;
                    end if;
                when reverificaBS=>
                     if BS='1' then
                        stare<=readunaB;
                     else
                        stare<=stop;
                     end if;
                when readunaB=>
                    stare<=stop;
                when stop=>
                    stare<=idle;
                when others=>
                    stare<=idle;                                                                                 
            end case;    
        end if;
    end if;
end process;

proc2: process (Stare)
begin
LoadQ<='0';
ShlAQ<='0';
LoadA<='0';
SubB<='0';
LoadB<='0';
Update<='0';
UpdateBS<='0';
Term<='0';
--idle, inceput, shiftare, verificareBS, scadeB, adunaB, modificaQ0, modificaBS, decrementeazaC, verificareC, reverificaBS, readunaB, stop
    case stare is
        when inceput=>
            LoadB<='1';
            LoadQ<='1';
        when shiftare=>
            ShlAQ<='1';
        when scadeB=>
            SubB<='1';
            LoadA<='1';
        when adunaB=> 
            LoadA<='1';
        when modificaQ0=>
            Update<='1';
        when modificaBS=>
            UpdateBS<='1';
        when readunaB=>
            LoadA<='1';            
        when stop=>
            Term<='1';               
        when others => LoadA <= '0';     
    end case;    
end process;

end Behavioral;
