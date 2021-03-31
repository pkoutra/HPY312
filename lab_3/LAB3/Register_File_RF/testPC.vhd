--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:39:41 03/12/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/LAB2/Register_File_RF/testPC.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC_Register
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
 
ENTITY testPC IS
END testPC;
 
ARCHITECTURE behavior OF testPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC_Register
    PORT(
         dataIN : IN  std_logic_vector(31 downto 0);
         Load : IN  std_logic;
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dataIN : std_logic_vector(31 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC_Register PORT MAP (
          dataIN => dataIN,
          Load => Load,
          Clk => Clk,
          Reset => Reset,
          dataOut => dataOut
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
			 dataIN <= "00000000000000000000000000000100";
          Load <= '1';
          Reset <= '0';
      wait for 100 ns;	
			 dataIN <= "00000000000000000000000000001000";
          Load <= '1';
          Reset <= '0';
      wait for 100 ns;	
			 dataIN <= "00000000000000000000000000001100";
          Load <= '0';
          Reset <=  '0';
      wait for 100 ns;	
			 dataIN <= "00000000000000000000000000000100";
          Load <= '1';
          Reset <=  '1';
      wait for 100 ns;	
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
