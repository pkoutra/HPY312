----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:39 03/11/2018 
-- Design Name: 
-- Module Name:    MEMIF - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMIF is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR(31 downto 0);
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR(31 downto 0));
end MEMIF;

architecture Behavioral of MEMIF is

component IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR(31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MEMSTAGE is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR(31 downto 0));
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

signal tempInstr,tempData,tempALU_MEM_Addr : std_logic_vector(31 downto 0);
signal wordInstArd,wordInstArdResize : std_logic_vector(31 downto 0);
begin
--
--instrMem : IFSTAGE Port Map (PC_Immed => PC_Immed,
--									 	 PC_sel => PC_sel,
--									 	 PC_LdEn => PC_LdEn,
--									 	 Reset => Reset,
--									 	 Clk => Clk,
--									  	 Instr => tempInstr);
--									  
--tempALU_MEM_Addr <=	ALU_MEM_Addr + "00000000000000000000010000000000";		
--						  
--dataMem : MEMSTAGE Port Map ( clk => Clk,
--										  Mem_WrEn=> Mem_WrEn,
--										  ALU_MEM_Addr => tempALU_MEM_Addr,
--										  MEM_DataIn => MEM_DataIn,
--										  MEM_DataOut => tempData);
--
--
--wordInstArd <= Instr;
--
--Memory : RAM port map (  clk => Clk,
--								 inst_addr => tempInstr(10 downto 0),
--								 inst_dout => Instr,
--								 data_we => Mem_WrEn,
--								 data_addr => tempALU_MEM_Addr(10 downto 0),
--								 data_din => MEM_DataIn,
--								 data_dout => MEM_DataOut);
								
end Behavioral;

