----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:51 03/20/2018 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
    Port ( clk : in  STD_LOGIC;
           reset_processor : in  STD_LOGIC);
end processor;

architecture Behavioral of processor is

component ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR(31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
			  dataFromRAM : in  STD_LOGIC_VECTOR(31 downto 0);
			  dataFromReg : in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR(2 downto 0);
			 -- ALU_preBin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR(31 downto 0);
			  Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component CONTROL is
    Port ( instruction_con : in  STD_LOGIC_VECTOR(5 downto 0);
           pc_sel_con : out  STD_LOGIC;
           pc_LdEn_con : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           RF_B_sel_con : out  STD_LOGIC;
           RF_Wr_Data_sel_con : out  STD_LOGIC;
			  RF_WrEn_con :out  STD_LOGIC;
           ALU_bin_sel_con : out  STD_LOGIC_VECTOR(2 downto 0);
			  ALU_function_in :in STD_LOGIC_VECTOR(5 downto 0);
           ALU_func_con : out  STD_LOGIC_VECTOR(3 downto 0);
           mem_Wr_En_con : out  STD_LOGIC;
			  ALU_ain_sel_con :out  STD_LOGIC_VECTOR(1 downto 0);
			  dataIn_sel_con :out  STD_LOGIC;
			  dataOut_sel_con :out  STD_LOGIC;
			  load_A_reg :out  STD_LOGIC;
			  load_B_reg: out  STD_LOGIC;
			  --ALU_preBin_sel : out STD_LOGIC;
			  mc_addr_ldEnC : out STD_LOGIC;
           mc_addr4C : out  STD_LOGIC;
			  ALUpreSel : out  STD_LOGIC;
			  ALUafterSel :out  STD_LOGIC;
			  Zero_con : in  STD_LOGIC;
			  reset :in  STD_LOGIC;
			  CONTROLenCounter :out  STD_LOGIC;
			  CONTROLselMuxCounter	:out  STD_LOGIC;
			  ControlSelGiaAddress:out  STD_LOGIC);
end component;

component DECSTAGE is
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

end component;



component IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
          -- Instr : out  STD_LOGIC_VECTOR(31 downto 0));
			  PC_out : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MEMSTAGE is
    Port ( --clk : in  STD_LOGIC;
           --Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR(31 downto 0);
          -- MEM_DataOut : out  STD_LOGIC_VECTOR(31 downto 0));
			  ALU_MEM_Addr_out : out  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataIn_out : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component RAM is
 port (
 clk : in std_logic;
 inst_addr : in std_logic_vector(10 downto 0);
 inst_dout : out std_logic_vector(31 downto 0);
 data_we : in std_logic;
 data_addr : in std_logic_vector(10 downto 0);
 data_din : in std_logic_vector(31 downto 0);
 data_dout : out std_logic_vector(31 downto 0));
 end component;

component mux2_to_1_proc is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           C : out  STD_LOGIC_VECTOR(31 downto 0);
           select_proc : in  STD_LOGIC);
end component;

component LSB_taker is
    Port ( in_LSB : in  STD_LOGIC_VECTOR(31 downto 0);
           out_LSB : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Register_32 is
    Port ( CLK : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  reset: in STD_LOGIC;
           WE : in  STD_LOGIC);
end component;

component addressCounter is
    Port ( inAddress : in  STD_LOGIC_VECTOR( 31 downto 0);
           outAddress : out  STD_LOGIC_VECTOR( 31 downto 0);
           mc_addr_ldEn : in  STD_LOGIC;
           mc_addr4 : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  clk : in  STD_LOGIC);
end component;

component MUX_2_to_1 is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0); --0
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);-- 1
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end component;

--component MUX_pre_ALU is             ---Ain sthn ALU
--    Port ( RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
--           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
--			  fromRegB: in  STD_LOGIC_VECTOR(31 downto 0);
--			  fromRamData: in  STD_LOGIC_VECTOR(31 downto 0);
--           ALU_Bin_sel : in  STD_LOGIC_VECTOR(1 downto 0);
--           MUX_pre_ALU_out : out  STD_LOGIC_VECTOR(31 downto 0));
--end component;

