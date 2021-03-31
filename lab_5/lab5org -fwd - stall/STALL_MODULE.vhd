----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:39 05/08/2018 
-- Design Name: 
-- Module Name:    STALL_MODULE - Behavioral 
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

entity STALL_MODULE is
    Port ( opcode_DEC_EX : in  STD_LOGIC_VECTOR(5 downto 0);
           rt_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rs_DEC_EX : in  STD_LOGIC_VECTOR(4 downto 0);
           rd_EX_MEM : in  STD_LOGIC_VECTOR(4 downto 0);
           out_WE_stall : out  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC);
end STALL_MODULE;

architecture Behavioral of STALL_MODULE is
type state_type is (stall, normal);
signal state,next_state : state_type;


begin
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (reset = '1') then
           state <= normal;        
         else
            state <= next_state;
       --     <output> <= <output>_i;
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;

 OUTPUT_DECODE: process (state,opcode_DEC_EX,rs_DEC_EX,rd_EX_MEM,rt_DEC_EX)
   begin
		if state=normal then
			if opcode_DEC_EX ="001111" then
				if ((rs_DEC_EX=rd_EX_MEM) OR (rt_DEC_EX=rd_EX_MEM)) then
					out_WE_stall<='0';
					next_state <= stall;
				else
					out_WE_stall<='1';
					next_state<=normal;
				end if;
			else
					out_WE_stall<='1';
					next_state<=normal;
			end if;
		elsif state= stall then
			out_WE_stall<='1';
			next_state<=normal;
		else
			out_WE_stall<='1';
			next_state<=normal;
		end if;
	end process;
			

--begin
--process(opcode_DEC_EX,rs_DEC_EX,rd_EX_MEM,rt_DEC_EX)
--begin
--if opcode_DEC_EX ="001111" then
--	if rs_DEC_EX=rd_EX_MEM OR rt_DEC_EX=rd_EX_MEM then
--		out_WE_stall<='0';
--	else
--		out_WE_stall<='1';
--	end if;
--end if;
--end process;
end Behavioral;

