----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:14 03/08/2018 
-- Design Name: 
-- Module Name:    incrementorImmed - Behavioral 
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

entity incrementorImmed is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           incrValue : in  STD_LOGIC_VECTOR(31 downto 0);
           incrImmedOut : out  STD_LOGIC_VECTOR(31 downto 0));
end incrementorImmed;

architecture Behavioral of incrementorImmed is

begin
      incrImmedOut <= PC_Immed + incrValue;

end Behavioral;

