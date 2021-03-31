----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:06 05/06/2018 
-- Design Name: 
-- Module Name:    CONTROL_STAGE_NEW - Behavioral 
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

entity CONTROL_STAGE_NEW is
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
	 select_for_out_c : out  STD_LOGIC;
	 we_mem_wb_c : out STD_LOGIC
	 );
end CONTROL_STAGE_NEW;

architecture Behavioral of CONTROL_STAGE_NEW is

begin
process(reset,InstructionIn) 
begin
if reset ='1' then
	 PC_sel_c <='0';
	 PC_LdEn_c <='0';
	 data_we_c <='0';
	 RF_WrEn <='0';
	 RF_WrData_sel_c <='0';
	 RF_B_sel_c <='0';
	 WE_dec_ex_c <='0';
	 ALU_Bin_sel_c <='0';
	 ALU_Ain_sel_c <='0';
	 ALU_func_c <="0000";
	 WE_ex_mem <='0';
	 select_for_in_c <='0';
	 select_for_out_c <='0';
	 we_mem_wb_c <='0';
else 
	 if InstructionIn(31 downto 26)="100000" and InstructionIn(3 downto 0)="0000" then
			 PC_sel_c <='0';--dialegw +4
			 PC_LdEn_c <='1';-- gia na erthei h epomenh
			 data_we_c <='0';
			 RF_WrEn <='1';
			 RF_WrData_sel_c <='0';--apo th ALU
			 RF_B_sel_c <='0';-- einai R type
			 WE_dec_ex_c <='1';
			 ALU_Bin_sel_c <='0';-- out2
			 ALU_Ain_sel_c <='0';--out1
			 ALU_func_c <="0000";
			 WE_ex_mem <='1';
			 select_for_in_c <='0';
			 select_for_out_c <='0';
			 we_mem_wb_c <='1';
			 
		elsif InstructionIn(31 downto 26)="111000"  then
			 PC_sel_c <='0';
			 PC_LdEn_c <='1';
			 data_we_c <='0';
			 RF_WrEn <='1';
			 RF_WrData_sel_c <='0';
			 RF_B_sel_c <='1';
			 WE_dec_ex_c <='1';
			 ALU_Bin_sel_c <='1';
			 ALU_Ain_sel_c <='1';
			 ALU_func_c <="0000";
			 WE_ex_mem <='1';
			 select_for_in_c <='0';
			 select_for_out_c <='0';
			 we_mem_wb_c <='1';
			 
		elsif InstructionIn(31 downto 26)="001111"  then
			 PC_sel_c <='0';
			 PC_LdEn_c <='1';
			 data_we_c <='0';
			 RF_WrEn <='1';
			 RF_WrData_sel_c <='1';
			 RF_B_sel_c <='1';
			 WE_dec_ex_c <='1';
			 ALU_Bin_sel_c <='1';
			 ALU_Ain_sel_c <='0';
			 ALU_func_c <="0000";
			 WE_ex_mem <='1';
			 select_for_in_c <='0';
			 select_for_out_c <='0';
			 we_mem_wb_c <='1';
			 
		elsif InstructionIn(31 downto 26)="011111"  then
			 PC_sel_c <='0';
			 PC_LdEn_c <='1';
			 data_we_c <='1';
			 RF_WrEn <='0';
			 RF_WrData_sel_c <='0';
			 RF_B_sel_c <='1';
			 WE_dec_ex_c <='1';
			 ALU_Bin_sel_c <='1';
			 ALU_Ain_sel_c <='0';
			 ALU_func_c <="0000";
			 WE_ex_mem <='1';
			 select_for_in_c <='0';
			 select_for_out_c <='0';
			 we_mem_wb_c <='1';
		
		else 
			 PC_sel_c <='0';
			 PC_LdEn_c <='0';
			 data_we_c <='0';
			 RF_WrEn <='0';
			 RF_WrData_sel_c <='0';
			 RF_B_sel_c <='0';
			 WE_dec_ex_c <='0';
			 ALU_Bin_sel_c <='0';
			 ALU_Ain_sel_c <='0';
			 ALU_func_c <="0000";
			 WE_ex_mem <='0';
			 select_for_in_c <='0';
			 select_for_out_c <='0';
			 we_mem_wb_c <='0';
		end if;
end if;
end process;

end Behavioral;

