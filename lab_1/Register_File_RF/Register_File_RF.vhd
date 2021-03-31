----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:34 02/28/2018 
-- Design Name: 
-- Module Name:    Register_File_RF - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File_RF is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end Register_File_RF;

architecture Behavioral of Register_File_RF is



component Decoder_5_to_32 is
    Port ( DecIn : in  STD_LOGIC_VECTOR(4 downto 0);
           DecOut : out  STD_LOGIC_VECTOR(31 downto 0));
end component;



component Register_32 is
    Port ( CLK : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC);
end component;

component MUX_32_to_1 is
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
end component;

component Compare_Module is
    Port ( CMin1 : in  STD_LOGIC_VECTOR(4 downto 0);
           CMin2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  WE : in  STD_LOGIC;
           CMout : out  STD_LOGIC);
end component;

component MUX_2_to_1 is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;



signal decoderout,outR1,outRO,OMUX1,OMUX2:STD_LOGIC_VECTOR (31 downto 0);
signal check1,check2 : STD_LOGIC;
signal h : STD_LOGIC_VECTOR(30 downto 0);
type regArray is array (30 downto 0) of STD_LOGIC_VECTOR(31 downto 0);

signal rArray : regArray ;
begin

DEC : Decoder_5_to_32 Port map( DecIn =>Awr,
										  DecOut =>decoderout);

REG_generate :

for i in 30 downto 0 generate
	h(i)<= (WrEn AND decoderout(i));
	
		REGI: Register_32  Port Map( CLK => Clk,
											  Data => Din,
											  Dout => rArray(i),
											  WE => h(i));									  
											  
end generate REG_generate;



REG: Register_32  Port Map( CLK => Clk,
									  Data => "00000000000000000000000000000000",
									  Dout => outRO,
									  WE => '0');
									  


Com1:  Compare_Module Port Map( CMin1 =>Awr,
										  CMin2 =>Ard1,
										  WE =>WrEn,
										  CMout =>check1);
								
								  
Com2:  Compare_Module Port Map( CMin1 =>Awr,
										  CMin2 =>Ard2,
										  WE =>WrEn,
										  CMout =>check2);	


										  
		MUX_BIG1: MUX_32_to_1 Port Map( in0  => outRO,
										  in1  => rArray(0),
										  in2  => rArray(1),
										  in3  => rArray(2),
										  in4  => rArray(3),
										  in5  => rArray(4),
										  in6  => rArray(5),
										  in7  => rArray(6),
										  in8  => rArray(7),
										  in9  => rArray(8),
										  in10 => rArray(9),
										  in11 => rArray(10),
										  in12 => rArray(11),
										  in13 => rArray(12),
										  in14 => rArray(13),
										  in15 => rArray(14),
										  in16 => rArray(15),
										  in17 => rArray(16),
										  in18 => rArray(17),
										  in19 => rArray(18),
										  in20 => rArray(19),
										  in21 => rArray(20),
										  in22 => rArray(21),
										  in23 => rArray(22),
										  in24 => rArray(23),
										  in25 => rArray(24),
										  in26 => rArray(25),
										  in27 => rArray(26),
										  in28 => rArray(27),
										  in29 => rArray(28),
										  in30 => rArray(29),
										  in31 => rArray(30),
										  selector =>Ard1,
										  outMux1 =>OMUX1);


MUX_BIG2: MUX_32_to_1 Port Map( in0  => outRO,
										  in1  => rArray(0),
										  in2  => rArray(1),
										  in3  => rArray(2),
										  in4  => rArray(3),
										  in5  => rArray(4),
										  in6  => rArray(5),
										  in7  => rArray(6),
										  in8  => rArray(7),
										  in9  => rArray(8),
										  in10 => rArray(9),
										  in11 => rArray(10),
										  in12 => rArray(11),
										  in13 => rArray(12),
										  in14 => rArray(13),
										  in15 => rArray(14),
										  in16 => rArray(15),
										  in17 => rArray(16),
										  in18 => rArray(17),
										  in19 => rArray(18),
										  in20 => rArray(19),
										  in21 => rArray(20),
										  in22 => rArray(21),
										  in23 => rArray(22),
										  in24 => rArray(23),
										  in25 => rArray(24),
										  in26 => rArray(25),
										  in27 => rArray(26),
										  in28 => rArray(27),
										  in29 => rArray(28),
										  in30 => rArray(29),
										  in31 => rArray(30),
										  selector =>Ard2,
										  outMux1 =>OMUX2);
										  
										  
Small_MUX1: MUX_2_to_1 Port Map(input1 =>OMUX1,
										  input2 =>Din,
										  sel =>check1,
										  output =>Dout1);

Small_MUX2: MUX_2_to_1 Port Map(input1 =>OMUX2,
										  input2 =>Din,
										  sel =>check2,
										  output =>Dout2);
										  
										  
end Behavioral;

