
-- VHDL Instantiation Created from source file mux4to1.vhd -- 17:12:12 04/22/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux4to1
	PORT(
		in0 : IN std_logic_vector(31 downto 0);
		in1 : IN std_logic_vector(31 downto 0);
		in2 : IN std_logic_vector(31 downto 0);
		in3 : IN std_logic_vector(31 downto 0);
		sel4to1 : IN std_logic_vector(1 downto 0);          
		out_4_to_1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_mux4to1: mux4to1 PORT MAP(
		in0 => ,
		in1 => ,
		in2 => ,
		in3 => ,
		sel4to1 => ,
		out_4_to_1 => 
	);


