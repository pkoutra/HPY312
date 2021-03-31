--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:52:34 03/12/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/LAB2/Register_File_RF/testIFincr4.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Incrementor
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
 
ENTITY testIFincr4 IS
END testIFincr4;
 
ARCHITECTURE behavior OF testIFincr4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Incrementor
    PORT(
         incIn : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic;
         incOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal incIn : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal incOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Incrementor PORT MAP (
          incIn => incIn,
          Clk => Clk,
          incOut => incOut
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		incIn <= "00000000000000000000000000000000";
      wait for 100 ns;	
		incIn <= "00000000000000000000000000000100";
      wait for 100 ns;	
		incIn <= "00000000000000000000000000001000";
      wait for 100 ns;	
		incIn <= "00000000000000000000000000001100";
      wait for 100 ns;	
		incIn <= "00000000000000000000000000010000";
      wait for 100 ns;	
		

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
