----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:55 03/08/2018 
-- Design Name: 
-- Module Name:    muxPC - Behavioral 
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

entity muxPC is
    Port ( pcFour : in  STD_LOGIC_VECTOR(31 downto 0);
           pcImmed : in  STD_LOGIC_VECTOR(31 downto 0);
			  PC_Sel : in  STD_LOGIC;
           muxPCout : out  STD_LOGIC_VECTOR(31 downto 0));
end muxPC;

architecture Behavioral of muxPC is

begin
   process (pcFour,pcImmed,PC_Sel)
    begin
      case PC_Sel is 
         when '0' => muxPCout <= pcFour;
         when '1' => muxPCout <= pcImmed;
         when others => muxPCout <= pcFour;
      end case;
    end process;

end Behavioral;

