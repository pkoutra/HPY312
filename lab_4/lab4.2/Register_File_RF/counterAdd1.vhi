
-- VHDL Instantiation Created from source file counterAdd1.vhd -- 11:55:57 04/23/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counterAdd1
	PORT(
		counterAddEn : IN std_logic;          
		outCounterAdd1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_counterAdd1: counterAdd1 PORT MAP(
		outCounterAdd1 => ,
		counterAddEn => 
	);


