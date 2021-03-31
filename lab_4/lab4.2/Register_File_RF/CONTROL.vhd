----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:48 03/18/2018 
-- Design Name: 
-- Module Name:    CONTROL - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTROL is
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
			  load_A_reg: out  STD_LOGIC;
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
end CONTROL;
 
architecture Behavioral of CONTROL is

--begin



   type state_type is (R_type,R_typeNext,next_LB_type,I_type,next_I_type,next_LW_type,B_type,LI_type,Bcond_type,Load_type,
	LW_type,LB_type,Storew_type,Init,Final,B_Zero_A,B_Zero_B,Loadb_type,Storeb_type,
	MMX_addi_byte_State,polyState,afterFinalState,AfterLI,next_Storew_type,next_Storeb_type,
	nextMMX_addi_byte_State,nextApolyState,nextBpolyState,nextCpolyState,nextDpolyState,nextEpolyState,
	nextFpolyState,nextB_BpolyState,nextC_BpolyState,nextpolyStateFinal,
	rfldState,rfldStateA,rfldStateB,rfldStateC,rfldStateD,
	rfldStateC1,rfldStateC2,rfldStateC3,rfldStateC4,rfldStateC5,rfldStateC6,rfldStateC7,rfldStateC8,rfldStateC9,
	rfldStateC10,rfldStateC11,rfldStateC12,rfldStateC13,rfldStateC14,rfldStateC15,rfldStateC16,rfldStateC17,rfldStateC18,rfldStateC19, 
	rfldStateC20,rfldStateC21,rfldStateC22,rfldStateC23,rfldStateC24,rfldStateC25,rfldStateC26,rfldStateC27,rfldStateC28,rfldStateC29,
 	rfldStateC30,
	rfstState,rfstState_A,rfstState_B,rfstState_B1,rfstState_B2,rfstState_B3,rfstState_B4,rfstState_B5,
	rfstState_B6,rfstState_B7,rfstState_B8,rfstState_B9,rfstState_B10,rfstState_B11,rfstState_B12,rfstState_B13,
	rfstState_B14,rfstState_B15,rfstState_B16,rfstState_B17,rfstState_B18,rfstState_B19,rfstState_B20,
	rfstState_B21,rfstState_B22,rfstState_B23,rfstState_B24,rfstState_B25,rfstState_B26,rfstState_B27,
	rfstState_B28,rfstState_B29,rfstState_B30,rfstState_C);

 signal state, next_state,loopGEN : state_type; 
	signal count : std_logic_vector(4 downto 0) := "00000";
	--type loopGEN is state_type;

   --Declare internal signals for all outputs of the state-machine
   --signal <output>_i : std_logic;  -- example output signal
   --other outputs
 begin
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (reset = '1') then
           state <= Init;
         else
               state <= next_state;
         end if;        
      end if;
   end process;
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
		--below is simple example
      
      if state= Init then
			   pc_sel_con <= '0';
				pc_LdEn_con<= '0';
				RF_B_sel_con <= '0';
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='0';
				ALU_bin_sel_con<= "000";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
				load_A_reg <= '0';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state= R_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= ALU_function_in(3 downto 0);--
				mem_Wr_En_con <= '0';--
				RF_WrEn_con <='1';--
				ALU_ain_sel_con <="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';       
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';

		elsif state= R_typeNext then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= ALU_function_in(3 downto 0);--
				mem_Wr_En_con <= '0';--
				RF_WrEn_con <='1';--
				ALU_ain_sel_con <="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';       
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';

		elsif state = I_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<=instruction_con (3 downto 0);--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';

		elsif state = next_I_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<=instruction_con (3 downto 0);--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state= B_type then
				pc_sel_con <= '1';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state= Bcond_type then
				pc_sel_con <= '0';--omoia me to katw
				pc_LdEn_con<= '0';-- kanonika htan edw 1, alla epeidh exw k thn katastash B_Zero_A,B tha to kanw ekei opws prepei na einai
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= "0001";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =B_Zero_A then
				pc_sel_con <= '1';
				pc_LdEn_con<= '1';
				RF_B_sel_con <= '1';--to allaxa edw htan 0
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';
				load_A_reg <= '1';
				load_B_reg <= '0';
				--ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =B_Zero_B then
				pc_sel_con <= '0';
				pc_LdEn_con<= '1';
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
		
		elsif state =LI_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="01";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif  state =AfterLI then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="01";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =Storew_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
			--	mem_Wr_En_con <= '1';--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =next_Storew_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
			--	mem_Wr_En_con <= '1';--
				mem_Wr_En_con <= '1';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =Storeb_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '1';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='1';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =next_Storeb_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0';
				load_B_reg <= '0';
