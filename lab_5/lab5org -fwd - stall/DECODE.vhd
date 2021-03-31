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

component CONTROL_STAGE_NEW is
    Port ( InstructionIn : in  STD_LOGIC_VECTOR(31 downto 0);
	 reset : in  STD_LOGIC;
	 PC_sel_c : out  STD_LOGIC;
	 PC_LdEn_c : out  STD_LOGIC;
	 data_we_c : out  STD_LOGIC;
	 RF_WrEn : out  STD_LOGIC;
	 RF_WrData_sel_c : out  STD_LOGIC;
	 RF_B_sel_c : out  STD_LOGIC;
	 WE_dec_ex_c : out  STD_LOGIC;
	 ALU_Bin_sel_c : out  STD_LOGIC;
	 ALU_Ain_sel_c : out  STD_LOGIC;
	 ALU_func_c : out  STD_LOGIC_VECTOR(3 downto 0);
	 WE_ex_mem : out  STD_LOGIC;
	 select_for_in_c : out  STD_LOGIC;
	 select_for_out_c : out  STD_LOGIC ;
	 we_mem_wb_c : out STD_LOGIC
	 );
end component;
signal temp_MUX2 : STD_LOGIC_VECTOR(31 downto 0);
signal temp_MUX1 : STD_LOGIC_VECTOR(4 downto 0);
signal tempRFB : STD_LOGIC;

begin

Extender : Immed_Converter Port Map( InstrImmed =>Instr(15 downto 0),
												 InstrOp =>Instr(31 downto 26),
												 OutImmed =>Immed);
										
MUX_read : MUX_RF_Instr Port Map(inMuxRF1 =>Instr(15 downto 11),
											inMuxRF2 =>Instr(20 downto 16),
											--select2 =>RF_B_sel,
											select2 =>	tempRFB,
											outMuxRF =>temp_MUX1);
											
MUX_data : MUX_reg_file Port Map(inMuxRegFile1 => ALU_out,
											inMuxRegFile2 => MEM_out,
											selectorMuxRegFile =>RF_WrData_sel,
											outMuxRegFile =>temp_MUX2);											

RF : Register_File_RF Port Map( Ard1 =>Instr(25 downto 21),
										  Ard2 => temp_MUX1, 
										  Awr =>rd_wb,
										  Dout1 =>RF_A,
										  Dout2 => RF_B,
										  Din =>temp_MUX2,
										  WrEn =>RF_WrEn,
										  R => Reset,
										  Clk =>Clk);
	




	
										  
control_new :  CONTROL_STAGE_NEW Port Map ( 
										 InstructionIn =>Instr,
										 reset =>Reset,
										 PC_sel_c=>pc_sel_d,
										 PC_LdEn_c =>PC_LdEn_d,
										 data_we_c =>data_we_d,
										 RF_WrEn =>rf_wr_en_d,
										 RF_WrData_sel_c =>rf_wr_data_sel_d,
										 RF_B_sel_c =>tempRFB,
									--	 RF_B_sel_c =>rf_b_sel_d,
										 WE_dec_ex_c =>we_dec_ex_d,
										 ALU_Bin_sel_c =>alu_bin_sel_d,
										 ALU_Ain_sel_c =>alu_ain_sel_d,
										 ALU_func_c =>alu_func_d,
										 WE_ex_mem =>we_ex_mem_d,
										 select_for_in_c =>select_for_in_d,
										 select_for_out_c=> select_for_out_d,
										 we_mem_wb_c=> we_mem_wb_d);
									  
rf_b_sel_d<=tempRFB;
										  
end Behavioral;

