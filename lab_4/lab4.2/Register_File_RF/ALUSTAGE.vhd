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
			  dataFromRAM : in  STD_LOGIC_VECTOR(31 downto 0);
			  dataFromReg : in  STD_LOGIC_VECTOR(31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR(2 downto 0);
			 -- ALU_preBin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR(31 downto 0);
			  Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALUSTAGE;

architecture Behavioral of ALUSTAGE is

--component MUX_pre_ALU is
--    Port ( RF_B : in  STD_LOGIC_VECTOR(31 downto 0);
--           Immed : in  STD_LOGIC_VECTOR(31 downto 0);
--			  fromRegB: in  STD_LOGIC_VECTOR(31 downto 0);
--			  fromRamData: in  STD_LOGIC_VECTOR(31 downto 0);
--           ALU_Bin_sel : in  STD_LOGIC_VECTOR(1 downto 0);
--           MUX_pre_ALU_out : out  STD_LOGIC_VECTOR(31 downto 0));
--end component;


	COMPONENT MUX_pre_ALU
	PORT(
		RF_B : IN std_logic_vector(31 downto 0);
		Immed : IN std_logic_vector(31 downto 0);
		fromRegB : IN std_logic_vector(31 downto 0);
		fromRamData : IN std_logic_vector(31 downto 0);
		ALU_Bin_sel : IN std_logic_vector(2 downto 0);
		Zero32 : IN std_logic_vector(31 downto 0);          
		MUX_pre_ALU_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           OutALU : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

--component MUX_2_to_1 is
--    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
--           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
--           sel : in  STD_LOGIC;
--           output : out  STD_LOGIC_VECTOR (31 downto 0));
--end component;

signal tempMUX_pre,outPreBin: STD_LOGIC_VECTOR(31 downto 0);
begin

--muxZeroOrOut2 : MUX_2_to_1  Port map( input1 => RF_B,
--												  input2 =>"00000000000000000000000000000000",
--												  sel => ALU_preBin_sel,
--												  output => outPreBin);
--
--MUX_PR_ALU : MUX_pre_ALU Port Map  (RF_B =>outPreBin,
--												Immed =>Immed,
--												fromRegB => dataFromReg,
--												fromRamData => dataFromRAM,
--												ALU_Bin_sel =>ALU_Bin_sel,
--												MUX_pre_ALU_out=> tempMUX_pre);
--												
--												

Inst_MUX_pre_ALU: MUX_pre_ALU PORT MAP(
		RF_B => RF_B,
		Immed => Immed,
		fromRegB => dataFromReg ,
		fromRamData => dataFromRAM,
		ALU_Bin_sel => ALU_Bin_sel,
		Zero32 => "00000000000000000000000000000000" ,
		MUX_pre_ALU_out => tempMUX_pre
	);


ALU_mod : ALU Port Map(A =>RF_A,
							  B =>tempMUX_pre,
							  Op =>ALU_func,
							  OutALU=>ALU_out,
							  Zero =>Zero,
							  Cout =>Cout,
							  Ovf =>Ovf);
end Behavioral;

