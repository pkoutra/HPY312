--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:46:05 03/05/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/zou/lab1/Register_File_RF/test_ALU_operation.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_operation
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
 
ENTITY test_ALU_operation IS
END test_ALU_operation;
 
ARCHITECTURE behavior OF test_ALU_operation IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_operation
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         OutOperation : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OutOperation : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_operation PORT MAP (
          A => A,
          B => B,
          Op => Op,
          OutOperation => OutOperation
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
		

     -- wait for <clock>_period*10;
		 A <= "00000000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="0000";
		wait for 100 ns;
		  
			
		 A <= "00000000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="0001";
		 
      wait for 100 ns;
		 	
		 A <= "00000000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="0010";
		 
      wait for 100 ns;	
		 A <= "00000000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="0011";
		 
      wait for 100 ns;	
		 A <= "00000000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="0100";
		 
      wait for 100 ns;	
		 A <= "10100000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="1000";
		 
      wait for 100 ns;	
		 A <= "10100000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="1001";
		 
      wait for 100 ns;	
		 A <= "10100000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="1010";
		 
      wait for 100 ns;	
		 A <= "10100000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="1100";
		 
      wait for 100 ns;	
		 A <= "10100000000000000000000000000101";
       B <= "00000000000000000000000000000011";
       Op <="1101";
		 
      wait for 100 ns;	
		 
      -- insert stimulus here 

      wait;
   end process;

END;
