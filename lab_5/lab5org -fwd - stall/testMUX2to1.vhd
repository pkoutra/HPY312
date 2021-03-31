--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:53:44 02/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/lab1/Register_File_RF/testMUX2to1.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_2_to_1
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
 
ENTITY testMUX2to1 IS
END testMUX2to1;
 
ARCHITECTURE behavior OF testMUX2to1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_2_to_1
    PORT(
         input1 : IN  std_logic_vector(31 downto 0);
         input2 : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(31 downto 0) := (others => '0');
   signal input2 : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_2_to_1 PORT MAP (
          input1 => input1,
          input2 => input2,
          sel => sel,
          output => output
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
		input1 <= "01000000000000000000000000000000";
      input2 <= "00100000000000000000000000000000";
      sel <= '0';
      wait for 100 ns;	
		input1 <= "01000000000000000000000000000000";
      input2 <= "00100000000000000000000000000000";
      sel <= '1';
      wait for 100 ns;	

  --    wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
