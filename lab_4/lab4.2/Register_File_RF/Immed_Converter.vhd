----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:28 03/09/2018 
-- Design Name: 
-- Module Name:    Immed_Converter - Behavioral 
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

entity Immed_Converter is
    Port ( InstrImmed : in  STD_LOGIC_VECTOR(15 downto 0);
			  InstrOp : in STD_LOGIC_VECTOR(5 downto 0);
           OutImmed : out  STD_LOGIC_VECTOR(31 downto 0));
end Immed_Converter;

architecture Behavioral of Immed_Converter is
signal temp : STD_LOGIC_VECTOR(31 downto 0);
begin


process(InstrOp,InstrImmed)
		begin
   
          if ((InstrOp="111000" )OR (InstrOp="110000")  OR( InstrOp="000111") OR( InstrOp="001111") OR( InstrOp= "011111") OR ( InstrOp= "000011") OR ( InstrOp= "011100") OR ( InstrOp= "011110")  )then
					for i in 31 downto 16 loop
						OutImmed(i) <=InstrImmed(15);    ---sign extend
					end loop;
					OutImmed(15 downto 0) <=InstrImmed;
					
          elsif (InstrOp= "111001" )then -- shift left zero fill
					OutImmed(31 downto 16) <=InstrImmed;
					OutImmed(15 downto 0) <="0000000000000000";
					
          elsif ((InstrOp = "110010") OR  (InstrOp = "110011" ))then  --zero fill
					OutImmed(31 downto 16) <="0000000000000000";
					OutImmed(15 downto 0) <=InstrImmed;
					
          elsif ((InstrOp ="111111" )OR (InstrOp = "000000") OR (InstrOp = "000001" ))then
--					for i in 31 downto 16 loop
--						temp(i) <=InstrImmed(15);
--					end loop;
--					temp(15 downto 0) <=InstrImmed;
--					OutImmed(31 downto 2) <=temp(29 downto 0);
--					OutImmed(1 downto 0) <="00";
--				
					for i in 31 downto 16 loop
						OutImmed(i) <=InstrImmed(15);
					end loop;
					OutImmed(17 downto 2) <=InstrImmed;
			
					OutImmed(1 downto 0) <="00";
					
				elsif InstrOp = "110001" then
							OutImmed(31 downto 16) <="0000000000000000";
							OutImmed(15 downto 0) <=InstrImmed;
            else 
							OutImmed <="00000000000000000000000000000000";
							

				end if;
   
end process;



end Behavioral;


		


