----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:47 05/05/2018 
-- Design Name: 
-- Module Name:    PipelineRegister - Behavioral 
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

entity PipelineRegister is
    Port ( inRegister : in  STD_LOGIC_VECTOR(133 downto 0);
           outRegister : out  STD_LOGIC_VECTOR(133 downto 0);
           clk : in  STD_LOGIC;
			  WE : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end PipelineRegister;

architecture Behavioral of PipelineRegister is
signal Qtemp :STD_LOGIC_VECTOR(133 downto 0) :="00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
begin
process (clk)
    begin
		  if (reset='1') then
				outRegister <="00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	  
        elsif (clk'event and clk='1') then
		  
            if (WE='1') then
					 outRegister<=inRegister;
					 Qtemp <= inRegister;
				else
					 outRegister<=Qtemp;
				end if;	
        end if;
    end process;





end Behavioral;

