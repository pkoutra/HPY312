----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:07 03/08/2018 
-- Design Name: 
-- Module Name:    PC_Register - Behavioral 
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
use std.textio.all;
use ieee.std_logic_textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_Register is
    Port ( dataIN : in  STD_LOGIC_VECTOR(31 downto 0);
           Load : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR(31 downto 0));
end PC_Register;

architecture Behavioral of PC_Register is
signal Qtemp : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";

begin
 process (Clk,Reset,Load)
    begin
        if (Clk'event and Clk='1') then
				if ( Reset = '0') then
					if (Load='1') then 
						 dataOut<=dataIN;
						 Qtemp <= dataIN;
					else
						 dataOut<=Qtemp;
					end if;	
				else
					dataOut <= "00000000000000000000000000000000";
					Qtemp <= "00000000000000000000000000000000";
				end if;	
        end if;
    end process;
--process (Clk,Reset,Load)
--begin
--   if Reset='1' then   
--      dataOut <= "00000000000000000000000000000000";
--		Qtemp <= "00000000000000000000000000000000";
--   elsif (Clk'event and Clk='1') then 
--      if (Load='1') then 
--						 dataOut<=dataIN;
--						 Qtemp <= dataIN;
--					else
--						 dataOut<=Qtemp;
--					end if;	 
--   end if;
--end process;
 
end Behavioral;



						
