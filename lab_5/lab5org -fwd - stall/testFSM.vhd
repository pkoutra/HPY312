--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:06:58 03/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/LAB3/Register_File_RF/testFSM.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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
 
ENTITY testFSM IS
END testFSM;
 
ARCHITECTURE behavior OF testFSM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL
    PORT(
         instruction_con : IN  std_logic_vector(5 downto 0);
         pc_sel_con : OUT  std_logic;
         pc_LdEn_con : OUT  std_logic;
         clk : IN  std_logic;
         RF_B_sel_con : OUT  std_logic;
         RF_Wr_Data_sel_con : OUT  std_logic;
         RF_WrEn_con : OUT  std_logic;
         ALU_bin_sel_con : OUT  std_logic;
         ALU_function_in : IN  std_logic_vector(5 downto 0);
         ALU_func_con : OUT  std_logic_vector(3 downto 0);
         mem_Wr_En_con : OUT  std_logic;
         ALU_ain_sel_con : OUT  std_logic;
         dataIn_sel_con : OUT  std_logic;
         dataOut_sel_con : OUT  std_logic;
         Zero_con : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction_con : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ALU_function_in : std_logic_vector(5 downto 0) := (others => '0');
   signal Zero_con : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal pc_sel_con : std_logic;
   signal pc_LdEn_con : std_logic;
   signal RF_B_sel_con : std_logic;
   signal RF_Wr_Data_sel_con : std_logic;
   signal RF_WrEn_con : std_logic;
   signal ALU_bin_sel_con : std_logic;
   signal ALU_func_con : std_logic_vector(3 downto 0);
   signal mem_Wr_En_con : std_logic;
   signal ALU_ain_sel_con : std_logic;
   signal dataIn_sel_con : std_logic;
   signal dataOut_sel_con : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL PORT MAP (
          instruction_con => instruction_con,
          pc_sel_con => pc_sel_con,
          pc_LdEn_con => pc_LdEn_con,
          clk => clk,
          RF_B_sel_con => RF_B_sel_con,
          RF_Wr_Data_sel_con => RF_Wr_Data_sel_con,
          RF_WrEn_con => RF_WrEn_con,
          ALU_bin_sel_con => ALU_bin_sel_con,
          ALU_function_in => ALU_function_in,
          ALU_func_con => ALU_func_con,
          mem_Wr_En_con => mem_Wr_En_con,
          ALU_ain_sel_con => ALU_ain_sel_con,
          dataIn_sel_con => dataIn_sel_con,
          dataOut_sel_con => dataOut_sel_con,
          Zero_con => Zero_con,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		instruction_con <= "100000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='1';	
      wait for 10 ns;
		instruction_con <= "100000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "100000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
	-------------------------------------add
		instruction_con <= "111000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "111000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "111000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
--------------------------------------------lui	
		instruction_con <= "111111";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "111111";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "111111";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
-------------------------------------------b
		instruction_con <= "000011";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000011";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000011";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
---------------------------------------------lb

		instruction_con <= "011111";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "011111";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "011111";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
----------------------------------------------	sw	
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '0';
      reset	<='0';	
      wait for 10 ns;
--------------------------------------------beq z=1
	   instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
		instruction_con <= "000000";
	   ALU_function_in <= "110000";
		Zero_con <= '1';
      reset	<='0';	
      wait for 10 ns;
----------------------------------------beq z=0		
--		instruction_con <= "100000";
--	   ALU_function_in <= "110000";
--		Zero_con <= '0';
--      reset	<='1';	
--      wait for 10 ns;
--
--		instruction_con <= "100000";
--	   ALU_function_in <= "110000";
--		Zero_con <= '0';
--      reset	<='0';	
--      wait for 10 ns;
--		
--		instruction_con <= "111000";
--	   ALU_function_in <= "110000";
--		Zero_con <= '0';
--      reset	<='0';	
--      wait for 10 ns;
--		
--		instruction_con <= "111111";
--	   ALU_function_in <= "110000";
--		Zero_con <= '1';
--      reset	<='0';	
--      wait for 10 ns;
--		
--		instruction_con <= "000011";
--	   ALU_function_in <= "110000";
--		Zero_con <= '0';
--      reset	<='0';	
--	   wait for 10 ns;
--
--		instruction_con <= "011111";
--	   ALU_function_in <= "110000";
--		Zero_con <= '0';
--      reset	<='0';	
--      wait for 10 ns;
--		
		
		
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
