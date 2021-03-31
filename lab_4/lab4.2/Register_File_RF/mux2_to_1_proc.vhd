----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:29 03/20/2018 
-- Design Name: 
-- Module Name:    mux2_to_1_proc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2_to_1_proc is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           C : out  STD_LOGIC_VECTOR(31 downto 0);
           select_proc : in  STD_LOGIC);
end mux2_to_1_proc;

architecture Behavioral of mux2_to_1_proc is

begin
process (A,B,select_proc)
begin
   case select_proc is
				when '0' =>C <= A;  
				when '1' => C<= B; 
				when others => C<= A;
	end case;
	
	
	
	
end process;


end Behavioral;

