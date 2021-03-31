----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:33:19 02/28/2018 
-- Design Name: 
-- Module Name:    Register_32 - Behavioral 
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

entity Register_32 is
    Port ( CLK : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  reset: in STD_LOGIC;
           WE : in  STD_LOGIC);
end Register_32;

architecture Behavioral of Register_32 is
signal Qtemp : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";

begin
    process (CLK)
    begin
		  if (reset='1') then
				Dout <="00000000000000000000000000000000";
	  
        elsif (CLK'event and CLK='1') then
		  
            if (WE='1') then
					 Dout<=Data;
					 Qtemp <= Data;
				else
					 Dout<=Qtemp;
				end if;	
        end if;
    end process;
	-- Dout<=Qtemp;
	 
end Behavioral;


