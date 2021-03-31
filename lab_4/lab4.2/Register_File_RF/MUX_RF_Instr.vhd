----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:46 03/09/2018 
-- Design Name: 
-- Module Name:    MUX_RF_Instr - Behavioral 
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

entity MUX_RF_Instr is
    Port ( inMuxRF1 : in  STD_LOGIC_VECTOR(4 downto 0);
           inMuxRF2 : in  STD_LOGIC_VECTOR(4 downto 0);
           select2 : in  STD_LOGIC;
           outMuxRF : out  STD_LOGIC_VECTOR(4 downto 0));
end MUX_RF_Instr;

architecture Behavioral of MUX_RF_Instr is

begin
process (inMuxRF1,inMuxRF2,select2)
begin
   case select2 is
				when '0' => outMuxRF <= inMuxRF1; --auto einai gia Instr(15-11)
				when '1' => outMuxRF <= inMuxRF2; --auto einai gia Instr(20-16)
				when others => outMuxRF <= inMuxRF2;
	end case;
end process;






end Behavioral;

