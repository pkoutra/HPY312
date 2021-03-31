----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:09 03/11/2018 
-- Design Name: 
-- Module Name:    MEMSTAGE - Behavioral 
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

entity MEMSTAGE is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR(31 downto 0));
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is

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

signal memOut : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
signal addrOfdata : std_logic_vector(31 downto 0);

begin
addrOfdata <= (ALU_MEM_Addr +  "00000000000000000001000000000000");

myRAM :RAM  port map (
						 clk => Clk,
						 inst_addr => "00000000000",
						 inst_dout =>memOut,
						 data_we => Mem_WrEn,
						 data_addr=> addrOfdata(12 downto 2) ,
						 data_din => MEM_DataIn,
						 data_dout=> MEM_DataOut);

end Behavioral;

