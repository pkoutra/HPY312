----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:55 03/05/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           OutALU : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component ALU_operation is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           Op : in  STD_LOGIC_VECTOR(3 downto 0);
           OutOperation : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component ALU_Outputs is
    Port ( resultOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  AOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  BOp : in  STD_LOGIC_VECTOR(31 downto 0);
			  codeOp : in STD_LOGIC_VECTOR(3 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;


signal h1 :STD_LOGIC_VECTOR(31 downto 0);
begin

Operation : ALU_operation Port Map(A =>A,
											  B =>B,
											  Op => Op,
											  OutOperation =>h1);
											  
Outputs : 	ALU_Outputs Port Map(resultOp=> h1,
										   AOp => A,
											BOp => B,
											codeOp=>Op,
											Zero=>Zero,
											Cout=>Cout,
											Ovf=>Ovf);

OutALU <=h1;

end Behavioral;

