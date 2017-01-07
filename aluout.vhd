-- behavioral version of ROM implementation
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--
--
entity aluout is
port
	(
	clock: in std_logic;
	pcwrite: in std_logic;
	writedata: in std_logic_vector(7 downto 0);
	outdata: out std_logic_vector(7 downto 0));
end aluout;
--
--
architecture behavioral of aluout is
	signal mem: std_logic_vector(7 downto 0);
begin

read: process
begin
outdata <= mem;
end process;



write: process(clock)
	begin
		wait until rising_edge(clock);
		if pcwrite = '1' then
		mem <= writedata;
		end if;
	end process;
end behavioral;
