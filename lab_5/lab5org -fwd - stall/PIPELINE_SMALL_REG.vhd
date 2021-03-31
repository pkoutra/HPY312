----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:29 05/06/2018 
-- Design Name: 
-- Module Name:    PIPELINE_SMALL_REG - Behavioral 
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

entity PIPELINE_SMALL_REG is
    Port ( dataIn : in  STD_LOGIC_VECTOR(68 downto 0);
           dataOut : out  STD_LOGIC_VECTOR(68 downto 0);
           clk : in  STD_LOGIC;
			  WrEn :in  STD_LOGIC;
			  reset :in  STD_LOGIC);
end PIPELINE_SMALL_REG;

architecture Behavioral of PIPELINE_SMALL_REG is


signal Qtemp :STD_LOGIC_VECTOR(68 downto 0):="000000000000000000000000000000000000000000000000000000000000000000000";
begin
process (clk)
    begin
		  if (reset='1') then
				dataOut <="000000000000000000000000000000000000000000000000000000000000000000000";
	  
        elsif (clk'event and clk='1') then
		  
            if (WrEn='1') then
					 dataOut<=dataIn;
					 Qtemp <= dataIn;
				else
					 dataOut<=Qtemp;
				end if;	
        end if;
    end process;

end Behavioral;

