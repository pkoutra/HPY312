
-- VHDL Instantiation Created from source file mux4to1.vhd -- 10:47:57 05/08/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux4to1
	PORT(
		IN1 : IN std_logic_vector(31 downto 0);
		IN2 : IN std_logic_vector(31 downto 0);
		IN3 : IN std_logic_vector(31 downto 0);
		IN4 : IN std_logic_vector(31 downto 0);
		SELECTOR : IN std_logic_vector(1 downto 0);          
		OUTmux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_mux4to1: mux4to1 PORT MAP(
		IN1 => ,
		IN2 => ,
		IN3 => ,
		IN4 => ,
		SELECTOR => ,
		OUTmux => 
	);


