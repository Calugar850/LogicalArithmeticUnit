----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2021 14:58:24
-- Design Name: 
-- Module Name: modul_principal - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity modul_principal is
  Port (Clk: in std_logic;
        Operanzi: in std_logic_vector (7 downto 0);
        SelectieTipOp : in std_logic;
        Selectie_Numar : in std_logic;
        ShiftBit : in std_logic;
        Start : in std_logic;
        Rst : in std_logic;
        LoadNr : in std_logic;
        SelOp : in std_logic_vector (3 downto 0);
        Tout1 : out std_logic;
        Tout2 : out std_logic;
        Tout3 : out std_logic;
        Tout4 : out std_logic;
        Tout5 : out std_logic;
        Tout6 : out std_logic;
        Tout7 : out std_logic;
        Tout8 : out std_logic;
        Tout9 : out std_logic;
        Tout10 : out std_logic;
        Tout11 : out std_logic;
        Term1 : out std_logic;
        Term2 : out std_logic;
        Term3 : out std_logic;
        Term4 : out std_logic;
        An : out std_logic_vector (7 downto 0);
        Seg : out std_logic_vector (7 downto 0));
end modul_principal;

architecture Behavioral of modul_principal is
signal primul_operand  : std_logic_vector (7 downto 0):=(others => '0');
signal al_doilea_operand : std_logic_vector (7 downto 0):=(others => '0');
signal al_doilea_operand_in_C2 : std_logic_vector (7 downto 0):=(others => '0');
signal rez_sumator_propagare_succesiva : std_logic_vector (7 downto 0):=(others => '0');
signal rez_scazator_propagare_succesiva : std_logic_vector (7 downto 0):=(others => '0');
signal rez_sumator_anticipare_transport : std_logic_vector (7 downto 0):=(others => '0');
signal rez_scazator_anticipare_transport : std_logic_vector (7 downto 0):=(others => '0');
signal rez_sumator_bcd : std_logic_vector (7 downto 0):=(others => '0');
signal rez_scazator_bcd : std_logic_vector (7 downto 0):=(others => '0');
signal rez_increment : std_logic_vector (7 downto 0):=(others => '0');
signal rez_decrement : std_logic_vector (7 downto 0):=(others => '0');
signal rez_inmultire_matriceala : std_logic_vector (15 downto 0):=(others => '0');
signal rez_inmultire_booth : std_logic_vector (15 downto 0):=(others => '0');
signal rez_inmultire_shiftare_adunare : std_logic_vector (15 downto 0):=(others => '0');
signal rez_wallace : std_logic_vector (15 downto 0):=(others => '0');
signal IntrareX : std_logic_vector (15 downto 0):=(others => '0');
signal rez_div_cu_refacere_rest : std_logic_vector (15 downto 0):=(others => '0');
signal rez_div_fara_refacere_rest : std_logic_vector (15 downto 0):=(others => '0');
signal A : std_logic_vector (8 downto 0):=(others => '0');
signal Q : std_logic_vector (7 downto 0):=(others => '0');
signal A_div, Q_div : std_logic_vector (7 downto 0):=(others => '0');
signal A_div2, Q_div2 : std_logic_vector (7 downto 0):=(others => '0');
signal Data : std_logic_vector (31 downto 0):=(others => '0');
signal rez_and, rez_or, rez_xor, rez_not : std_logic_vector (7 downto 0):=(others => '0');
signal rez_nand, rez_nor, rez_nxor : std_logic_vector (7 downto 0):=(others => '0');
signal rez_sll, rez_srl : std_logic_vector (7 downto 0):=(others => '0');
signal rez_left_rol, rez_right_rol, rez_comp_eq : std_logic_vector (7 downto 0):=(others => '0');
signal Tin, Tin2, Tin3 : std_logic:='0';
signal StartQ : std_logic:='0';
begin
            
MPG1: entity WORK.debouncer port map(
            Clk=>Clk,
            Rst=>Rst,
            Din=>Start,
            Qout=>StartQ);
            
sumator_propagare_succesiva_transport: entity WORK.sumator_propagare_succesiva port map(
            X=>primul_operand,
            Y=>al_doilea_operand,
            Tin=>Tin,
            S=>rez_sumator_propagare_succesiva,
            Tout=>Tout1);
            
scazator_propagare_succesiva_transport: entity WORK.sumator_propagare_succesiva port map(
            X=>primul_operand,
            Y=>al_doilea_operand_in_C2,
            Tin=>Tin,
            S=>rez_scazator_propagare_succesiva,
            Tout=>Tout2);
            
sumator_cu_anticiparea_transportului: entity WORK.sumator_anticipare_transport port map(
            X=>primul_operand,
            Y=>al_doilea_operand,
            Tin=>Tin,
            S=>rez_sumator_anticipare_transport,
            Tout=>Tout3);
                        
