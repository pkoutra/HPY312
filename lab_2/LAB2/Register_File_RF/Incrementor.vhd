----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:09 03/08/2018 
-- Design Name: 
-- Module Name:    Incrementor - Behavioral 
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

entity Incrementor is
    Port ( incIn : in  STD_LOGIC_VECTOR( 31 downto 0);
           incOut : out  STD_LOGIC_VECTOR( 31 downto 0));
			  
end Incrementor;

architecture Behavioral of Incrementor is

begin

      incOut <= incIn + "00000000000000000000000000000100";

end Behavioral;

