----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:00 03/09/2018 
-- Design Name: 
-- Module Name:    MUX_reg_file - Behavioral 
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

entity MUX_reg_file is
    Port ( inMuxRegFile1 : in  STD_LOGIC_VECTOR(31 downto 0);
           inMuxRegFile2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  selectorMuxRegFile : in STD_LOGIC;
           outMuxRegFile : out  STD_LOGIC_VECTOR(31 downto 0));
end MUX_reg_file;

architecture Behavioral of MUX_reg_file is

begin
process (inMuxRegFile1,inMuxRegFile2,selectorMuxRegFile)
begin
   case selectorMuxRegFile is
				when '0' => outMuxRegFile <= inMuxRegFile1; --auto einai ths ALU
				when '1' => outMuxRegFile <= inMuxRegFile2; --auto einai tou MEM
				when others => outMuxRegFile <= inMuxRegFile1;
	end case;
end process;

end Behavioral;

