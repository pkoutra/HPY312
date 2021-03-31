
-- VHDL Instantiation Created from source file MUX_pre_ALU.vhd -- 17:17:10 04/22/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_MUX_pre_ALU: MUX_pre_ALU PORT MAP(
		RF_B => ,
		Immed => ,
		fromRegB => ,
		fromRamData => ,
		ALU_Bin_sel => ,
		Zero32 => ,
		MUX_pre_ALU_out => 
	);