--				ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
	elsif state=Load_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state=LW_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state=next_LW_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state=LB_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--   ---htan 0
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='1';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state=next_LB_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--   ---htan 0
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='1';
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state =Final then
				pc_sel_con <= '0';
				pc_LdEn_con<= '0';
				RF_B_sel_con <= '0';
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='0';
				ALU_bin_sel_con<= "000";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
				load_A_reg <= '0';
				load_B_reg <= '0';
		--		ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';			
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = MMX_addi_byte_State then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<="1111";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
		--		ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';			
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = nextMMX_addi_byte_State then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= "001";--
				ALU_func_con<="1111";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = polyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				--pc_LdEn_con<= '1';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "111";--
				ALU_func_con<="0000";--
				mem_Wr_En_con <= '0';-- dc
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '1'; --gia mhdenika
				mc_addr_ldEnC <= '0';--
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = nextApolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "000";--
				ALU_func_con<="0111";--
				mem_Wr_En_con <= '0';-- gia na diabasei sth ram
				ALU_ain_sel_con<="11";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0'; --gia na parei to out2
				mc_addr_ldEnC <= '1';--energopoihsh tou kataxwrhth 
				mc_addr4C <='0'; 
				ALUpreSel <='1';----SOS TO PAIRNEI APO TON KATAXWRHTH A --apo1
				ALUafterSel <= '0';-- menei 0 epeidh telika pairnei to a  
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = nextBpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "011";-- gia na parei apo th ram
				ALU_func_con<="0111";--pollsmos
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="10";--thelw na parw apo ton kataxwrhth
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0'; --dc
				mc_addr_ldEnC <= '1';--energopoihsh tou kataxwrhth  
				mc_addr4C <='1';--epeidh einai b
				ALUpreSel <='1';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '1';	-- thelw na dialexei apoto address counter
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
			elsif state = nextB_BpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "011";-- gia na parei apo th ram
				ALU_func_con<="0111";--pollsmos
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="10";--thelw na parw apo ton kataxwrhth
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0'; --dc
				mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth  
				mc_addr4C <='1';--epeidh einai b
				ALUpreSel <='1';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '1';	-- thelw na dialexei apoto address counter
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
		elsif state = nextCpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "011";-- gia na parei apo th ram
				ALU_func_con<="0111";--pollsmos
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="11";--thelw na parw apo ton out2
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0';
				load_B_reg <= '1';
		--		ALU_preBin_sel <= '0'; --dc
			--	mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth apo1
				mc_addr_ldEnC <= '1';--energopoihsh tou kataxwrhth apo1
				mc_addr4C <='1';--epeidh einai y
				ALUpreSel <='1';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '1';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
			elsif state = nextC_BpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "011";-- gia na parei apo th ram
				ALU_func_con<="0111";--pollsmos
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="11";--thelw na parw apo ton out2
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0';
				load_B_reg <= '0';
		--		ALU_preBin_sel <= '0'; --dc
			--	mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth apo1
				mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth apo1
				mc_addr4C <='1';--epeidh einai y
				ALUpreSel <='1';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '1';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
			elsif state = nextDpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "011";-- gia na parei apo th ram
				ALU_func_con<="0000";--prosthesi             
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="10";--thelw na parw apo ton regA
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
				mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth 
				mc_addr4C <='1';--epeidh einai y apo0
				ALUpreSel <='0';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
			
			elsif state = nextEpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= "010";-- gia na parei apo th REGB
				ALU_func_con<="0000";--prosthesi
				mem_Wr_En_con <= '0';-- gia na diabasei, OXI na grapsei
				ALU_ain_sel_con<="10";--thelw na parw apo ton regA
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1';
				load_B_reg <= '0';
		--		ALU_preBin_sel <= '0'; --dc
				mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth 
				mc_addr4C <='0';--epeidh einai y
				ALUpreSel <='0';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '0';
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';		
				ControlSelGiaAddress <= '0';
				
			elsif state = nextFpolyState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				--pc_LdEn_con<= '0';--
				RF_B_sel_con <= '0';-- 15-11
				RF_Wr_Data_sel_con<= '0';-- ALU
				RF_WrEn_con <='1';-- energopoihsh eggrafhs
				ALU_bin_sel_con<= "000";--dc
				ALU_func_con<="0000";--dc
				mem_Wr_En_con <= '0';-- dc
				ALU_ain_sel_con<="00";--dc
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0';
				load_B_reg <= '0';
		--		ALU_preBin_sel <= '0'; --dc
				mc_addr_ldEnC <= '0';--energopoihsh tou kataxwrhth 
				mc_addr4C <='0';--epeidh einai y
				ALUpreSel <='0';----SOS TO PAIRNEI APO TON KATAXWRHTH A
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
			elsif state = rfldState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '1';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1'; --grafw sto rega to apotelesma ths alu
				load_B_reg <= '0';
				mc_addr_ldEnC <= '0';--
				mc_addr4C <='0';--
				ALUpreSel <='0';--
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0'; --1 o counter 0
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
				
			elsif state = rfldStateA then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '1';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --exei graftei to base address
				load_B_reg <= '0';
				mc_addr_ldEnC <= '1';--
				mc_addr4C <='0';--
				ALUpreSel <='1';--
				ALUafterSel <= '1';	
				CONTROLenCounter <= '0'; --1 o counter
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
				
			elsif state = rfldStateB then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '1';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --exei graftei to base address
				load_B_reg <= '0';
				mc_addr_ldEnC <= '1';--
				mc_addr4C <='1';--
				ALUpreSel <='1';--
				ALUafterSel <= '1';	
				CONTROLenCounter <= '1'; --1 o counter
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
				
		elsif ((state = rfldStateC ) OR (state = rfldStateC1) OR( state = rfldStateC2) OR (state =rfldStateC3) OR (state =rfldStateC4) OR(state = rfldStateC5)
			OR (state = rfldStateC6 )OR( state = rfldStateC7) OR (state = rfldStateC8 )OR (state = rfldStateC9 )OR (state = rfldStateC10)
			OR (state = rfldStateC11) OR (state = rfldStateC12) OR(state =  rfldStateC13) OR(state =  rfldStateC14) OR (state = rfldStateC15)
			OR (state = rfldStateC16) OR(state =  rfldStateC17 )OR(state =  rfldStateC18 )OR (state = rfldStateC19 )OR(state =  rfldStateC20)
			OR( state = rfldStateC21) OR(state =  rfldStateC22 )OR (state = rfldStateC23) OR (state = rfldStateC24) OR (state = rfldStateC25)
			OR (state = rfldStateC26 ) OR(state =  rfldStateC27 )OR (state = rfldStateC28) OR (state = rfldStateC29 )OR (state = rfldStateC30)) THEN
		
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '1';-- mem
				RF_WrEn_con <='1';-- energoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --exei graftei to base address
				load_B_reg <= '0';
				mc_addr_ldEnC <= '1';--
				mc_addr4C <='1';--
				ALUpreSel <='1';--
				ALUafterSel <= '1';	
				CONTROLenCounter <= '1'; --1 o counter
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
				
			elsif state = rfldStateD then--telikh katastash
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';
				RF_B_sel_con <= '0';-- 
				RF_Wr_Data_sel_con<= '0';-- 
				RF_WrEn_con <='0';-- 
				ALU_bin_sel_con<= "000";
				ALU_func_con<="0000";--
				mem_Wr_En_con <= '0';-- 
				ALU_ain_sel_con<="00";--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --
				load_B_reg <= '0';
				mc_addr_ldEnC <= '0';--
				mc_addr4C <='0';--
				ALUpreSel <='0';--
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0'; 
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
								
			elsif state = rfstState then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '0';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '1'; --grafw sto rega to apotelesma ths alu
				load_B_reg <= '0';
				mc_addr_ldEnC <= '0';--
				mc_addr4C <='0';--
				ALUpreSel <='0';--
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0'; --1 o counter 0
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
				
			elsif state = rfstState_A then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '0';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --grafw sto rega to apotelesma ths alu
				load_B_reg <= '0';
				mc_addr_ldEnC <= '1';--
				mc_addr4C <='0';--
				ALUpreSel <='1';--
				ALUafterSel <= '1';	
				CONTROLenCounter <= '1'; --1 o counter 0
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '0';
			
			elsif(( state = rfstState_B )OR (state = rfstState_B1) OR( state = rfstState_B2) OR (state =rfstState_B3) OR (state =rfstState_B4) OR(state = rfstState_B5)
			OR (state = rfstState_B6 )OR( state = rfstState_B7) OR (state = rfstState_B8 )OR (state = rfstState_B9 )OR (state = rfstState_B10)
			OR (state = rfstState_B11) OR (state = rfstState_B12) OR(state =  rfstState_B13) OR(state =  rfstState_B14) OR (state = rfstState_B15)
			OR (state = rfstState_B16) OR(state =  rfstState_B17 )OR(state =  rfstState_B18 )OR (state = rfstState_B19 )OR(state =  rfstState_B20)
			OR( state = rfstState_B21) OR(state =  rfstState_B22 )OR (state = rfstState_B23) OR (state = rfstState_B24) OR (state = rfstState_B25)
			OR (state = rfstState_B26 ) OR(state =  rfstState_B27 )OR (state = rfstState_B28) OR (state = rfstState_B29 )OR (state = rfstState_B30))  then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '0';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '1';-- Itype
				RF_Wr_Data_sel_con<= '0';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '1';--  grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --grafw sto rega to apotelesma ths alu
				load_B_reg <= '0';
				mc_addr_ldEnC <= '1';--
				mc_addr4C <='1';--
				ALUpreSel <='0';--
				ALUafterSel <= '1';	
				CONTROLenCounter <= '1'; --1 o counter 0
				CONTROLselMuxCounter <= '1';
				ControlSelGiaAddress <= '1';