scazator_cu_anticiparea_transportului: entity WORK.sumator_anticipare_transport port map(
            X=>primul_operand,
            Y=>al_doilea_operand_in_C2,
            Tin=>Tin,
            S=>rez_scazator_anticipare_transport,
            Tout=>Tout4);
            
sumator_bcd_2_cifre: entity WORK.sumator_bcd_2cifre port map(
            X=>primul_operand,
            Y=>al_doilea_operand,
            Tin=>Tin2,
            S=>rez_sumator_bcd,
            Tout=>Tout5);
                      
scazator_bcd_2_cifre: entity WORK.sumator_bcd_2cifre port map(
            X=>primul_operand,
            Y=>al_doilea_operand_in_C2,
            Tin=>Tin3,
            S=>rez_scazator_bcd,
            Tout=>Tout6);                      
                                                          
            
convertor_C2: entity WORK.unitate_conversie_in_C2 port map(
            Yin=>al_doilea_operand,
            Yout=>al_doilea_operand_in_C2);
            
produs_matriceal: entity WORK.inmultire_matriceala port map(
            X=>primul_operand,
            Y=>al_doilea_operand,
            P=>rez_inmultire_matriceala);
            
arbore_wallace: entity WORK.wallace8biti port map(
            X=>primul_operand,
            Y=>al_doilea_operand,
            P=>rez_wallace);            
            
produs_booth: entity WORK.inmultitor_booth generic map(n=>8) port map(
            Clk=>Clk,
            Rst=>Rst,
            Start=>StartQ,
            X=>primul_operand,
            Y=>al_doilea_operand,
            A=>rez_inmultire_booth(15 downto 8), 
            Q=>rez_inmultire_booth(7 downto 0), 
            Term=>Term1);
            
produs_shiftare_adunare: entity WORK.produs_shift_add port map(
            Clk=>Clk,
            Rst=>Rst,
            Start=>StartQ,
            X=>primul_operand,
            Y=>al_doilea_operand,
            A=>A,
            Q=>Q,
            Term=>Term2);

IntrareX<= x"00" & primul_operand;
            
div_cu_refacerea_restului: entity WORK.div_cu_refacere_rest generic map(n=>8) port map(
            Clk=>Clk,
            Rst=>Rst,
            Start=>StartQ,
            X=>IntrareX,
            Y=>al_doilea_operand,
            A=>A_div,
            Q=>Q_div,
            Term=>Term3);
            
rez_inmultire_shiftare_adunare(15 downto 8)<=A(7 downto 0);            
rez_inmultire_shiftare_adunare(7 downto 0)<=Q(7 downto 0);
rez_div_cu_refacere_rest(15 downto 8)<=A_div;
rez_div_cu_refacere_rest(7 downto 0)<=Q_div;
            
div_fara_refacerea_restului: entity WORK.div_fara_refacere_rest generic map(n=>8) port map(
            Clk=>Clk,
            Rst=>Rst,
            Start=>StartQ,
            X=>IntrareX,
            Y=>al_doilea_operand,
            A=>A_div2,
            Q=>Q_div2,
            Term=>Term4);
            
rez_div_fara_refacere_rest(15 downto 8)<=A_div2;             
rez_div_fara_refacere_rest(7 downto 0)<=Q_div2;
            
incrementare: entity WORK.increment port map(
            x=>primul_operand,
            y=>rez_increment);
            
decrementare: entity WORK.decrement port map(
            x=>primul_operand,
            y=>rez_decrement);
                        
--Operatii logice
            
and_operation: entity WORK.and_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_and);
            
or_operation: entity WORK.or_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_or);
            
xor_operation: entity WORK.xor_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_xor);
            
not_operation: entity WORK.not_op port map(
            x=>primul_operand,
            y=>rez_not);
            
nand_operation: entity WORK.nand_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_nand);
                        
nor_operation: entity WORK.nor_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_nor);
                        
nxor_operation: entity WORK.nxor_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>rez_nxor);
            
sll_operation: entity WORK.sll_op port map( 
            x=>primul_operand, 
            input=>ShiftBit,
            y=>rez_sll);

srl_operation: entity WORK.srl_op port map( 
            x=>primul_operand, 
            input=>ShiftBit,
            y=>rez_srl); 
            
left_rotate: entity WORK.left_rol_op port map(
            x=>primul_operand,
            y=>rez_left_rol);
            
comp_equal: entity WORK.comparator_op port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>Tout7);            
                                  
right_rotate: entity WORK.right_rol_op port map(
            x=>primul_operand,
            y=>rez_right_rol); 
            
parity: entity WORK.parity_detector port map(
            x=>primul_operand,
            output=>Tout8);
            
comp_gt: entity WORK.comparator_gt port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>Tout9);
                        
comp_ls: entity WORK.comparator_ls port map(
            x=>primul_operand,
            y=>al_doilea_operand,
            output=>Tout10);
            
zero_detect: entity WORK.zero_detector port map(
            x=>primul_operand,
            output=>Tout11);                                                
            
