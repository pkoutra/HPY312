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
			  ALU_Ain_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR(3 downto 0);
			  resFromALU : in  STD_LOGIC_VECTOR(31 downto 0);
			  reALUwb : in  STD_LOGIC_VECTOR(31 downto 0);-----
  			  FWBsel : in STD_LOGIC_VECTOR(1 downto 0);
			  FWAsel : in STD_LOGIC_VECTOR(1 downto 0);
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

component mux2_to_1_proc is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           C : out  STD_LOGIC_VECTOR(31 downto 0);
           select_proc : in  STD_LOGIC);
end component;

component mux4to1 is
    Port ( IN1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN3 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN4 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           SELECTOR : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           OUTmux : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

signal tempMUX_pre,temp_MUX_ALU_A,telesteosA,telesteosB: STD_LOGIC_VECTOR(31 downto 0);
begin

MUX_PR_ALU : MUX_pre_ALU Port Map( RF_B =>RF_B,
										     Immed =>Immed,
										     ALU_Bin_sel =>ALU_Bin_sel,
										     MUX_pre_ALU_out=> tempMUX_pre);

InstFWDB_mux4to1: mux4to1 PORT MAP(
		IN1 => tempMUX_pre ,
		IN2 => reALUwb ,
		IN3 => resFromALU,
		IN4 => tempMUX_pre ,
		SELECTOR =>  FWBsel,
		OUTmux => telesteosB
	);

														 
--MUX_pre_ALU_B_FWD:mux2_to_1_proc Port Map( 
--														 A =>resFromALU , 
--											 	       B =>tempMUX_pre,
--														 C =>telesteosB,
--														 select_proc =>FWBsel); --na mbei sto alu stage


ALU_mod : ALU Port Map(A =>telesteosA,
							  B =>telesteosB,
							--  A =>temp_MUX_ALU_A,
							  --B =>tempMUX_pre,
							  Op =>ALU_func,
							  OutALU=>ALU_out,
							  Zero =>Zero,
							  Cout =>Cout,
							  Ovf =>Ovf);
							  
MUX_pre_ALU_A :mux2_to_1_proc Port Map(    A =>RF_A,
											 	       B =>"00000000000000000000000000000000",
														 C =>temp_MUX_ALU_A,
														 select_proc =>ALU_Ain_sel);


InstFWDA_mux4to1: mux4to1 PORT MAP(
		IN1 => temp_MUX_ALU_A ,
		IN2 => reALUwb ,
		IN3 => resFromALU,
		IN4 => temp_MUX_ALU_A ,
		SELECTOR =>  FWAsel,
		OUTmux => telesteosA
	);
--														 
--MUX_pre_ALU_A_FWD:mux2_to_1_proc Port Map( A =>resFromALU,
--											 	       B =>temp_MUX_ALU_A,
--														 C =>telesteosA,
--														 select_proc =>FWAsel); --na mbei sto alu stage
end Behavioral;

