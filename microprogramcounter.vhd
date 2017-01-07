-- behavioral version of ROM implementation
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--
--
entity microprogramcounter is
port
	(
	clock: in std_logic;
	writedata: in std_logic_vector(4 downto 0);
	outdata: out std_logic_vector(4 downto 0));
end microprogramcounter;
--
--
architecture behavioral of microprogramcounter is
	signal mem: std_logic_vector(4 downto 0);
begin

read: process
begin
outdata <= mem;
end process;

write: process(clock)
	begin
		wait until rising_edge(clock);
			mem <= writedata;
	end process;
end behavioral;
