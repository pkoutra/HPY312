----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:51 03/20/2018 
-- Design Name: 
-- Module Name:    LSB_taker - Behavioral 
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

entity LSB_taker is
    Port ( in_LSB : in  STD_LOGIC_VECTOR(31 downto 0);
           out_LSB : out  STD_LOGIC_VECTOR(31 downto 0));
end LSB_taker;

architecture Behavioral of LSB_taker is


signal temp :STD_LOGIC_VECTOR(23 downto 0);
begin
temp <="000000000000000000000000";
out_LSB(31 downto 8) <=temp;
out_LSB(7 downto 0)<=in_LSB(7 downto 0);


end Behavioral;

