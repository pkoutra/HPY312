----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:36 03/08/2018 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  PC_out : out  STD_LOGIC_VECTOR(31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is

component incrementorImmed is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           incrValue : in  STD_LOGIC_VECTOR(31 downto 0);
           incrImmedOut : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component Incrementor is
    Port ( incIn : in  STD_LOGIC_VECTOR( 31 downto 0);
           incOut : out  STD_LOGIC_VECTOR( 31 downto 0));
			  
end component;

component muxPC is
    Port ( pcFour : in  STD_LOGIC_VECTOR(31 downto 0);
           pcImmed : in  STD_LOGIC_VECTOR(31 downto 0);
			  PC_Sel : in  STD_LOGIC;
           muxPCout : out  STD_LOGIC_VECTOR(31 downto 0));
end component;


component PC_Register is
    Port ( dataIN : in  STD_LOGIC_VECTOR(31 downto 0);
           Load : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR(31 downto 0));
end component;



--signal temp ,temp2, temp3, muxTemp: STD_LOGIC_VECTOR(31 downto 0);
signal inReg, addFour,addImmed,outReg:  STD_LOGIC_VECTOR(31 downto 0);
begin

								
PC_reg : PC_Register Port Map(dataIN =>inReg,
									   Load =>PC_LdEn,
									   Clk =>Clk,
									   Reset=> Reset, 
									   dataOut => outReg);
										

Incrementor4 : Incrementor Port Map
						( incIn => outReg,
						  incOut => addFour ); 
						  
IncrementorIm : incrementorImmed Port Map(PC_Immed =>PC_Immed,
														incrValue =>addFour,  
														incrImmedOut=> addImmed);
														
MUX_PC : muxPC Port Map(pcFour =>addFour,
								pcImmed =>addImmed,
								PC_Sel =>PC_Sel,
								muxPCout => inReg);
																		
PC_out <= outReg;
			  
end Behavioral;

