----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:15 05/07/2018 
-- Design Name: 
-- Module Name:    FORWARD_UNIT - Behavioral 
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

entity FORWARD_UNIT is
    Port ( opcode_DEC_EX : in  STD_LOGIC_VECTOR(5 downto 0);
           rs_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rt_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rf_re_EX_MEM : in  STD_LOGIC;
           rd_EX_MEM : in  STD_LOGIC_VECTOR(4 downto 0);
           rf_re_MEM_WB : in  STD_LOGIC;
           rd_MEM_WB : in  STD_LOGIC_VECTOR(4 downto 0);
           FWB : out  STD_LOGIC_VECTOR(1 downto 0);
           FWA : out  STD_LOGIC_VECTOR(1 downto 0));
end FORWARD_UNIT;

architecture Behavioral of FORWARD_UNIT is

--begin
--process(rf_re_EX_MEM,rd_EX_MEM,rs_DEC_EX)
--begin
--	if rf_re_EX_MEM='1' AND  rd_EX_MEM =rs_DEC_EX then
--		FWA <= '0';   
--	else
--		FWA <= '1';
--	end if;
--end process;
--
--process(rf_re_EX_MEM,rd_EX_MEM,rt_DEC_EX)
--begin
--	if rf_re_EX_MEM='1' AND  rd_EX_MEM = rt_DEC_EX then
--		FWB <= '0';
--	else
--		FWB <= '1';
--	end if;
--end process;

BEGIN

process(rf_re_EX_MEM,rd_EX_MEM,rs_DEC_EX,rf_re_MEM_WB,rd_MEM_WB,rs_DEC_EX,rt_DEC_EX,rt_DEC_EX)
begin
	if rf_re_EX_MEM='1' AND  rd_EX_MEM =rs_DEC_EX then
		FWA <= "10";   --'0'
	elsif rf_re_MEM_WB='1' AND  rd_MEM_WB =rs_DEC_EX then
		FWA <= "01";   --'0'
	else
		FWA <= "00"; --'1';--
	end if;

--process(rf_re_EX_MEM,rd_EX_MEM,rt_DEC_EX,rf_re_MEM_WB,rd_MEM_WB,rt_DEC_EX)

	if rf_re_EX_MEM='1' AND  rd_EX_MEM = rt_DEC_EX then
		FWB <= "10";   --'0'
	elsif rf_re_MEM_WB='1' AND  rd_MEM_WB =rt_DEC_EX then
		FWB <= "01";   --'0'
	else
		FWB <= "00"; --'1';--
	end if;
end process;
end Behavioral;
