----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:46 04/21/2018 
-- Design Name: 
-- Module Name:    addressCounter - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addressCounter is
    Port ( inAddress : in  STD_LOGIC_VECTOR( 31 downto 0);
           outAddress : out  STD_LOGIC_VECTOR( 31 downto 0);
           mc_addr_ldEn : in  STD_LOGIC;
           mc_addr4 : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  clk : in  STD_LOGIC);
end addressCounter;


architecture Behavioral of addressCounter is


component Incrementor is
    Port ( incIn : in  STD_LOGIC_VECTOR( 31 downto 0);
           incOut : out  STD_LOGIC_VECTOR( 31 downto 0));
			  
end component;

component MUX_2_to_1 is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0); --0
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);-- 1
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end component;

component Register_32 is
    Port ( CLK : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
			  reset: in STD_LOGIC;
           WE : in  STD_LOGIC);
end component;

signal tempSum,tempOutAddrMux,tempRegAddrOut :   STD_LOGIC_VECTOR (31 downto 0);

begin


muxAddress4 : MUX_2_to_1 Port Map (   input1 => inAddress,
												  input2 => tempSum,
												  sel => mc_addr4,
												  output => tempOutAddrMux);


regAddress4 : Register_32 Port map(   CLK => clk,
												  Data => tempOutAddrMux,
												  Dout => tempRegAddrOut,
												  reset=> reset,
												  WE=> mc_addr_ldEn);

regIncr4 : Incrementor Port map ( incIn => tempRegAddrOut,
											 incOut => tempSum);				

outAddress <= tempRegAddrOut;											 

end Behavioral;

