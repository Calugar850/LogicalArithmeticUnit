----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2021 19:02:58
-- Design Name: 
-- Module Name: wallace8biti - Behavioral
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

entity wallace8biti is
  Port (X : in std_logic_vector (7 downto 0);
        Y : in std_logic_vector (7 downto 0);
        P : out std_logic_vector (15 downto 0));
end wallace8biti;

architecture Behavioral of wallace8biti is

component sumator_produs is
  Port (X: in std_logic;
        Y: in std_logic;
        Tin: in std_logic;
        S: out std_logic;
        Tout: out std_logic);
end component;

component semisumator is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Tout : out  STD_LOGIC);
end component;

signal k01,k02,k03,k04,k05,k06,k07,k08,k09,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44,k45,k46,k47,k48,k49,k50,k51,k52,k53,k54,k55,k56,k57,k58,k59,k60,k61,k62,k63,k64,k65,k66,k67,k68:std_logic;
signal c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,c61,c62,c63,c64,c65,c66,c67,c68:std_logic;
signal P0, P1, P2, P3, P4, P5, P6, P7 : std_logic_vector(7 downto 0):="00000000";
begin

process(X,Y)
begin
  for i in 0 to 7 loop
        P0(i) <= X(i) and Y(0);
        P1(i) <= X(i) and Y(1);
        P2(i) <= X(i) and Y(2);
        P3(i) <= X(i) and Y(3);
        P4(i) <= X(i) and Y(4);
        P5(i) <= X(i) and Y(5);
        P6(i) <= X(i) and Y(6);
        P7(i) <= X(i) and Y(7);
  end loop;    
end process;

--stage zero

ha00: semisumator port map(x=>P0(1),y=>P1(0),S=>k01,Tout=>c01);
fa00: sumator_produs port map(x=>P2(0),y=>P0(2),Tin=>P1(1),S=>k02,Tout=>c02);
fa01: sumator_produs port map(x=>P3(0),y=>P2(1),Tin=>P1(2),S=>k03,Tout=>c03);
fa02: sumator_produs port map(x=>P4(0),y=>P3(1),Tin=>P2(2),S=>k04,Tout=>c04);
ha01: semisumator port map(x=>P1(3),y=>P0(4),S=>k05,Tout=>c05);
fa03: sumator_produs port map(x=>P5(0),y=>P4(1),Tin=>P3(2),S=>k06,Tout=>c06);
fa04: sumator_produs port map(x=>P2(3),y=>P1(4),Tin=>P0(5),S=>k07,Tout=>c07);
fa05: sumator_produs port map(x=>P6(0),y=>P5(1),Tin=>P4(2),S=>k08,Tout=>c08);
fa06: sumator_produs port map(x=>P3(3),y=>P2(4),Tin=>P1(5),S=>k09,Tout=>c09);
fa07: sumator_produs port map(x=>P7(0),y=>P6(1),Tin=>P5(2),S=>k10,Tout=>c10);
fa08: sumator_produs port map(x=>P4(3),y=>P3(4),Tin=>P2(5),S=>k11,Tout=>c11);
ha02: semisumator port map(x=>P1(6),y=>P0(7),S=>k12,Tout=>c12);
fa09: sumator_produs port map(x=>P7(1),y=>P6(2),Tin=>P5(3),S=>k13,Tout=>c13);
fa90: sumator_produs port map(x=>P4(4),y=>P3(5),Tin=>P2(6),S=>k14,Tout=>c14);
fa31: sumator_produs port map(x=>P7(2),y=>P6(3),Tin=>P5(4),S=>k15,Tout=>c15);
fa32: sumator_produs port map(x=>P4(5),y=>P3(6),Tin=>P2(7),S=>k16,Tout=>c16);
fa33: sumator_produs port map(x=>P7(3),y=>P6(4),Tin=>P5(5),S=>k17,Tout=>c17);
ha03: semisumator port map(x=>P4(6),y=>P3(7),S=>k18,Tout=>c18);
fa34: sumator_produs port map(x=>P7(4),y=>P6(5),Tin=>P5(6),S=>k19,Tout=>c19);
fa35: sumator_produs port map(x=>P7(5),y=>P6(6),Tin=>P5(7),S=>k20,Tout=>c20);
ha04: semisumator port map(x=>P7(6),y=>P6(7),S=>k21,Tout=>c21);

