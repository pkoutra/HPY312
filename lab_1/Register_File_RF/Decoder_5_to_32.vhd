----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:37:42 02/28/2018 
-- Design Name: 
-- Module Name:    Decoder_5_to_32 - Behavioral 
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

entity Decoder_5_to_32 is
    Port ( DecIn : in  STD_LOGIC_VECTOR(4 downto 0);
           DecOut : out  STD_LOGIC_VECTOR(31 downto 0));
end Decoder_5_to_32;

architecture Behavioral of Decoder_5_to_32 is

begin

	process(DecIn)
		begin
   
         case DecIn is
            when "00001" => DecOut <= "00000000000000000000000000000001";
            when "00010" => DecOut <= "00000000000000000000000000000010";
            when "00011" => DecOut <= "00000000000000000000000000000100";
            when "00100" => DecOut <= "00000000000000000000000000001000";
            when "00101" => DecOut <= "00000000000000000000000000010000";
            when "00110" => DecOut <= "00000000000000000000000000100000";
            when "00111" => DecOut <= "00000000000000000000000001000000";	
				when "01000" => DecOut <= "00000000000000000000000010000000";
            when "01001" => DecOut <= "00000000000000000000000100000000";
            when "01010" => DecOut <= "00000000000000000000001000000000";
            when "01011" => DecOut <= "00000000000000000000010000000000";
            when "01100" => DecOut <= "00000000000000000000100000000000";
            when "01101" => DecOut <= "00000000000000000001000000000000";
            when "01110" => DecOut <= "00000000000000000010000000000000";
            when "01111" => DecOut <= "00000000000000000100000000000000";
				when "10000" => DecOut <= "00000000000000001000000000000000";
            when "10001" => DecOut <= "00000000000000010000000000000000";
            when "10010" => DecOut <= "00000000000000100000000000000000";
            when "10011" => DecOut <= "00000000000001000000000000000000";
            when "10100" => DecOut <= "00000000000010000000000000000000";
            when "10101" => DecOut <= "00000000000100000000000000000000";
            when "10110" => DecOut <= "00000000001000000000000000000000";
            when "10111" => DecOut <= "00000000010000000000000000000000";	
				when "11000" => DecOut <= "00000000100000000000000000000000";
            when "11001" => DecOut <= "00000001000000000000000000000000";
            when "11010" => DecOut <= "00000010000000000000000000000000";
            when "11011" => DecOut <= "00000100000000000000000000000000";
            when "11100" => DecOut <= "00001000000000000000000000000000";
            when "11101" => DecOut <= "00010000000000000000000000000000";
            when "11110" => DecOut <= "00100000000000000000000000000000";
            when "11111" => DecOut <= "01000000000000000000000000000000";
				
            when others => DecOut <= "00000000000000000000000000000000";
         end case;
     end process;

 
end Behavioral;

