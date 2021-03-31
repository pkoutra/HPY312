--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:04:48 02/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/lab1/Register_File_RF/test_CM.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Compare_Module
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
 
ENTITY test_CM IS
END test_CM;
 
ARCHITECTURE behavior OF test_CM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Compare_Module
    PORT(
         CMin1 : IN  std_logic_vector(4 downto 0);
         CMin2 : IN  std_logic_vector(4 downto 0);
         CMout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CMin1 : std_logic_vector(4 downto 0) := (others => '0');
   signal CMin2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal CMout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Compare_Module PORT MAP (
          CMin1 => CMin1,
          CMin2 => CMin2,
          CMout => CMout
        );

--   -- Clock process definitions
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
      -- hold reset state for 100 ns.
		
		CMin1 <="00001";
      CMin2 <="00001";
      wait for 100 ns;	
		
		CMin1 <="00001";
      CMin2 <="00011";
      wait for 100 ns;

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
