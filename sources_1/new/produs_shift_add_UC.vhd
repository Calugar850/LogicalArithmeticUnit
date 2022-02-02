----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 21:39:16
-- Design Name: 
-- Module Name: produs_shift_add_UC - Behavioral
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

entity produs_shift_add_UC is
  Port (Clk : in std_logic;
        Rst : in std_logic;
        Start : in std_logic;
        Q0 : in std_logic;
        LoadQ : out std_logic;
        ShrAQ : out std_logic;
        LoadA : out std_logic;
        RstA : out std_logic;
        LoadB : out std_logic;
        Term : out std_logic);
end produs_shift_add_UC;

architecture Behavioral of produs_shift_add_UC is
type TIP_STARE is (idle, inceput, verificareQ, adunaB, shiftare, verificaC, stop);
signal stare : TIP_STARE;
signal C : natural:=8;
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
                    c<=8; 
                when verificareQ=>
                    if Q0='1' then
                        stare<=adunaB;
                    else
                        stare<=shiftare;    
                    end if;
                when adunaB=>
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
LoadQ <='0';
ShrAQ <='0';
LoadA <='0';
RstA  <='0';
LoadB <='0';
Term  <='0';
    case stare is
        when inceput     =>
            LoadQ <='1';
            LoadB <='1'; 
            RstA  <='1';
        when adunaB      => 
            LoadA <='1';
        when shiftare    => 
            ShrAQ <='1';
        when stop        =>
            Term  <='1';
        when others => LoadA <= '0';     
    end case;    
end process;

end Behavioral;