elsif state = rfstState_C then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';-- h edw 1 h sthn teleytaia
				RF_B_sel_con <= '0';-- Itype
				RF_Wr_Data_sel_con<= '0';-- mem
				RF_WrEn_con <='0';-- apenergoppoihsh eggrafhs
				ALU_bin_sel_con<= "001";--immed
				ALU_func_con<="0000";--prostesh gia na vrw base address
				mem_Wr_En_con <= '0';-- den grafw sth mnhmh
				ALU_ain_sel_con<="00";--out1
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				load_A_reg <= '0'; --grafw sto rega to apotelesma ths alu
				load_B_reg <= '0';
				mc_addr_ldEnC <= '0';--
				mc_addr4C <='0';--
				ALUpreSel <='0';--
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0'; --1 o counter 0
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';				
		else
				pc_sel_con <= '0';
				pc_LdEn_con<= '0';
				RF_B_sel_con <= '0';
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='0';
				ALU_bin_sel_con<= "000";
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<="00";
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';	
				load_A_reg <= '0';
				load_B_reg <= '0';
			--	ALU_preBin_sel <= '0';
				mc_addr_ldEnC <= '0';
				mc_addr4C <='0';
				ALUpreSel <='0';
				ALUafterSel <= '0';	
				CONTROLenCounter <= '0';
				CONTROLselMuxCounter <= '0';
				ControlSelGiaAddress <= '0';
				
      end if;
		
   end process;
 
  -- NEXT_STATE_DECODE: process (R_type,I_type,Branch_type,Load_type,Store_type,Init)
   NEXT_STATE_DECODE: process (state,instruction_con,Zero_con,ALU_function_in)

   begin
      --declare default state for next_state to avoid latches
   --   next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when Init =>
            if ((instruction_con = "100000") AND ( ALU_function_in /= "010000")) then
               next_state <= R_type;
            elsif ((instruction_con="110000")OR(instruction_con="110010")OR(instruction_con="110011")) then
					next_state <= I_type;
				elsif ((instruction_con ="111000")OR(instruction_con="111001")) then
					next_state <= LI_type;