COMPONENT mux4to1
	PORT(
		in0 : IN std_logic_vector(31 downto 0);
		in1 : IN std_logic_vector(31 downto 0);
		in2 : IN std_logic_vector(31 downto 0);
		in3 : IN std_logic_vector(31 downto 0);
		sel4to1 : IN std_logic_vector(1 downto 0);          
		out_4_to_1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
--COMPONENT counterAdd1 is
--    Port ( outCounterAdd1 : out  STD_LOGIC_VECTOR(31 downto 0);
--           counterAddEn : in  STD_LOGIC);
--end COMPONENT;

signal temp_PC_out,temp_inst_dout,temp_mem_out,temp_data_din,temp_data_dout,temp_ALU_out,temp2_MEM_out,temp2_Immed,temp_RF_A: STD_LOGIC_VECTOR(31 downto 0);
signal temp_RF_B,temp_MUX_ALU_A,temp_MUX_ALU_B ,temp_MEM_DataIn_out,temp_out_LSB,temp_LSB: STD_LOGIC_VECTOR(31 downto 0);
signal temp_PC_sel,temp_PC_LdEn ,temp_data_we,temp_RF_WrEn,temp_RF_WrData_sel,temp_RF_B_sel,temp_Zero,ALU_preBin_sel_Control: STD_LOGIC;
signal temp_ALU_func :STD_LOGIC_VECTOR(3 downto 0);
signal temp_Cout,temp_Ovf,temp_dataDin_sel,temp_dataDout_sel,ALUout_A_LD,tempSelPreCounter,countLd,count4,selForIncMemAddr,ALUout_B_LD: STD_LOGIC;
signal outRegALU1 ,TEMPmuxPreAddrCounter,tempOutCounterProc,memStageIn,outRegBAfterALU,outRegALU2: STD_LOGIC_VECTOR(31 downto 0);
signal temp_ALU_Ain_sel : STD_LOGIC_VECTOR(1 downto 0);
signal temp_ALU_Bin_sel : STD_LOGIC_VECTOR(2 downto 0);
signal TEMPenCounter,TEMPselMuxCounter,sgAddr : STD_LOGIC;
begin


if_stage_proc : IFSTAGE Port Map(
								  PC_Immed =>temp2_Immed,
								  PC_sel =>temp_PC_sel,
								  PC_LdEn =>temp_PC_LdEn,
								  Reset => reset_processor,
								  Clk => clk,
								  PC_out =>temp_PC_out);
							

RAM_proc : RAM Port Map (clk => clk,
								 inst_addr =>temp_PC_out(12 downto 2),
								 inst_dout =>temp_inst_dout,
								 data_we =>temp_data_we,
								 data_addr =>temp_mem_out(12 downto 2),
								 data_din => temp_data_din,
								 data_dout =>temp_data_dout);
								 
dec_proc : DECSTAGE Port Map ( Instr =>temp_inst_dout,
									    RF_WrEn =>temp_RF_WrEn,
									    ALU_out =>outRegALU1,
									    MEM_out =>temp2_MEM_out,--exodos tou poluplekth
								       RF_WrData_sel => temp_RF_WrData_sel,
								  	    RF_B_sel => temp_RF_B_sel,
									    Clk =>clk,
										 Reset => reset_processor,
									    Immed =>temp2_Immed,
									    RF_A => temp_RF_A,
									    RF_B => temp_RF_B,
										 enCounter => TEMPenCounter,
										 selMuxCounter	=>	TEMPselMuxCounter,
										 selGiaAddress => sgAddr);						 

ALU_proc : ALUSTAGE Port Map( RF_A =>temp_MUX_ALU_A,
									   RF_B =>temp_RF_B,
									   Immed => temp2_Immed,
										dataFromRAM => temp_data_dout,
										dataFromReg => outRegALU2,
									   ALU_Bin_sel =>temp_ALU_Bin_sel,
										--ALU_preBin_sel => ALU_preBin_sel_Control,
									   ALU_func =>temp_ALU_func,
									   ALU_out =>temp_ALU_out,
									   Zero =>temp_Zero,
									   Cout =>temp_Cout,
									   Ovf =>temp_Ovf);
										
regAfterALU1 : Register_32  Port map( CLK => clk,---------------register a
												  Data => temp_ALU_out,
												  Dout => outRegALU1,
												  reset=> reset_processor,
												  WE => ALUout_A_LD);									
										
regAfterALU2  : Register_32  Port map( CLK => clk,---------------- register b
													Data => temp_ALU_out,
													Dout => outRegALU2,
													reset=> reset_processor,
													WE => ALUout_B_LD);


MEM_proc : MEMSTAGE Port Map (ALU_MEM_Addr =>memStageIn,--!!!!!!!!!!!!!!!!!!!!!!!!!!*****************
									   MEM_DataIn =>temp_RF_B,
									   ALU_MEM_Addr_out =>temp_mem_out,
									   MEM_DataIn_out =>temp_MEM_DataIn_out);

 
LSB_taker_proc_A : LSB_taker Port Map( in_LSB =>temp_MEM_DataIn_out,
													out_LSB =>temp_out_LSB);
													
													
MUX_Data_in :	mux2_to_1_proc Port Map( A =>temp_MEM_DataIn_out,
											 	    B =>temp_out_LSB,
												    C =>temp_data_din,
												    select_proc =>temp_dataDin_sel);
													 
LSB_taker_proc_B : LSB_taker Port Map( in_LSB =>temp_data_dout,
													out_LSB =>temp_LSB);
													
MUX_Data_out :	mux2_to_1_proc Port Map( A =>temp_data_dout,
											 	    B =>temp_LSB,
												    C =>temp2_MEM_out,
												    select_proc =>temp_dataDout_sel);													


-----------o mux o A prin thn ALU
--MUX_pre_ALU_proc : MUX_pre_ALU  Port map (  RF_B  => temp_RF_A,  --out1
--														  Immed =>"00000000000000000000000000000000", --mhdenika
--														  fromRegB => outRegALU1, --tha tp valoume out sto regA
--														  fromRamData => temp_RF_B, --out2 decSTAGE
--														  ALU_Bin_sel => temp_ALU_Ain_sel,
--														  MUX_pre_ALU_out =>temp_MUX_ALU_A);
														  
Inst_mux4to1: mux4to1 PORT MAP(
		in0 => temp_RF_A,
		in1 => "00000000000000000000000000000000",
		in2 => outRegALU1 ,
		in3 => temp_RF_B,
		sel4to1 => temp_ALU_Ain_sel ,
		out_4_to_1 => temp_MUX_ALU_A
	);														  
			  
			  
--MUX_pre_ALU_procMUXB :mux2_to_1_proc Port Map(  A =>temp_RF_B,
--																B =>"00000000000000000000000000000000",
--																C =>temp_MUX_ALU_B,
--																select_proc =>temp_ALU_Bin_sel);

control_proc :	CONTROL Port Map( instruction_con =>temp_inst_dout(31 downto 26),
										   pc_sel_con=>temp_PC_sel, 
										   pc_LdEn_con =>temp_PC_LdEn,
										   clk =>clk,
										   RF_B_sel_con =>temp_RF_B_sel,
										   RF_Wr_Data_sel_con =>temp_RF_WrData_sel,
									 	   RF_WrEn_con =>temp_RF_WrEn,
										   ALU_bin_sel_con =>temp_ALU_Bin_sel,
										   ALU_function_in =>temp_inst_dout(5 downto 0),
										   ALU_func_con =>temp_ALU_func,
										   mem_Wr_En_con =>temp_data_we,
										   ALU_ain_sel_con =>temp_ALU_Ain_sel,
										   dataIn_sel_con =>temp_dataDin_sel,
										   dataOut_sel_con =>temp_dataDout_sel,
											load_A_reg => ALUout_A_LD,
											load_B_reg => ALUout_B_LD,
											mc_addr_ldEnC => countLd,
											mc_addr4C => count4,
											ALUpreSel => tempSelPreCounter,
											ALUafterSel => selForIncMemAddr,
										   Zero_con =>temp_Zero,
										   reset =>	reset_processor,
											CONTROLenCounter => TEMPenCounter,
											CONTROLselMuxCounter	=>	TEMPselMuxCounter,		
											ControlSelGiaAddress =>sgAddr);
muxPreAddrCounter: MUX_2_to_1 Port map ( input1=> temp_RF_A,  --0
													  input2=> outRegALU1, -- 1
													  sel=> tempSelPreCounter, --tha to baloume sto cntrol
													  output=> TEMPmuxPreAddrCounter);

addrCounter: addressCounter  Port map(  inAddress => TEMPmuxPreAddrCounter,
													  outAddress => tempOutCounterProc,
													  mc_addr_ldEn => countLd,  --tha to baloume sto cntrol
													  mc_addr4 => count4, --tha to baloume sto cntrol
													  reset => reset_processor,
													  clk =>	clk);		

muxAfterAddrCounter: MUX_2_to_1 Port map(   input1 =>outRegALU1 ,--0
														  input2=> tempOutCounterProc,-- 1
														  sel => selForIncMemAddr,
														  output	=>	memStageIn);				

--inst_CounterAdd1: 	counterAdd1  port map(
--														   outCounterAdd1 => outAdd1,
--															counterAddEn 	=>	enAdd1);				
--															
--inst_muxAdd1 :  MUX_2_to_1 Port map ( input1 => temp_inst_dout(20 downto 16),--0
--												  input2 => outAdd1, -- 1
--												  sel => selMuxAdd1, 
--												  output =>	outMuxAdd1);												 
									  
end Behavioral;

