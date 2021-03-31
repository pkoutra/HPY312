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
           ALU_Bin_sel : in  STD_LOGIC;
			  ALU_Ain_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR(3 downto 0);
			  resFromALU : in  STD_LOGIC_VECTOR(31 downto 0);
			 reALUwb : in  STD_LOGIC_VECTOR(31 downto 0);--
  			  FWBsel : in STD_LOGIC_VECTOR(1 downto 0);
			  FWAsel : in STD_LOGIC_VECTOR(1 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR(31 downto 0);
			  Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component STALL_MODULE is
    Port ( opcode_DEC_EX : in  STD_LOGIC_VECTOR(5 downto 0);
           rt_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rs_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rd_EX_MEM : in  STD_LOGIC_VECTOR(4 downto 0);
           out_WE_stall : out  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC);
end component;

component PIPELINE_SMALL_REG is
    Port ( dataIn : in  STD_LOGIC_VECTOR(68 downto 0);
           dataOut : out  STD_LOGIC_VECTOR(68 downto 0);
           clk : in  STD_LOGIC;
			  WrEn :in  STD_LOGIC;
			  reset :in  STD_LOGIC);
end component;

component PipelineRegister is
    Port ( inRegister : in  STD_LOGIC_VECTOR(133 downto 0);
           outRegister : out  STD_LOGIC_VECTOR(133 downto 0);
           clk : in  STD_LOGIC;
			  WE : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;



component DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR(31 downto 0);
	 		  rd_wb :  in  STD_LOGIC_VECTOR(4 downto 0);
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
			  pc_sel_d : out STD_LOGIC;
			  PC_LdEn_d : out STD_LOGIC;
			  data_we_d : out STD_LOGIC;
			  rf_wr_en_d : out STD_LOGIC;
			  rf_wr_data_sel_d : out STD_LOGIC;
			  rf_b_sel_d : out STD_LOGIC;
			  we_dec_ex_d : out STD_LOGIC;
			  alu_bin_sel_d : out STD_LOGIC;
			  alu_ain_sel_d : out STD_LOGIC;
			  alu_func_d : out STD_LOGIC_VECTOR(3 downto 0);
			  we_ex_mem_d : out STD_LOGIC;
			  select_for_in_d : out STD_LOGIC;
			  select_for_out_d : out STD_LOGIC;
			  we_mem_wb_d : out STD_LOGIC
			  );
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
    Port ( 
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
           select_for_in :in  STD_LOGIC;
			  select_for_out :in  STD_LOGIC;
			  InLSBTaker: in  STD_LOGIC_VECTOR(31 downto 0);--eisodos tou NEOU lsb kater
			  dataInForRAMout :out STD_LOGIC_VECTOR(31 downto 0);--exodos tou panw
           OutLSBTaker : in  STD_LOGIC_VECTOR(31 downto 0);-- eisoodos tou 2ou lsb taker
			  dataOutToRF :out  STD_LOGIC_VECTOR(31 downto 0);--exodos tou panw
			  ALU_MEM_Addr_out : out  STD_LOGIC_VECTOR(31 downto 0));
           
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
 
 component FORWARD_UNIT is
    Port ( opcode_DEC_EX : in  STD_LOGIC_VECTOR(5 downto 0);
           rs_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rt_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rf_re_EX_MEM : in  STD_LOGIC;
           rd_EX_MEM : in  STD_LOGIC_VECTOR(4 downto 0);
           rf_re_MEM_WB : in  STD_LOGIC;
           rd_MEM_WB : in  STD_LOGIC_VECTOR(4 downto 0);
           FWA : out  STD_LOGIC_VECTOR(1 downto 0);
           FWB : out  STD_LOGIC_VECTOR(1 downto 0));
end component;



signal temp_PC_out ,temp_inst_dout,temp_data_dout,temp_mem_out,temp_data_din,temp_outA,temp_outB,temp_Immed,
temp_RF_A,temp_RF_B,temp_Immed_dec_ex,temp_dataInForRAMout,temp_dataOutToRF,temp_ALU_out,
temp_Address,temp_out2,temp_immed_after_ALU,temp_Address_FOR_RAM,exodos:STD_LOGIC_VECTOR(31 downto 0);

signal temp_rd ,temp_rd2,temp_rd2_m,temp_rs_d,temp_rt_d,temp_rs_a,temp_rt_a,temp_rs_m,temp_rt_m:STD_LOGIC_VECTOR(4 downto 0);

signal dec_ex_en ,temp_Ovf,temp_Cout,temp_Zero,dec_ex_en2,temp_select_for_in,temp_select_for_out,
temp_pc_sel_d,temp_PC_LdEn_d,temp_data_we_d,temp_rf_wr_en_d,temp_rf_wr_data_sel_d,temp_rf_b_sel_d,temp_we_dec_ex_d,
temp_alu_bin_sel_d,temp_alu_ain_sel_d,temp_we_ex_mem_d,temp_select_for_in_d,temp_select_for_out_d,
out_temp_pc_sel_d,out_temp_PC_LdEn_d,out_temp_data_we_d,out_temp_rf_wr_en_d,out_temp_rf_wr_data_sel_d,out_temp_rf_b_sel_d,out_temp_we_dec_ex_d,
out_temp_alu_bin_sel_d,out_temp_alu_ain_sel_d,out_temp_we_ex_mem_d,out_temp_select_for_in_d,out_temp_select_for_out_d,

out_temp_pc_sel_a,out_temp_PC_LdEn_a,out_temp_data_we_a,out_temp_rf_wr_en_a,out_temp_rf_wr_data_sel_a,out_temp_rf_b_sel_a,out_temp_we_dec_ex_a,
out_temp_alu_bin_sel_a,out_temp_alu_ain_sel_a,out_temp_we_ex_mem_a,out_temp_select_for_in_a,out_temp_select_for_out_a,mem_wb_en,temp_we_mem_wb_d,
out_temp_we_mem_wb_d,out_temp_we_mem_wb_a,

out_temp_pc_sel_m,out_temp_PC_LdEn_m,out_temp_data_we_m,out_temp_rf_wr_en_m,out_temp_rf_wr_data_sel_m,out_temp_rf_b_sel_m,out_temp_we_dec_ex_m,
out_temp_alu_bin_sel_m,out_temp_alu_ain_sel_m,out_temp_we_ex_mem_m,out_temp_select_for_in_m,out_temp_select_for_out_m,temp_PC_load:STD_LOGIC;
signal temp_ALU_func,temp_alu_func_d,out_temp_alu_func_d,out_temp_alu_func_a,out_temp_alu_func_m : STD_LOGIC_VECTOR(3 downto 0);

signal temp_op_d,temp_op_a,temp_op_m : STD_LOGIC_VECTOR(5 downto 0);
signal tempFWAsel,tempFWBsel : STD_LOGIC_VECTOR(1 downto 0);

begin


IFSTAGE_datapath : IFSTAGE Port Map(
								  PC_Immed =>"00000000000000000000000000000000",-- mono gia to jump to xreiazomai(pio meta)
								  PC_sel =>'0',--control to bazw 0 epeidh den exw jump
								  PC_LdEn =>temp_PC_load,--controll k auto
								  Reset =>reset_processor,
								  Clk => clk,
								  PC_out =>temp_PC_out);
							

RAM_datapath : RAM Port Map (	 clk => clk,
										 inst_addr =>temp_PC_out(12 downto 2),
										 inst_dout =>temp_inst_dout,
										-- data_we =>'0',--control
										 data_we => out_temp_data_we_a,
										 data_addr =>temp_Address_FOR_RAM(12 downto 2),--erxetai apo to mem stage(oxi apo thn alu)
										 data_din =>temp_dataInForRAMout,--erxetai apo to rf, afou prwta omws perasei apo ton lsb taker
										 data_dout =>temp_data_dout);
								 
DECSTAGE_datapath : DECSTAGE Port Map ( Instr =>temp_inst_dout,--ok
													 rd_wb=>temp_rd2_m,
													 RF_WrEn =>out_temp_rf_wr_en_m,--ok
													 ALU_out =>exodos,--ok
													 MEM_out =>temp_dataOutToRF,--exodos tou poluplekth
													 RF_WrData_sel => out_temp_rf_wr_data_sel_m,--tha to parw apo to controll!!
													 RF_B_sel =>out_temp_rf_b_sel_m,--tha to parw apo to controll!!
													 Clk =>clk,
													 Reset =>reset_processor,
													 Immed =>temp_Immed,
													 RF_A => temp_outA,
													 RF_B =>temp_outB,
													 pc_sel_d =>temp_pc_sel_d,
													 PC_LdEn_d =>temp_PC_LdEn_d,
													 data_we_d =>temp_data_we_d,
													 rf_wr_en_d =>temp_rf_wr_en_d,
													 rf_wr_data_sel_d=> temp_rf_wr_data_sel_d,
													 rf_b_sel_d =>temp_rf_b_sel_d,
													 we_dec_ex_d =>temp_we_dec_ex_d,
													 alu_bin_sel_d =>temp_alu_bin_sel_d,
													 alu_ain_sel_d =>temp_alu_ain_sel_d,
													 alu_func_d =>temp_alu_func_d,
													 we_ex_mem_d =>temp_we_ex_mem_d,
													 select_for_in_d =>temp_select_for_in_d,
													 select_for_out_d=>temp_select_for_out_d,
													 we_mem_wb_d=>temp_we_mem_wb_d);
										 
										 
DEC_EX :PipelineRegister Port Map( inRegister (31 downto 0)=>temp_outA,
											  inRegister (63 downto 32)=>temp_outB,
											  inRegister (95 downto 64)=>temp_Immed,
											  inRegister (100 downto 96)=>temp_inst_dout(20 downto 16),
											  inRegister(101)=>temp_pc_sel_d,
											  inRegister(102)=>temp_PC_LdEn_d,
											  inRegister(103)=>temp_data_we_d,
											  inRegister(104)=>temp_rf_wr_en_d,
											  inRegister(105)=>temp_rf_wr_data_sel_d,
											  inRegister(106)=>temp_rf_b_sel_d,
											  inRegister(107)=>temp_we_dec_ex_d,
											  inRegister(108)=>temp_alu_bin_sel_d,
											  inRegister(109)=>temp_alu_ain_sel_d,
											  inRegister(113 downto 110)=>temp_alu_func_d,
											  inRegister(114)=>temp_we_ex_mem_d,
											  inRegister(115)=>temp_select_for_in_d,
											  inRegister(116)=>temp_select_for_out_d,
											  inRegister(117)=>temp_we_mem_wb_d,
											  inRegister(123 downto 118) =>temp_inst_dout(31 downto 26), --op
											  inRegister(128 downto 124) =>temp_inst_dout(25 downto 21), --rs
											  inRegister(133 downto 129) =>temp_inst_dout(15 downto 11), --rt
										  
  
											  outRegister (31 downto 0)=>temp_RF_A,
											  outRegister (63 downto 32)=>temp_RF_B,
											  outRegister (95 downto 64)=>temp_Immed_dec_ex,
											  outRegister (100 downto 96)=>temp_rd,
											  outRegister(101)=>out_temp_pc_sel_d,
											  outRegister(102)=>out_temp_PC_LdEn_d,
											  outRegister(103)=>out_temp_data_we_d,
											  outRegister(104)=>out_temp_rf_wr_en_d,
											  outRegister(105)=>out_temp_rf_wr_data_sel_d,
											  outRegister(106)=>out_temp_rf_b_sel_d,
											  outRegister(107)=>out_temp_we_dec_ex_d,
											  outRegister(108)=>out_temp_alu_bin_sel_d,
											  outRegister(109)=>out_temp_alu_ain_sel_d,
											  outRegister(113 downto 110)=>out_temp_alu_func_d,
											  outRegister(114)=>out_temp_we_ex_mem_d,
											  outRegister(115)=>out_temp_select_for_in_d,
											  outRegister(116)=>out_temp_select_for_out_d,
											  outRegister(117)=>out_temp_we_mem_wb_d,
											  outRegister (123 downto 118)=>temp_op_d,
											  outRegister (128 downto 124)=>temp_rs_d,
											  outRegister (133 downto 129)=>temp_rt_d,
											  
											  clk =>clk,
											  WE =>temp_we_dec_ex_d,--tha to parw apo to control
											  reset=>reset_processor);										 
										
																				
ALUSTAGE_datapath:  ALUSTAGE Port Map ( 	  RF_A =>temp_RF_A,
														  RF_B =>temp_RF_B,
														  Immed =>temp_Immed_dec_ex ,
														  ALU_Bin_sel =>out_temp_alu_bin_sel_d,
														  ALU_Ain_sel =>out_temp_alu_ain_sel_d,
														  ALU_func =>out_temp_alu_func_d,
														  resFromALU =>temp_Address,
														 --resFromALU =>exodos,
														  reALUwb => exodos,
														  FWBsel =>tempFWBsel,
														  FWAsel =>tempFWAsel,
														  ALU_out =>temp_ALU_out,
														  Zero =>temp_Zero,
														  Cout =>temp_Cout,
														  Ovf =>temp_Ovf );								
										

EX_MEM :PipelineRegister Port Map( inRegister (31 downto 0)=>temp_ALU_out,
											  inRegister (63 downto 32)=>temp_RF_B,
											  inRegister (95 downto 64)=>temp_Immed_dec_ex,
											  inRegister (100 downto 96)=>temp_rd,
											  inRegister(101)=>out_temp_pc_sel_d,
											  inRegister(102)=>out_temp_PC_LdEn_d,
											  inRegister(103)=>out_temp_data_we_d,
											  inRegister(104)=>out_temp_rf_wr_en_d,
											  inRegister(105)=>out_temp_rf_wr_data_sel_d,
											  inRegister(106)=>out_temp_rf_b_sel_d,
											  inRegister(107)=>out_temp_we_dec_ex_d,
											  inRegister(108)=>out_temp_alu_bin_sel_d,
											  inRegister(109)=>out_temp_alu_ain_sel_d,
											  inRegister(113 downto 110)=>out_temp_alu_func_d,
											  inRegister(114)=>out_temp_we_ex_mem_d,
											  inRegister(115)=>out_temp_select_for_in_d,
											  inRegister(116)=>out_temp_select_for_out_d,
											  inRegister(117)=>out_temp_we_mem_wb_d,
											  inRegister (123 downto 118)=>temp_op_d,
											  inRegister (128 downto 124)=>temp_rs_d,
											  inRegister (133 downto 129)=>temp_rt_d,
											  
											  outRegister (31 downto 0)=>temp_Address,
											  outRegister (63 downto 32)=>temp_out2,
											  outRegister (95 downto 64)=>temp_immed_after_ALU,
											  outRegister (100 downto 96)=>temp_rd2,
											  outRegister(101)=>out_temp_pc_sel_a,
											  outRegister(102)=>out_temp_PC_LdEn_a,
											  outRegister(103)=>out_temp_data_we_a,
											  outRegister(104)=>out_temp_rf_wr_en_a,
											  outRegister(105)=>out_temp_rf_wr_data_sel_a,
											  outRegister(106)=>out_temp_rf_b_sel_a,
											  outRegister(107)=>out_temp_we_dec_ex_a,
											  outRegister(108)=>out_temp_alu_bin_sel_a,
											  outRegister(109)=>out_temp_alu_ain_sel_a,
											  outRegister(113 downto 110)=>out_temp_alu_func_a,
											  outRegister(114)=>out_temp_we_ex_mem_a,
											  outRegister(115)=>out_temp_select_for_in_a,
											  outRegister(116)=>out_temp_select_for_out_a,
											  outRegister(117)=>out_temp_we_mem_wb_a,
											  outRegister (123 downto 118)=>temp_op_a,
											  outRegister (128 downto 124)=>temp_rs_a,
											  outRegister (133 downto 129)=>temp_rt_a,
											  
											  clk =>clk,
											  WE =>out_temp_we_ex_mem_d,--tha to parw apo to control
											  reset=>reset_processor);										
										
										
										

MEMSTAGE_datapath :   MEMSTAGE Port Map( 
											  ALU_MEM_Addr=>temp_Address,
											  select_for_in =>out_temp_select_for_in_a,
											  select_for_out=>out_temp_select_for_out_a, 											  
											  InLSBTaker=>temp_out2,--eisodos tou NEOU lsb kater
											  dataInForRAMout=>temp_dataInForRAMout, --exodos tou panw
											  OutLSBTaker=>temp_data_dout, -- eisoodos tou 2ou lsb taker
											  dataOutToRF=>temp_dataOutToRF, --exodos tou panw
											  ALU_MEM_Addr_out =>temp_Address_FOR_RAM );-- 12 downto 2 apo ton pipes
											  



											 
MEM_WB : PIPELINE_SMALL_REG Port Map(  dataIn(0) =>out_temp_pc_sel_a,
												   dataIn(1) =>out_temp_PC_LdEn_a,
													dataIn(2) =>out_temp_data_we_a,
													dataIn(3) =>out_temp_rf_wr_en_a,
													dataIn(4) =>out_temp_rf_wr_data_sel_a,
													dataIn(5) =>out_temp_rf_b_sel_a,
													dataIn(6) =>out_temp_we_dec_ex_a,
													dataIn(7) =>out_temp_alu_bin_sel_a,
													dataIn(8) =>out_temp_alu_ain_sel_a,
													dataIn(12 downto 9) =>out_temp_alu_func_a,
													dataIn(13) =>out_temp_we_ex_mem_a,
													dataIn(14) =>out_temp_select_for_in_a,
													dataIn(15) =>out_temp_select_for_out_a,
													dataIn(20 downto 16) =>temp_rd2,
													dataIn(52 downto 21) =>temp_Address,
													dataIn(58 downto 53) =>temp_op_a,
													dataIn(63 downto 59) =>temp_rs_a,
													dataIn(68 downto 64) =>temp_rt_a,

													
												   dataOut(0) =>out_temp_pc_sel_m,
													dataOut(1) =>out_temp_PC_LdEn_m,
													dataOut(2) =>out_temp_data_we_m,
													dataOut(3) =>out_temp_rf_wr_en_m,
													dataOut(4) =>out_temp_rf_wr_data_sel_m,
													dataOut(5) =>out_temp_rf_b_sel_m,
													dataOut(6) =>out_temp_we_dec_ex_m,
													dataOut(7) =>out_temp_alu_bin_sel_m,
													dataOut(8) =>out_temp_alu_ain_sel_m,
													dataOut(12 downto 9) =>out_temp_alu_func_m,
													dataOut(13) =>out_temp_we_ex_mem_m,
													dataOut(14) =>out_temp_select_for_in_m,
													dataOut(15) =>out_temp_select_for_out_m,
													dataOut(20 downto 16) =>temp_rd2_m,
													dataOut(52 downto 21)=>exodos,
													dataOut(58 downto 53) =>temp_op_m,
													dataOut(63 downto 59) =>temp_rs_m,
													dataOut(68 downto 64) =>temp_rt_m,
												   clk =>clk,
												   WrEn =>out_temp_we_mem_wb_a,
												   reset	=>reset_processor );	

Inst_FORWARD_UNIT: FORWARD_UNIT PORT MAP(
		opcode_DEC_EX => temp_op_d,
		rs_DEC_EX => temp_rs_d,
		rt_DEC_EX => temp_rt_d,
		--rf_re_EX_MEM => out_temp_rf_wr_en_d ,
		rf_re_EX_MEM => out_temp_rf_wr_en_a ,
		rd_EX_MEM => temp_rd2,
		rf_re_MEM_WB => out_temp_rf_wr_en_m ,
		rd_MEM_WB => temp_rd2_m,
		FWB => tempFWBsel ,   --sel sto alu stage prin alu a in
		FWA => tempFWAsel     --sel sto alu stage prin alu b in
	);	

stall : STALL_MODULE Port Map(  opcode_DEC_EX =>temp_op_d,
										  rt_DEC_EX =>temp_rt_d,
										  rs_DEC_EX =>temp_rs_d,
										  rd_EX_MEM =>temp_rd2,
										  out_WE_stall=>temp_PC_load,
										  clk =>clk,
										  reset =>reset_processor);
	
									  
end Behavioral;

