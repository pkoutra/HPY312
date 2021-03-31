----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:43 05/08/2018 
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
    Port ( IN1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN3 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN4 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           SELECTOR : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           OUTmux : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end mux4to1;

architecture Behavioral of mux4to1 is

begin

process (IN1,IN2,IN3,IN4,SELECTOR)
begin
   case SELECTOR is
				when "00" => OUTmux <= IN1;  
				when "01" => OUTmux <= IN2; 
				when "10" => OUTmux <= IN3;  
				when "11" => OUTmux <= IN4; 
				when others => OUTmux <= IN1;
	end case;	
end process;
end Behavioral;


