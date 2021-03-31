----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:57 03/05/2018 
-- Design Name: 
-- Module Name:    ALU_Outputs - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU_Outputs is
    Port ( resultOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  AOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  BOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  codeOp : in STD_LOGIC_VECTOR(3 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU_Outputs;

architecture Behavioral of ALU_Outputs is


begin

process (resultOp,AOp,BOp,codeOp)
	begin
		case codeOp is 
			when "0000" =>  
					if (((AOp(31) AND BOp(31))='1') OR ((((AOp(31) XOR BOp(31))='1') AND (resultOp(31)='0')))) then
							Cout <='1';
					else
							Cout <='0';
					end if;
					
					if (AOp(31)='1') AND (BOp(31)='1') then
							if (resultOp(31)='0') then
								Ovf <= '1';
							else 
								Ovf <='0';
							end if;
					elsif (AOp(31)='0') AND (BOp(31)='0') then
							if (resultOp(31)='1') then
								Ovf <= '1';
							else 
								Ovf <='0';
							end if;
					else 
							Ovf <='0';
					end if;
					
					if( resultOp = "00000000000000000000000000000000" ) then 
							Zero <= '1';
					else
							Zero <= '0';
					end if;
						
						
			when "0001" => 
					if ((AOp(31) XOR BOp(31))='0') then
						Cout <=resultOp(31);
					else
						if (AOp(31)='1') then
							Cout <='0';
						else
							Cout <='1';
						end if;
					end if;
				
				--	if (AOp(31)='1') AND (BOp(31)='1') then 
					if (AOp(31)='0') AND (BOp(31)='1') then 
						if (resultOp(31)='1') then
							Ovf <= '1';
						else 
							Ovf <='0';
						end if;
				--	elsif (AOp(31)='0') AND (BOp(31)='0') then
					elsif (AOp(31)='1') AND (BOp(31)='0') then
						if (resultOp(31)='0') then
							Ovf <= '1';
						else 
							Ovf <='0';
						end if;
					else 
						Ovf <='0';
					end if;
					if( resultOp = "00000000000000000000000000000000" ) then 
						Zero <= '1';
					else
						Zero <= '0';
					end  if;
				
			when others => Ovf <= '0';
								Cout <= '0';
								Zero <= '0';	
								
				
				end case;
	end process;	


end Behavioral;

