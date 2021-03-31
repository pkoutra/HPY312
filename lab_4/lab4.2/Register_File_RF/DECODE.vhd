----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:46 03/08/2018 
-- Design Name: 
-- Module Name:    DECODE - Behavioral 
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

entity DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR(31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR(31 downto 0);
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR(31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR(31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR(31 downto 0);
			  enCounter : in  STD_LOGIC;
			  selMuxCounter : in  STD_LOGIC;
			  selGiaAddress : in  STD_LOGIC);
end DECSTAGE;

architecture Behavioral of DECSTAGE is

component Immed_Converter is
    Port ( InstrImmed : in  STD_LOGIC_VECTOR(15 downto 0);
			  InstrOp : in STD_LOGIC_VECTOR(5 downto 0);
           OutImmed : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MUX_RF_Instr is
    Port ( inMuxRF1 : in  STD_LOGIC_VECTOR(4 downto 0);
           inMuxRF2 : in  STD_LOGIC_VECTOR(4 downto 0);
           select2 : in  STD_LOGIC;
           outMuxRF : out  STD_LOGIC_VECTOR(4 downto 0));
end component;

component MUX_reg_file is
    Port ( inMuxRegFile1 : in  STD_LOGIC_VECTOR(31 downto 0);
           inMuxRegFile2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  selectorMuxRegFile : in STD_LOGIC;
           outMuxRegFile : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Register_File_RF is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
			  R :in STD_LOGIC;
           Clk : in  STD_LOGIC);
end component;

COMPONENT counterAdd1 is
    Port ( Clock : in  STD_LOGIC;
			  outCounterAdd1 : out  STD_LOGIC_VECTOR(4 downto 0);
           counterAddEn : in  STD_LOGIC);
end COMPONENT;


signal temp_MUX2 : STD_LOGIC_VECTOR(31 downto 0);
signal temp_MUX1,outMuxAdd1,outAdd1,outMuxGiaAddress : STD_LOGIC_VECTOR(4 downto 0);

begin

Extender : Immed_Converter Port Map( InstrImmed =>Instr(15 downto 0),
												 InstrOp =>Instr(31 downto 26),												
												 OutImmed =>Immed);
										
MUX_read : MUX_RF_Instr Port Map(inMuxRF1 =>Instr(15 downto 11),
											inMuxRF2 =>Instr(20 downto 16),
											select2 =>RF_B_sel,
											outMuxRF =>temp_MUX1);
											
MuxGiaAddress : MUX_RF_Instr Port Map(	inMuxRF1 =>temp_MUX1,
													inMuxRF2 =>outAdd1,
													select2 => selGiaAddress,
													outMuxRF =>outMuxGiaAddress);
											
MUX_data : MUX_reg_file Port Map(inMuxRegFile1 => ALU_out,
											inMuxRegFile2 => MEM_out,
											selectorMuxRegFile =>RF_WrData_sel,
											outMuxRegFile =>temp_MUX2);											

RF : Register_File_RF Port Map( Ard1 =>Instr(25 downto 21),
										  Ard2 => outMuxGiaAddress, 
										  Awr => outMuxAdd1,
										--  Awr =>Instr(20 downto 16),
										  Dout1 =>RF_A,
										  Dout2 => RF_B,											  
										  Din =>temp_MUX2,
										  WrEn =>RF_WrEn,
										  R => Reset,
										  Clk =>Clk);
										  
inst_CounterAdd1: 	counterAdd1  port map(  Clock => Clk ,
														   outCounterAdd1 => outAdd1,
															counterAddEn 	=>	enCounter);				
															
													
inst_muxAdd1 : MUX_RF_Instr   Port map(  inMuxRF1  => Instr(20 downto 16),--0
													  inMuxRF2 => outAdd1, -- 1,
													  select2 =>selMuxCounter, 
													  outMuxRF =>	outMuxAdd1);
end Behavioral;

