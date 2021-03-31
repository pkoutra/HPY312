----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:52 03/11/2018 
-- Design Name: 
-- Module Name:    MUX_pre_ALU - Behavioral 
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

entity MUX_pre_ALU is
    Port ( RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           MUX_pre_ALU_out : out  STD_LOGIC_VECTOR(31 downto 0));
end MUX_pre_ALU;

architecture Behavioral of MUX_pre_ALU is

begin
process (RF_B,Immed,ALU_Bin_sel)
begin
   case ALU_Bin_sel is
				when '0' => MUX_pre_ALU_out <= RF_B;  
				when '1' => MUX_pre_ALU_out <= Immed; 
				when others => MUX_pre_ALU_out <= RF_B;
	end case;
end process;

end Behavioral;

