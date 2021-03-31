
-- VHDL Instantiation Created from source file FORWARD_UNIT.vhd -- 09:43:00 05/08/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT FORWARD_UNIT
	PORT(
		opcode_DEC_EX : IN std_logic_vector(5 downto 0);
		rs_DEC_EX : IN std_logic_vector(4 downto 0);
		rt_DEC_EX : IN std_logic_vector(4 downto 0);
		rf_re_EX_MEM : IN std_logic;
		rd_EX_MEM : IN std_logic_vector(4 downto 0);
		rf_re_MEM_WB : IN std_logic;
		rd_MEM_WB : IN std_logic_vector(4 downto 0);          
		FWA : OUT std_logic;
		FWB : OUT std_logic
		);
	END COMPONENT;

	Inst_FORWARD_UNIT: FORWARD_UNIT PORT MAP(
		opcode_DEC_EX => ,
		rs_DEC_EX => ,
		rt_DEC_EX => ,
		rf_re_EX_MEM => ,
		rd_EX_MEM => ,
		rf_re_MEM_WB => ,
		rd_MEM_WB => ,
		FWA => ,
		FWB => 
	);


