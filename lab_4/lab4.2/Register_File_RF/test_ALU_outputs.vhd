--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:34:40 03/05/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/zou/lab1/Register_File_RF/test_ALU_outputs.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Outputs
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
 
ENTITY test_ALU_outputs IS
END test_ALU_outputs;
 
ARCHITECTURE behavior OF test_ALU_outputs IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Outputs
    PORT(
         resultOp : IN  std_logic_vector(31 downto 0);
         AOp : IN  std_logic_vector(31 downto 0);
         BOp : IN  std_logic_vector(31 downto 0);
         codeOp : IN  std_logic_vector(3 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal resultOp : std_logic_vector(31 downto 0) := (others => '0');
   signal AOp : std_logic_vector(31 downto 0) := (others => '0');
   signal BOp : std_logic_vector(31 downto 0) := (others => '0');
   signal codeOp : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Outputs PORT MAP (
          resultOp => resultOp,
          AOp => AOp,
          BOp => BOp,
          codeOp => codeOp,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
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
      resultOp <=	"10000000000000000000000000000010";
		AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="0001";
		  wait for 100 ns;
		  
		resultOp <=	"10000000000000000000000000001000";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="0000";
		 wait for 100 ns;
		  
		 resultOp <= "00000000000000000000000000000000";
		 AOp <= "11111111111111111111111111111111";
       BOp <= "00000000000000000000000000000001";
       codeOp <="0000";
		 
      wait for 100 ns;
		 resultOp <=	"11000000000000000000000000000010";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "11000000000000000000000000000011";
       codeOp <="0001";
		  wait for 100 ns;
		 resultOp <= "01000000000000000000000000001000";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "11000000000000000000000000000011";
       codeOp <="0000";
		 
      wait for 100 ns;	
		 resultOp <= "00000000000000000000000000000001";	
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="0010";
		 
      wait for 100 ns;
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="0011";
		 
      wait for 100 ns;	
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="0100";
		 
      wait for 100 ns;
		 resultOp <= "10000000000000000000000000000111";		
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="1000";
		 
      wait for 100 ns;	
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="1001";
		 
      wait for 100 ns;	
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="1010";
		 
      wait for 100 ns;	
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="1100";
		 
      wait for 100 ns;	
		 resultOp <= "10000000000000000000000000000111";
		 AOp <= "10000000000000000000000000000101";
       BOp <= "00000000000000000000000000000011";
       codeOp <="1101";
		 
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
