----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:50 03/05/2018 
-- Design Name: 
-- Module Name:    ALU_operation - Behavioral 
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


entity ALU_operation is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           Op : in  STD_LOGIC_VECTOR(3 downto 0);
           OutOperation : out  STD_LOGIC_VECTOR(31 downto 0));
end ALU_operation;

architecture Behavioral of ALU_operation is

begin
process (A,B,Op)
begin
   case Op is
      when "0000" => OutOperation <= A + B;
      when "0001" => OutOperation <= A - B;
      when "0010" => OutOperation <= A NAND B;
      when "0011" => OutOperation <= A OR B;
      when "0100" => OutOperation <= NOT A;
      when "1000" => OutOperation(31) <= A(31);
			for i in 30 downto 0 loop
				OutOperation(i)<= A(i+1);
			end loop;
      when "1010" => OutOperation(31) <='0';--auto k to epomeno einai allagmena
			for i in 30 downto 0 loop
				OutOperation(i)<= A(i+1) ;
			end loop;
      when "1001" => OutOperation(0) <= '0';
			for i in 31 downto 1 loop
				OutOperation(i) <= A(i-1) ;
			end loop;
		when "1100" => OutOperation(0) <= A(31);
			for i in 0 to 30 loop
				OutOperation(i+1) <= A(i);
			end loop;
		when "1101" => OutOperation(31) <= A(0);
			for i in 31 downto 1 loop
				OutOperation(i-1) <= A(i);
			end loop;
      when others => OutOperation <= "00000000000000000000000000000000";
   end case;
end process;



end Behavioral;

