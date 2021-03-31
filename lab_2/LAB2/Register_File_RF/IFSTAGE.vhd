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
           Instr : out  STD_LOGIC_VECTOR(31 downto 0));
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

component RAM is
 port (
 clk : in std_logic;
 inst_addr : in std_logic_vector(10 downto 0);
 inst_dout : out std_logic_vector(31 downto 0);
 data_we : in std_logic;
 data_addr : in std_logic_vector(10 downto 0);
 data_din : in std_logic_vector(31 downto 0);
 data_dout : out std_logic_vector(31 downto 0));
 end component;

signal temp ,temp2, temp3, muxTemp: STD_LOGIC_VECTOR(31 downto 0);
signal ifOut : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
begin

Incrementor4 : Incrementor Port Map
						( incIn => temp,
						  incOut =>temp2 ); 
						  
IncrementorIm : incrementorImmed Port Map(PC_Immed =>PC_Immed,
														incrValue =>temp2,  
														incrImmedOut=> temp3);
														
MUX_PC : muxPC Port Map(pcFour =>temp2,
								pcImmed =>temp3,
								PC_Sel =>PC_Sel,
								muxPCout => muxTemp);
								
								
PC_reg : PC_Register Port Map(dataIN =>muxTemp,
									   Load =>PC_LdEn,
									   Clk =>Clk,
									   Reset=> Reset, 
									   dataOut => temp);
myRAM : RAM port map (
						 clk => Clk,
						 inst_addr => temp(12 downto 2),
						 inst_dout=> Instr,
						 data_we =>'0',
						 data_addr =>"00000000000",
						 data_din =>"00000000000000000000000000000000",
						 data_dout=> ifOut );
						 
			  
end Behavioral;

