----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:55 02/28/2018 
-- Design Name: 
-- Module Name:    MUX_2_to_1 - Behavioral 
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

entity MUX_2_to_1 is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_2_to_1;

architecture Behavioral of MUX_2_to_1 is

begin
process (sel,input1,input2)
begin
   case sel is
				when '0' => output <= input1; --data kataxwrhth B
				when '1' => output <= input2; --nea data Zero
				when others => output <= input1;
	end case;
end process;
end Behavioral;