SSD: entity WORK.displ7seg port map(
            Clk=>Clk,
            Rst=>Rst,
            Data=>Data,
            An=>An,
            Seg=>Seg);

load_number: process(LoadNr, Selectie_Numar)
begin
    if rising_edge(LoadNr) then
        if Selectie_Numar='0' then
            primul_operand<=Operanzi;
        else
            al_doilea_operand<=Operanzi;
        end if;
    end if;            
end process;

afisare: process(SelOp,SelectieTipOp,primul_operand,al_doilea_operand,al_doilea_operand_in_C2,rez_sumator_propagare_succesiva,rez_scazator_propagare_succesiva,rez_sumator_anticipare_transport,rez_scazator_anticipare_transport,rez_inmultire_matriceala,rez_inmultire_booth,rez_inmultire_shiftare_adunare,rez_div_cu_refacere_rest,rez_div_fara_refacere_rest,rez_sumator_bcd,rez_scazator_bcd,rez_and,rez_or,rez_xor,rez_not,rez_nand,rez_nor,rez_nxor,rez_sll,rez_srl,rez_left_rol,rez_right_rol,rez_increment,rez_decrement,rez_wallace)
begin
if SelectieTipOp='0' then
    case SelOp is
        when "0000" => Data<=primul_operand & al_doilea_operand & rez_sumator_propagare_succesiva & x"00"; --adunare elementare
        when "0001" => Data<=primul_operand & al_doilea_operand_in_C2 & rez_scazator_propagare_succesiva & x"00"; --scadere elementare
        when "0010" => Data<=primul_operand & al_doilea_operand & rez_sumator_anticipare_transport & x"00"; --adunare cu anticiparea transportului pe grupe de 2 biti
        when "0011" => Data<=primul_operand & al_doilea_operand_in_C2 & rez_scazator_anticipare_transport & x"00"; --scadere cu anticiparea transportului pe grupe de 2 biti
        when "0100" => Data<=primul_operand & al_doilea_operand & rez_sumator_bcd & x"00"; -- sumator bcd pe 2 cifre
        when "0101" => Data<=primul_operand & al_doilea_operand_in_C2 & rez_scazator_bcd & x"00"; --scazator bcd pe 2 cifre
        when "0110" => Data<=primul_operand & al_doilea_operand & rez_inmultire_matriceala; --inmultire matriceala
        when "0111" => Data<=primul_operand & al_doilea_operand & rez_wallace; --inmultire prin arbore wallace
        when "1000" => Data<=primul_operand & al_doilea_operand & rez_inmultire_booth; --inmultire booth
        when "1001" => Data<=primul_operand & al_doilea_operand & rez_inmultire_shiftare_adunare; --inmultire shiftare si adunare
        when "1010" => Data<=primul_operand & al_doilea_operand & rez_div_cu_refacere_rest; --div cu refacerea restului partial
        when "1011" => Data<=primul_operand & al_doilea_operand & rez_div_fara_refacere_rest; --div fara refacerea restului partial
        when "1100" => Data<=primul_operand & rez_increment & x"0000"; --incrementare
        when "1101" => Data<=primul_operand & rez_decrement & x"0000"; --decrementare
        when others => Data<=x"00000000";
    end case;
else
    case SelOp is
        when "0000" => Data<=primul_operand & al_doilea_operand & rez_and & x"00"; --and
        when "0001" => Data<=primul_operand & al_doilea_operand & rez_or & x"00"; --or
        when "0010" => Data<=primul_operand & al_doilea_operand & rez_xor & x"00"; --xor
        when "0011" => Data<=primul_operand & rez_not & x"0000"; --not
        when "0100" => Data<=primul_operand & al_doilea_operand & rez_nand & x"00"; --nand
        when "0101" => Data<=primul_operand & al_doilea_operand & rez_nor & x"00"; --nor
        when "0110" => Data<=primul_operand & al_doilea_operand & rez_nxor & x"00"; --nxor
        when "0111" => Data<=primul_operand & rez_sll & x"0000"; --sll
        when "1000" => Data<=primul_operand & rez_srl & x"0000"; --srl
        when "1001" => Data<=primul_operand & rez_left_rol & x"0000"; --left rol
        when "1010" => Data<=primul_operand & rez_right_rol & x"0000"; --right rol
        when "1011" => Data<=primul_operand & al_doilea_operand & "0000000000000000"; --comparator equal
        when "1100" => Data<=primul_operand & al_doilea_operand & "0000000000000000"; -- parity detector
        when "1101" => Data<=primul_operand & al_doilea_operand & "0000000000000000"; -- comparator gt
        when "1110" => Data<=primul_operand & al_doilea_operand & "0000000000000000"; -- comparator ls
        when "1111" => Data<=primul_operand & al_doilea_operand & "0000000000000000"; -- zero_detector
        when others => Data<=x"00000000";
    end case; 
end if;       
end process;

end Behavioral;
