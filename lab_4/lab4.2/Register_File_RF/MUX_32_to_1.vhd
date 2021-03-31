----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:56 02/28/2018 
-- Design Name: 
-- Module Name:    MUX_32_to_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_32_to_1 is
    Port ( in0  : in  STD_LOGIC_VECTOR (31 downto 0);
           in1  : in  STD_LOGIC_VECTOR (31 downto 0);
           in2  : in  STD_LOGIC_VECTOR (31 downto 0);
           in3  : in  STD_LOGIC_VECTOR (31 downto 0);
           in4  : in  STD_LOGIC_VECTOR (31 downto 0);
           in5  : in  STD_LOGIC_VECTOR (31 downto 0);
           in6  : in  STD_LOGIC_VECTOR (31 downto 0);
           in7  : in  STD_LOGIC_VECTOR (31 downto 0);
           in8  : in  STD_LOGIC_VECTOR (31 downto 0);
           in9  : in  STD_LOGIC_VECTOR (31 downto 0);
           in10 : in  STD_LOGIC_VECTOR (31 downto 0);
           in11 : in  STD_LOGIC_VECTOR (31 downto 0);
           in12 : in  STD_LOGIC_VECTOR (31 downto 0);
           in13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  in14 : in  STD_LOGIC_VECTOR (31 downto 0);
           in15 : in  STD_LOGIC_VECTOR (31 downto 0);
           in16 : in  STD_LOGIC_VECTOR (31 downto 0);
           in17 : in  STD_LOGIC_VECTOR (31 downto 0);
           in18 : in  STD_LOGIC_VECTOR (31 downto 0);
           in19 : in  STD_LOGIC_VECTOR (31 downto 0);
           in20 : in  STD_LOGIC_VECTOR (31 downto 0);
           in21 : in  STD_LOGIC_VECTOR (31 downto 0);
           in22 : in  STD_LOGIC_VECTOR (31 downto 0);
           in23 : in  STD_LOGIC_VECTOR (31 downto 0);
           in24 : in  STD_LOGIC_VECTOR (31 downto 0);
           in25 : in  STD_LOGIC_VECTOR (31 downto 0);
           in26 : in  STD_LOGIC_VECTOR (31 downto 0);
           in27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  in28 : in  STD_LOGIC_VECTOR (31 downto 0);
           in29 : in  STD_LOGIC_VECTOR (31 downto 0);
           in30 : in  STD_LOGIC_VECTOR (31 downto 0);
           in31 : in  STD_LOGIC_VECTOR (31 downto 0);
			  selector : in  STD_LOGIC_VECTOR (4 downto 0);
           outMux1 : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_32_to_1;

architecture Behavioral of MUX_32_to_1 is

begin

process (selector,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31)
begin
   case selector is
				when "00001" => outMux1 <= in1;
            when "00010" => outMux1 <= in2;
            when "00011" => outMux1 <= in3;
            when "00100" => outMux1 <= in4;
            when "00101" => outMux1 <= in5;
            when "00110" => outMux1 <= in6;
            when "00111" => outMux1 <= in7;	
				when "01000" => outMux1 <= in8;
            when "01001" => outMux1 <= in9;
            when "01010" => outMux1 <= in10;
            when "01011" => outMux1 <= in11;
            when "01100" => outMux1 <= in12;
            when "01101" => outMux1 <= in13;
            when "01110" => outMux1 <= in14;
            when "01111" => outMux1 <= in15;
				when "10000" => outMux1 <= in16;
            when "10001" => outMux1 <= in17;
            when "10010" => outMux1 <= in18;
            when "10011" => outMux1 <= in19;
            when "10100" => outMux1 <= in20;
            when "10101" => outMux1 <= in21;
            when "10110" => outMux1 <= in22;
            when "10111" => outMux1 <= in23;	
				when "11000" => outMux1 <= in24;
            when "11001" => outMux1 <= in25;
            when "11010" => outMux1 <= in26;
            when "11011" => outMux1 <= in27;
            when "11100" => outMux1 <= in28;
            when "11101" => outMux1 <= in29;
            when "11110" => outMux1 <= in30;
            when "11111" => outMux1 <= in31;
				when others  => outMux1 <= in0;
   end case;
end process;

	
end Behavioral;

