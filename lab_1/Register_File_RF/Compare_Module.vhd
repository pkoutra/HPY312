----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:11 02/28/2018 
-- Design Name: 
-- Module Name:    Compare_Module - Behavioral 
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

entity Compare_Module is
    Port ( CMin1 : in  STD_LOGIC_VECTOR(4 downto 0);
           CMin2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  WE : in  STD_LOGIC;
           CMout : out  STD_LOGIC);
end Compare_Module;

architecture Behavioral of Compare_Module is

begin
process (CMin1,CMin2,WE)
begin
	if (CMin1=CMin2 AND WE='1')then
		CMout <='1';
	else
		CMout <='0';
	end if;

end process;
end Behavioral;

