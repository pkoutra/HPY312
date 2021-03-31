--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:45 03/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Lenovo/Desktop/lab1/Register_File_RF/Test_Rf.vhd
-- Project Name:  Register_File_RF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File_RF
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
 
ENTITY Test_Rf IS
END Test_Rf;
 
ARCHITECTURE behavior OF Test_Rf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File_RF
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File_RF PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WrEn => WrEn,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '1';
		wait for Clk_period/2;
	--	wait for Clk_period*10;
		Clk <= '0';
		wait for Clk_period/2;
		--wait for Clk_period*10;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
			 wait for Clk_period/2;
			 Ard1 <= "00011";
          Ard2 <= "00101";
          Awr <= "00001";
          Din <= "01000000000000000000000000000111";
          WrEn <= '1';
        --  Clk <= Clk;
      -- hold reset state for 100 ns.
      --wait for 100 ns;
			wait for 100 ns;

      
			 Ard1 <= "00111";
          Ard2 <= "00101";
          Awr <= "00101";
          Din <= "01000000011000000000000000000111";
          WrEn <= '1';
       --   Clk <= Clk;
		 wait for 100 ns;	
			
			 Ard1 <= "01011";
          Ard2 <= "00101";
          Awr <= "01011";
          Din <= "01000000011000000000000000000111";
          WrEn <= '1';
     --     Clk <= Clk;
		 wait for 100 ns;	
		 
			 Ard1 <= "01011";
          Ard2 <= "00101";
          Awr <= "00000";
          Din <= "01000000011000000000000000000111";
          WrEn <= '1';
      --    Clk <= Clk;
		 wait for 100 ns;
		 
			 Ard1 <= "01011";
          Ard2 <= "00101";
          Awr <= "00000";
          Din <= "01000000011000000000000000000111";
          WrEn <= '0';
      --    Clk <= Clk;
		 wait for 100 ns;			 
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
