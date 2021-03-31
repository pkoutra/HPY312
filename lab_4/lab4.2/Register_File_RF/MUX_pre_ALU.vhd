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
			  fromRegB: in  STD_LOGIC_VECTOR(31 downto 0);
			  fromRamData: in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR(2 downto 0);
			  Zero32 :  in  STD_LOGIC_VECTOR(31 downto 0);
           MUX_pre_ALU_out : out  STD_LOGIC_VECTOR(31 downto 0));
end MUX_pre_ALU;

architecture Behavioral of MUX_pre_ALU is
 

begin
 
process (RF_B,Immed,ALU_Bin_sel,fromRegB,fromRamData,Zero32)
begin
   case ALU_Bin_sel is
				when "000" => MUX_pre_ALU_out <= RF_B;  
				when "001" => MUX_pre_ALU_out <= Immed; 
				when "010" => MUX_pre_ALU_out <= fromRegB;
				when "011" => MUX_pre_ALU_out <= fromRamData;
				when "111" => MUX_pre_ALU_out <= Zero32;
				when others => MUX_pre_ALU_out <= RF_B;
	end case;
		
end process;

end Behavioral;

