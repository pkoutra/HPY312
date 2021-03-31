--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:28:56 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/user00000/Desktop/LAB2/Register_File_RF/test_EXTENDER.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Immed_Converter
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
 
ENTITY test_EXTENDER IS
END test_EXTENDER;
 
ARCHITECTURE behavior OF test_EXTENDER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Immed_Converter
    PORT(
         InstrImmed : IN  std_logic_vector(15 downto 0);
         InstrOp : IN  std_logic_vector(5 downto 0);
         OutImmed : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal InstrImmed : std_logic_vector(15 downto 0) := (others => '0');
   signal InstrOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OutImmed : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Immed_Converter PORT MAP (
          InstrImmed => InstrImmed,
          InstrOp => InstrOp,
          OutImmed => OutImmed
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
	
			InstrImmed <="1000000000000001";
         InstrOp <="111000";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
			InstrImmed <="0000000000000001";
         InstrOp <="111000";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		InstrImmed <="0000000000010101";
         InstrOp <="111001";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		InstrImmed <="0001110000000001";
         InstrOp <="111111";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		InstrImmed <="1111111111111111";
         InstrOp <="000111";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		InstrImmed <="1001110000000001";
         InstrOp <="111111";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		InstrImmed <="1100000011111111";
         InstrOp <="000111";
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
