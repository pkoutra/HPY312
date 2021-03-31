--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:09:02 05/07/2018
-- Design Name:   
-- Module Name:   C:/Users/user00000/Desktop/lab5org/testCOntrolNEW.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL_STAGE_NEW
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testCOntrolNEW IS
END testCOntrolNEW;
 
ARCHITECTURE behavior OF testCOntrolNEW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL_STAGE_NEW
    PORT(
         InstructionIn : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         PC_sel_c : OUT  std_logic;
         PC_LdEn_c : OUT  std_logic;
         data_we_c : OUT  std_logic;
         RF_WrEn : OUT  std_logic;
         RF_WrData_sel_c : OUT  std_logic;
         RF_B_sel_c : OUT  std_logic;
         WE_dec_ex_c : OUT  std_logic;
         ALU_Bin_sel_c : OUT  std_logic;
         ALU_Ain_sel_c : OUT  std_logic;
         ALU_func_c : OUT  std_logic_vector(3 downto 0);
         WE_ex_mem : OUT  std_logic;
         select_for_in_c : OUT  std_logic;
         select_for_out_c : OUT  std_logic;
         we_mem_wb_c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal InstructionIn : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal PC_sel_c : std_logic;
   signal PC_LdEn_c : std_logic;
   signal data_we_c : std_logic;
   signal RF_WrEn : std_logic;
   signal RF_WrData_sel_c : std_logic;
   signal RF_B_sel_c : std_logic;
   signal WE_dec_ex_c : std_logic;
   signal ALU_Bin_sel_c : std_logic;
   signal ALU_Ain_sel_c : std_logic;
   signal ALU_func_c : std_logic_vector(3 downto 0);
   signal WE_ex_mem : std_logic;
   signal select_for_in_c : std_logic;
   signal select_for_out_c : std_logic;
   signal we_mem_wb_c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL_STAGE_NEW PORT MAP (
          InstructionIn => InstructionIn,
          reset => reset,
          PC_sel_c => PC_sel_c,
          PC_LdEn_c => PC_LdEn_c,
          data_we_c => data_we_c,
          RF_WrEn => RF_WrEn,
          RF_WrData_sel_c => RF_WrData_sel_c,
          RF_B_sel_c => RF_B_sel_c,
          WE_dec_ex_c => WE_dec_ex_c,
          ALU_Bin_sel_c => ALU_Bin_sel_c,
          ALU_Ain_sel_c => ALU_Ain_sel_c,
          ALU_func_c => ALU_func_c,
          WE_ex_mem => WE_ex_mem,
          select_for_in_c => select_for_in_c,
          select_for_out_c => select_for_out_c,
          we_mem_wb_c => we_mem_wb_c
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
	InstructionIn <= "11100000000000010000000000000010";
	wait for 100 ns;
	InstructionIn <= "11100000000000100000000000000011";
	wait for 100 ns;
	InstructionIn <= "11100000000000110000000000000100";
	wait for 100 ns;
	InstructionIn <= "11100000000001000000000000000101";
	wait for 100 ns;
	InstructionIn <= "11100000000001011111111111111111";
	wait for 100 ns;
	InstructionIn <= "10000000010001100001000000110000";
	wait for 100 ns;
	InstructionIn <= "01111100011001000000000000000100";
	wait for 100 ns;
	InstructionIn <= "10000000010001110010100000110000";
	wait for 100 ns;
	InstructionIn <= "01111100110001100000000000001010";
	wait for 100 ns;
	InstructionIn <= "00111100110100100000000000000010";
	wait for 100 ns;
	InstructionIn <= "00111100111100110000000000001110";
	wait for 100 ns;
      -- hold reset state for 100 ns.
    --  wait for 100 ns;	

    --  wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