--				elsif ((instruction_con ="111000")) then
--					next_state <= LI_type;
--				elsif (instruction_con="111001") then   --LUI
--					next_state <= LUI_type;
				elsif (instruction_con="111111") then
					next_state <= B_type;
				elsif ((instruction_con="000000")OR(instruction_con="000001")) then
					next_state <=Bcond_type;
				elsif (instruction_con="000011" OR instruction_con="001111") then
				   next_state <= Load_type;
				elsif (instruction_con="000111") then 
				   next_state <= Storeb_type;
				elsif(instruction_con="011111") then
					next_state <= Storew_type;
				elsif(instruction_con="110001") then
					next_state <= MMX_addi_byte_State;	
				elsif ((instruction_con = "100000") AND ( ALU_function_in = "010000")) then
               next_state <= polyState;	
				elsif (instruction_con = "011100")then
					next_state <= rfldState;
				elsif (instruction_con = "011110")then
					next_state <= rfstState;
				
				else
					next_state <= Init;
				end if;
				
         when R_type=>
				next_state <=R_typeNext;
         when I_type =>
				 next_state <=next_I_type;
			when next_I_type =>
				 next_state <=Final;
			when B_type =>
				 next_state <=Final;
			when Load_type =>
				if (instruction_con="000011") then
					next_state <= LB_type;
				elsif (instruction_con="001111") then
					next_state <= LW_type;	
				else
					next_state <= Final;
				end if;
			when R_typeNext =>
				next_state <= Final;
			when LW_type =>
				 next_state <=Final;
				 --next_state <=next_LW_type;
			when next_LW_type =>
				 next_state <=Final;	 		 
			when LB_type =>
			--	 next_state <=next_LB_type;
				 next_state <=Final;
			when next_LB_type =>
				 next_state <=Final;		 
			when Storew_type =>
				 next_state <=next_Storew_type;
				--- next_state <=Final;
			when next_Storew_type =>
				 next_state <=Final;
			when Storeb_type =>
				-- next_state <=Final;
				 next_state <=next_Storeb_type;
			when next_Storeb_type =>
				 next_state <=Final;
			when LI_type =>
				 next_state <=AfterLI;
		--   when LI_type =>
			--	 next_state <=Final;
				
			when Bcond_type =>
				 if (instruction_con="000000" AND Zero_con='1') then
						next_state <=B_Zero_A;
				 elsif (instruction_con="000000" AND Zero_con='0')then
						next_state <=B_Zero_B;
				 elsif (instruction_con="000001" AND Zero_con='1') then
					   next_state <=B_Zero_B;
				 elsif(instruction_con="000001" AND Zero_con='0') then
						next_state <=B_Zero_A;
				 else
						next_state <=Final;
				 end if;
			when B_Zero_A =>
				next_state <=Final;
			when B_Zero_B =>
				next_state <=Final;
			when AfterLI => 
				next_state <= Final;
			when Final =>
				next_state <=Init;
			when MMX_addi_byte_State =>
				next_state <=nextMMX_addi_byte_State;
			when	nextMMX_addi_byte_State =>
				next_state <=Final;
			
			when polyState	 =>
				next_state <= nextApolyState;
			when nextApolyState	 =>
				next_state <=nextBpolyState;
			when nextBpolyState	 =>
				next_state <= nextB_BpolyState;
			when nextB_BpolyState	 =>
				next_state <=nextCpolyState;
			when nextCpolyState	 =>
				next_state <= nextC_BpolyState;
			when nextC_BpolyState	 =>
				next_state <= nextDpolyState;
			when nextDpolyState	 =>
				next_state <= nextEpolyState;
			when nextEpolyState	 =>
				next_state <= nextFpolyState;
			when nextFpolyState	 =>
				next_state <= Final;
			
			when rfldState =>
				next_state <= rfldStateA;
			when rfldStateA =>
				next_state <= rfldStateB;
			when rfldStateB =>	
			   next_state <= rfldStateC;
			when rfldStateC =>
			 		next_state <= rfldStateC1;
			when rfldStateC1 =>
			 		next_state <= rfldStateC2;
			when rfldStateC2 =>
			 		next_state <= rfldStateC3;
			when rfldStateC3 =>
			 		next_state <= rfldStateC4;
			when rfldStateC4 =>
			 		next_state <= rfldStateC5;
			when rfldStateC5 =>
			 		next_state <= rfldStateC6;
			when rfldStateC6 =>
			 		next_state <= rfldStateC7;
			when rfldStateC7 =>
			 		next_state <= rfldStateC8;
			when rfldStateC8 =>
			 		next_state <= rfldStateC9;
			when rfldStateC9 =>
			 		next_state <= rfldStateC10;
			when rfldStateC10 =>
			 		next_state <= rfldStateC11;
			when rfldStateC11 =>
			 		next_state <= rfldStateC12;
			when rfldStateC12 =>
			 		next_state <= rfldStateC13;
			when rfldStateC13 =>
			 		next_state <= rfldStateC14;
			when rfldStateC14 =>
			 		next_state <= rfldStateC15;
			when rfldStateC15 =>
			 		next_state <= rfldStateC16;
			when rfldStateC16 =>
			 		next_state <= rfldStateC17;
			when rfldStateC17 =>
			 		next_state <= rfldStateC18;
			when rfldStateC18 =>
			 		next_state <= rfldStateC19;
			when rfldStateC19 =>
			 		next_state <= rfldStateC20;
			when rfldStateC20 =>
			 		next_state <= rfldStateC21;
			when rfldStateC21 =>
			 		next_state <= rfldStateC22;
			when rfldStateC22 =>
			 		next_state <= rfldStateC23;
			when rfldStateC23 =>
			 		next_state <= rfldStateC24;
			when rfldStateC24 =>
			 		next_state <= rfldStateC25;
			when rfldStateC25 =>
			 		next_state <= rfldStateC26;
			when rfldStateC26 =>
			 		next_state <= rfldStateC27;
			when rfldStateC27 =>
			 		next_state <= rfldStateC28;
			when rfldStateC28 =>
			 		next_state <= rfldStateC29;
			when rfldStateC29 =>
			 		next_state <= rfldStateC30;
			when rfldStateC30 =>
			 		next_state <= rfldStateD;
			when rfldStateD =>
				next_state <= Final;
				
			when rfstState =>
				next_state <= rfstState_A;
			when rfstState_A =>
				next_state <= rfstState_B;
			when rfstState_B =>	
			   next_state <= rfstState_B1;
			when rfstState_B1 =>
			 		next_state <= rfstState_B2;
			when rfstState_B2 =>
			 		next_state <= rfstState_B3;
			when rfstState_B3 =>
			 		next_state <= rfstState_B4;
			when rfstState_B4 =>
			 		next_state <= rfstState_B5;
			when rfstState_B5 =>
			 		next_state <= rfstState_B6;
			when rfstState_B6 =>
			 		next_state <= rfstState_B7;
			when rfstState_B7 =>
			 		next_state <= rfstState_B8;
			when rfstState_B8 =>
			 		next_state <= rfstState_B9;
			when rfstState_B9 =>
			 		next_state <= rfstState_B10;
			when rfstState_B10 =>
			 		next_state <= rfstState_B11;
			when rfstState_B11 =>
			 		next_state <= rfstState_B12;
			when rfstState_B12 =>
			 		next_state <= rfstState_B13;
			when rfstState_B13 =>
			 		next_state <= rfstState_B14;
			when rfstState_B14 =>
			 		next_state <= rfstState_B15;
			when rfstState_B15 =>
			 		next_state <= rfstState_B16;
			when rfstState_B16 =>
			 		next_state <= rfstState_B17;
			when rfstState_B17 =>
			 		next_state <= rfstState_B18;
			when rfstState_B18 =>
			 		next_state <= rfstState_B19;
			when rfstState_B19 =>
			 		next_state <= rfstState_B20;
			when rfstState_B20 =>
			 		next_state <= rfstState_B21;
			when rfstState_B21 =>
			 		next_state <= rfstState_B22;
			when rfstState_B22 =>
			 		next_state <= rfstState_B23;
			when rfstState_B23 =>
			 		next_state <= rfstState_B24;
			when rfstState_B24 =>
			 		next_state <= rfstState_B25;
			when rfstState_B25 =>
			 		next_state <= rfstState_B26;
			when rfstState_B26 =>
			 		next_state <= rfstState_B27;
			when rfstState_B27 =>
			 		next_state <= rfstState_B28;
			when rfstState_B28 =>
			 		next_state <= rfstState_B29;
			when rfstState_B29 =>
			 		next_state <= rfstState_B30;
			when rfstState_B30 =>
			 		next_state <= rfstState_C;
			when rfstState_C =>
			 		next_state <= Final;
			
			
         when others => 
            next_state <= Init;
				
      end case;      		

			
   end process;


end Behavioral;

