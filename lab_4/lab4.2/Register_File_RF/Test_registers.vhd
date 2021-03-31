--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:38:07 03/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/lab1/Register_File_RF/Test_registers.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_32
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
 
ENTITY Test_registers IS
END Test_registers;
 
ARCHITECTURE behavior OF Test_registers IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_32
    PORT(
         CLK : IN  std_logic;
         Data : IN  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0);
         WE : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Data : std_logic_vector(31 downto 0) := (others => '0');
   signal WE : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_32 PORT MAP (
          CLK => CLK,
          Data => Data,
          Dout => Dout,
          WE => WE
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		--CLK <= CLK;
          Data <= "00000000000000000000000000000001";
          WE <='1';
      -- hold reset state for 100 ns.
      wait for 10 ns;	
			-- CLK <= CLK;
          Data <= "10000011111000000000000000000001";
          WE <='0';
		 wait for 10 ns;
		    Data <= "10000000000000000000000000000001";
          WE <='1';
      -- hold reset state for 100 ns.
      wait for 10 ns;	
			-- CLK <= CLK;
          Data <= "10000000000000000000000000000001";
          WE <='0';
		wait for 10 ns;	
			-- CLK <= CLK;
          Data <= "10000000000000000000000000000001";
          WE <='0';
		 wait for 10 ns;	
			-- CLK <= CLK;
          Data <= "10000000001110000000111000000001";
          WE <='1';
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
