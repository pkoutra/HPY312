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
    Port ( 
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR(31 downto 0);
			  select_for_in :in  STD_LOGIC;
			  select_for_out :in  STD_LOGIC;
           --MEM_DataIn : in  STD_LOGIC_VECTOR(31 downto 0);
			  InLSBTaker: in  STD_LOGIC_VECTOR(31 downto 0);--eisodos tou NEOU lsb kater
			  dataInForRAMout :out STD_LOGIC_VECTOR(31 downto 0);--exodos tou panw
           OutLSBTaker : in  STD_LOGIC_VECTOR(31 downto 0);-- eisoodos tou 2ou lsb taker
			  dataOutToRF :out  STD_LOGIC_VECTOR(31 downto 0);--exodos tou panw
			  ALU_MEM_Addr_out : out  STD_LOGIC_VECTOR(31 downto 0));
          -- MEM_DataIn_out : out  STD_LOGIC_VECTOR(31 downto 0));
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is

component mux2_to_1_proc is
    Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
           B : in  STD_LOGIC_VECTOR(31 downto 0);
           C : out  STD_LOGIC_VECTOR(31 downto 0);
           select_proc : in  STD_LOGIC);
end component;

component LSB_taker is
    Port ( in_LSB : in  STD_LOGIC_VECTOR(31 downto 0);
           out_LSB : out  STD_LOGIC_VECTOR(31 downto 0));
end component;


SIGNAL temp_out_LSB,temp_out2_lsb :STD_LOGIC_VECTOR(31 downto 0);
begin
ALU_MEM_Addr_out <= (ALU_MEM_Addr +  "00000000000000000001000000000000");
--MEM_DataIn_out<= MEM_DataIn;

muxDataIn : mux2_to_1_proc Port Map(A =>InLSBTaker,
											   B =>temp_out_LSB,
											   C =>dataInForRAMout,
											   select_proc=> select_for_in);

LSBTakerDIn :LSB_taker Port Map( in_LSB =>InLSBTaker,
											out_LSB=> temp_out_LSB);


muxDataOut : mux2_to_1_proc Port Map(A =>OutLSBTaker,
											   B =>temp_out2_lsb,
											   C =>dataOutToRF,
											   select_proc=> select_for_out);

LSBTakerDOut :LSB_taker Port Map( in_LSB =>OutLSBTaker,
											out_LSB=>temp_out2_lsb );
end Behavioral;

