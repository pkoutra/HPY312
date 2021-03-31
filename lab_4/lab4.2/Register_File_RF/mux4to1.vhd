----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:37 04/22/2018 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux4to1 is
    Port ( in0 : in  STD_LOGIC_VECTOR(31 downto 0);
           in1 : in  STD_LOGIC_VECTOR(31 downto 0);
           in2 : in  STD_LOGIC_VECTOR(31 downto 0);
           in3 : in  STD_LOGIC_VECTOR(31 downto 0);
           sel4to1 : in  STD_LOGIC_VECTOR(1 downto 0);
           out_4_to_1 : out  STD_LOGIC_VECTOR(31 downto 0));
end mux4to1;

architecture Behavioral of mux4to1 is

begin

 
process (in0,in1,in2,in3,sel4to1)
begin
   case sel4to1 is
				when "00" => out_4_to_1 <= in0;  
				when "01" => out_4_to_1 <= in1; 
				when "10" => out_4_to_1 <= in2;
				when "11" => out_4_to_1 <= in3;
				when others => out_4_to_1 <= in0;
	end case;
end process;


end Behavioral;

