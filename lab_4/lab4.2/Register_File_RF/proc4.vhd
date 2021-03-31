--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:56:21 04/22/2018
-- Design Name:   
-- Module Name:   C:/Users/user00000/Desktop/lab4.1/Register_File_RF/proc4.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processor
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
 
ENTITY proc4 IS
END proc4;
 
ARCHITECTURE behavior OF proc4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor
    PORT(
         clk : IN  std_logic;
         reset_processor : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset_processor : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          clk => clk,
          reset_processor => reset_processor
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
      -- hold reset state for 100 ns.
       reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='1';
		wait for 10 ns;
		reset_processor <='0';
		wait for 10 ns;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