--stage one
ha10: semisumator port map(x=>k02,y=>c01,S=>k22,Tout=>c22);
fa10: sumator_produs port map(x=>P0(3),y=>c02,Tin=>k03,S=>k23,Tout=>c23);
fa11: sumator_produs port map(x=>k04,y=>k05,Tin=>c03,S=>k24,Tout=>c24);
fa12: sumator_produs port map(x=>k06,y=>k07,Tin=>c04,S=>k25,Tout=>c25);
fa13: sumator_produs port map(x=>k08,y=>k09,Tin=>P0(6),S=>k26,Tout=>c26);
ha11: semisumator port map(x=>c06,y=>c07,S=>k27,Tout=>c27);
fa14: sumator_produs port map(x=>k10,y=>k11,Tin=>k12,S=>k28,Tout=>c28);
ha12: semisumator port map(x=>c08,y=>c09,S=>k29,Tout=>c29);
fa15: sumator_produs port map(x=>k13,y=>k14,Tin=>P1(7),S=>k30,Tout=>c30);
fa16: sumator_produs port map(x=>c10,y=>c11,Tin=>c12,S=>k31,Tout=>c31);
fa17: sumator_produs port map(x=>k15,y=>k16,Tin=>c13,S=>k32,Tout=>c32);
fa18: sumator_produs port map(x=>k17,y=>k18,Tin=>c15,S=>k33,Tout=>c33);
fa19: sumator_produs port map(x=>k19,y=>c17,Tin=>c18,S=>k34,Tout=>c34);
ha13: semisumator port map(x=>k20,y=>c19,S=>k35,Tout=>c35);
ha14: semisumator port map(x=>k21,y=>c20,S=>k36,Tout=>c36);

--stage two
ha40: semisumator port map(x=>k23,y=>c22,S=>k37,Tout=>c37);
ha41: semisumator port map(x=>c23,y=>k24,S=>k38,Tout=>c38);
fa40: sumator_produs port map(x=>c24,y=>k25,Tin=>c05,S=>k39,Tout=>c39);
fa41: sumator_produs port map(x=>c25,y=>k26,Tin=>k27,S=>k40,Tout=>c40);
fa42: sumator_produs port map(x=>c26,y=>c27,Tin=>k28,S=>k41,Tout=>c41);
fa43: sumator_produs port map(x=>c28,y=>c29,Tin=>k30,S=>k42,Tout=>c42);
fa44: sumator_produs port map(x=>c30,y=>c31,Tin=>k32,S=>k43,Tout=>c43);
fa45: sumator_produs port map(x=>c32,y=>c16,Tin=>k33,S=>k44,Tout=>c44);
fa46: sumator_produs port map(x=>c33,y=>P4(7),Tin=>k34,S=>k45,Tout=>c45);
ha42: semisumator port map(x=>k35,y=>c34,S=>k46,Tout=>c46);
ha43: semisumator port map(x=>c35,y=>k36,S=>k47,Tout=>c47);
fa47: sumator_produs port map(x=>P7(7),y=>c21,Tin=>c36,S=>k48,Tout=>c48);

--stage three
ha50: semisumator port map(x=>c37,y=>k38,S=>k49,Tout=>c49);
fa50: sumator_produs port map(x=>k39,y=>c38,Tin=>c49,S=>k50,Tout=>c50);
fa51: sumator_produs port map(x=>k40,y=>c39,Tin=>c50,S=>k51,Tout=>c51);
fa52: sumator_produs port map(x=>c40,y=>k41,Tin=>k29,S=>k52,Tout=>c52);
fa53: sumator_produs port map(x=>c41,y=>k31,Tin=>k42,S=>k53,Tout=>c53);
fa54: sumator_produs port map(x=>c14,y=>c42,Tin=>k43,S=>k54,Tout=>c54);
fa55: sumator_produs port map(x=>k44,y=>c43,Tin=>c54,S=>k55,Tout=>c55);
fa56: sumator_produs port map(x=>c44,y=>k45,Tin=>c55,S=>k56,Tout=>c56);
fa57: sumator_produs port map(x=>k46,y=>c45,Tin=>c56,S=>k57,Tout=>c57);
fa58: sumator_produs port map(x=>c46,y=>k47,Tin=>c57,S=>k58,Tout=>c58);
fa59: sumator_produs port map(x=>k48,y=>c47,Tin=>c58,S=>k59,Tout=>c59);

--stage four
ha70: semisumator port map(x=>c51,y=>k52,S=>k60,Tout=>c60);
fa70: sumator_produs port map(x=>c52,y=>k53,Tin=>c60,S=>k61,Tout=>c61);
fa71: sumator_produs port map(x=>c53,y=>k54,Tin=>c61,S=>k62,Tout=>c62);
ha71: semisumator port map(x=>k55,y=>c62,S=>k63,Tout=>c63);
ha72: semisumator port map(x=>k56,y=>c63,S=>k64,Tout=>c64);
ha73: semisumator port map(x=>k57,y=>c64,S=>k65,Tout=>c65);
ha74: semisumator port map(x=>k58,y=>c65,S=>k66,Tout=>c66);
ha75: semisumator port map(x=>k59,y=>c66,S=>k67,Tout=>c67);
fa81: sumator_produs port map(x=>c48,y=>c59,Tin=>c67,S=>k68,Tout=>c68);


P(0) <= P0(0);
P(1) <= k01;
P(2) <= k22;
P(3) <= k37;
P(4) <= k49;
P(5) <= k50;
P(6) <= k51;
P(7) <= k60;
P(8) <= k61;
P(9) <= k62;
P(10) <= k63;
P(11) <= k64;
P(12) <= k65;
P(13) <= k66;
P(14) <= k67;
P(15) <= k68 or c68;

end Behavioral;
