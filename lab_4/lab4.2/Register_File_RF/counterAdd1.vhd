----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:56 04/23/2018 
-- Design Name: 
-- Module Name:    counterAdd1 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterAdd1 is
    Port ( Clock : in  STD_LOGIC;
			  outCounterAdd1 : out  STD_LOGIC_VECTOR(4 downto 0);
           counterAddEn : in  STD_LOGIC);
end counterAdd1;

architecture Behavioral of counterAdd1 is
signal tempSum : STD_LOGIC_VECTOR(4downto 0);-- := "00000";

begin

process(counterAddEn,Clock)
	begin
		if (Clock'event and Clock='1') then
			if ( counterAddEn = '0') then
				tempSum<="00000";
			else 
				tempSum <= tempSum + "00001";
			end if;	
		end if;
	end process;
	outCounterAdd1 <= tempSum;
	


end Behavioral;

