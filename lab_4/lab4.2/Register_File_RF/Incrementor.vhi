
-- VHDL Instantiation Created from source file Incrementor.vhd -- 21:23:00 03/12/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Incrementor
	PORT(
		incIn : IN std_logic_vector(31 downto 0);          
		incOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Incrementor: Incrementor PORT MAP(
		incIn => ,
		incOut => 
	);


