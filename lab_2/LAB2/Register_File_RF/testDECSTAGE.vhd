--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:21:17 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/user00000/Desktop/LAB2/Register_File_RF/testDECSTAGE.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY testDECSTAGE IS
END testDECSTAGE;
 
ARCHITECTURE behavior OF testDECSTAGE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
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
		 Instr <= "10000000001000100001000000110000"; --add
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '0';
       RF_B_sel <= '0';
      wait for 100 ns;	
		 Instr <= "11100000001000100001000000110000"; --li pane k grapse ston deutero
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '1';
       RF_B_sel <='1';
      wait for 100 ns;
		 Instr <= "11001000001000100001000000110000"; --nandi prwtos deuteros kai immed
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '0';
       RF_B_sel <= '1';
      wait for 100 ns;			
		 Instr <= "00000100001000100001000000110000"; --bne
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '0';
       RF_B_sel <= '1';
      wait for 100 ns;	

		 Instr <= "00001100001000100001000000110000"; --lb
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '1';
       RF_B_sel <= '1';
      wait for 100 ns;	
		 Instr <= "01111100001000100001000000110000" ;--sw
       RF_WrEn <= '1';
       ALU_out <= "00000000000000000000000000000111";
       MEM_out <= "00000000000000000000000000100111";
       RF_WrData_sel <= '0';
       RF_B_sel <= '1';
      wait for 100 ns;	
		
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
