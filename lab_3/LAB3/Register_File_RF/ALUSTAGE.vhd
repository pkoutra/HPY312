----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:25 03/09/2018 
-- Design Name: 
-- Module Name:    ALUSTAGE - Behavioral 
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

entity ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR(31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR(31 downto 0);
			  Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALUSTAGE;

architecture Behavioral of ALUSTAGE is

component MUX_pre_ALU is
    Port ( RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           MUX_pre_ALU_out : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           OutALU : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;
signal tempMUX_pre: STD_LOGIC_VECTOR(31 downto 0);
begin

MUX_PR_ALU : MUX_pre_ALU Port Map(RF_B =>RF_B,
										     Immed =>Immed,
										     ALU_Bin_sel =>ALU_Bin_sel,
										     MUX_pre_ALU_out=> tempMUX_pre);


ALU_mod : ALU Port Map(A =>RF_A,
							  B =>tempMUX_pre,
							  Op =>ALU_func,
							  OutALU=>ALU_out,
							  Zero =>Zero,
							  Cout =>Cout,
							  Ovf =>Ovf);
end Behavioral;

