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
           ALU_bin_sel_con : out  STD_LOGIC;
			  ALU_function_in :in STD_LOGIC_VECTOR(5 downto 0);
           ALU_func_con : out  STD_LOGIC_VECTOR(3 downto 0);
           mem_Wr_En_con : out  STD_LOGIC;
			  ALU_ain_sel_con :out  STD_LOGIC;
			  dataIn_sel_con :out  STD_LOGIC;
			  dataOut_sel_con :out  STD_LOGIC;
			  Zero_con : in  STD_LOGIC;
			  reset :in  STD_LOGIC);
end CONTROL;

architecture Behavioral of CONTROL is

--begin



   type state_type is (R_type,I_type,B_type,LI_type,Bcond_type,Loadw_type,Storew_type,Init,Final,B_Zero_A,B_Zero_B,Loadb_type,Storeb_type); 
   signal state, next_state : state_type; 
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
--            pc_sel_con <= '0';
--				pc_LdEn_con<= '0';
--				RF_B_sel_con <= '0';
--				RF_Wr_Data_sel_con<= '0';
--				ALU_bin_sel_con<= '0';
--				ALU_func_con<= "0000";
--				mem_Wr_En_con <= '0';
         else
            state <= next_state;
       --     <output> <= <output>_i;
         -- assign other outputs to internal signals
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
				ALU_bin_sel_con<= '0';
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<='0';
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
		elsif state= R_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				ALU_bin_sel_con<= '0';--
				ALU_func_con<= ALU_function_in(3 downto 0);--
				mem_Wr_En_con <= '0';--
				RF_WrEn_con <='1';--
				ALU_ain_sel_con <='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
		elsif state = I_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= '1';--
				ALU_func_con<=instruction_con (3 downto 0);--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
			
		elsif state= B_type then
				pc_sel_con <= '1';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '0';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '0';--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				
		elsif state= Bcond_type then
				pc_sel_con <= '0';--omoia me to katw
				pc_LdEn_con<= '0';-- kanonika htan edw 1, alla epeidh exw k thn katastash B_Zero_A,B tha to kanw ekei opws prepei na einai
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '0';--
				ALU_func_con<= "0001";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
				
		elsif state =B_Zero_A then
				pc_sel_con <= '1';
				pc_LdEn_con<= '1';
				RF_B_sel_con <= '1';--to allaxa edw htan 0
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '0';--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';
		elsif state =B_Zero_B then
				pc_sel_con <= '0';
				pc_LdEn_con<= '1';
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '0';--
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';
		elsif state =LI_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= '1';--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '0';--
				ALU_ain_sel_con<='1';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
		elsif state =Storew_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '1';--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '1';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='0';--
				dataOut_sel_con <='0';--
		elsif state =Storeb_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '0';--
				RF_WrEn_con <='0';--
				ALU_bin_sel_con<= '1';--
				ALU_func_con<= "0000";--
				mem_Wr_En_con <= '1';--
				ALU_ain_sel_con<='0';--
				dataIn_sel_con<='1';--
				dataOut_sel_con <='0';--
		elsif state=Loadw_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= '1';
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<='0';
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
		elsif state=Loadb_type then
				pc_sel_con <= '0';--
				pc_LdEn_con<= '1';--
				RF_B_sel_con <= '1';--
				RF_Wr_Data_sel_con<= '1';--
				RF_WrEn_con <='1';--
				ALU_bin_sel_con<= '1';
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<='0';
				dataIn_sel_con<='0';
				dataOut_sel_con <='1';
		elsif state =Final then
				pc_sel_con <= '0';
				pc_LdEn_con<= '0';
				RF_B_sel_con <= '0';
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='0';
				ALU_bin_sel_con<= '0';
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<='0';
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';
		else
				pc_sel_con <= '0';
				pc_LdEn_con<= '0';
				RF_B_sel_con <= '0';
				RF_Wr_Data_sel_con<= '0';
				RF_WrEn_con <='0';
				ALU_bin_sel_con<= '0';
				ALU_func_con<= "0000";
				mem_Wr_En_con <= '0';
				ALU_ain_sel_con<='0';
				dataIn_sel_con<='0';
				dataOut_sel_con <='0';			               
      end if;
   end process;
 
  -- NEXT_STATE_DECODE: process (R_type,I_type,Branch_type,Load_type,Store_type,Init)
   NEXT_STATE_DECODE: process (state,instruction_con,Zero_con)

   begin
      --declare default state for next_state to avoid latches
   --   next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when Init =>
            if instruction_con = "100000" then
               next_state <= R_type;
            elsif ((instruction_con="110000")OR(instruction_con="110010")OR(instruction_con="110011")) then
					next_state <= I_type;
				elsif ((instruction_con ="111000")OR(instruction_con="111001")) then
					next_state <= LI_type;
				elsif (instruction_con="111111") then
					next_state <= B_type;
				elsif ((instruction_con="000000")OR(instruction_con="000001")) then
					next_state <=Bcond_type;
				elsif (instruction_con="000011") then
				   next_state <= Loadb_type;
				elsif (instruction_con="001111") then
					next_state <= Loadw_type;
				elsif (instruction_con="000111") then 
				   next_state <= Storeb_type;
				elsif(instruction_con="011111") then
					next_state <= Storew_type;
				else
					next_state <= Init;
				end if;
         when R_type=>
				next_state <=Final;
         when I_type =>
				 next_state <=Final;
			when B_type =>
				 next_state <=Final;
			when Loadw_type =>
				 next_state <=Final;
			when Storew_type =>
				 next_state <=Final;
			when Loadb_type =>
				 next_state <=Final;
			when Storeb_type =>
				 next_state <=Final;
			when LI_type =>
				 next_state <=Final;
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
			when Final =>
				next_state <=Init;
         when others =>
            next_state <= Init;
      end case;      
   end process;



end Behavioral;

