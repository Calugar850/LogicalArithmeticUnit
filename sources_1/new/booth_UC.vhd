----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 19:20:35
-- Design Name: 
-- Module Name: booth_UC - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_UC is
  generic (n : natural := 8);
  Port (Clk : in std_logic;
        Rst : in std_logic;
        Start : in std_logic;
        QQ0_1 : in std_logic_vector (1 downto 0);
        RstQ1 : out std_logic;
        LoadQ : out std_logic;
        ShrAQ : out std_logic;
        LoadA : out std_logic;
        RstA : out std_logic;
        SubB : out std_logic;
        LoadB : out std_logic;
        Term : out std_logic);
end booth_UC;

architecture Behavioral of booth_UC is
type TIP_STARE is (idle, inceput, verificareQ, adunaB, scadeB, shiftare, verificaC, stop);
signal stare : TIP_STARE;
signal C : natural:=0;
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
                    stare<=verificareQ;
                    c<=n; 
                when verificareQ=>
                    if QQ0_1="01" then
                        stare<=adunaB;
                    end if;
                    if QQ0_1="10" then
                        stare<=scadeB;
                    end if;
                    if QQ0_1="00" or QQ0_1="11" then
                        stare<=shiftare;
                    end if;
                when adunaB=>
                    stare<=shiftare;    
                when scadeB=>
                    stare<=shiftare;    
                when shiftare=>
                    c<= c-1;
                    stare<=verificaC;
                when verificaC=>
                    if c=0 then
                        stare<=stop;
                    else
                        stare<=verificareQ;
                    end if;
                when stop=>
                    stare<=idle;                                              
            end case;    
        end if;
    end if;
end process;

proc2: process (Stare)
begin
RstQ1 <='0';
LoadQ <='0';
ShrAQ <='0';
LoadA <='0';
RstA  <='0';
SubB  <='0';
LoadB <='0';
Term  <='0';
    case stare is
        when inceput     =>
            RstQ1 <='1';
            LoadQ <='1';
            LoadB <='1'; 
            RstA  <='1';
        when adunaB      => 
            LoadA <='1';
        when scadeB      =>
            LoadA <='1';
            SubB  <='1'; 
        when shiftare    => 
            ShrAQ <='1';
        when stop        =>
            Term  <='1';
        when others => LoadA <= '0';     
    end case;    
end process;


end Behavioral;
