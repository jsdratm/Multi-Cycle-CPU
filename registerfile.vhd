-- behavioral version of ROM implementation
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--
--
entity registerfile is
port
	(
	clock: in std_logic;
	regwrite: in std_logic;
	writedata: in std_logic_vector(7 downto 0);
	readdata1,readdata2: out std_logic_vector(7 downto 0);
	readaddr1,readaddr2,writeaddr: in std_logic_vector(4 downto 0)
);
end registerfile;
--
--
architecture behavioral of registerfile is
	type mem_array is array(0 to 31) of std_logic_vector(7 downto 0);
	signal mem: mem_array;
	signal index1,index2,index3 : integer range 0 to 31;
begin
index1 <= conv_integer( readaddr1(4 downto 0));
index2 <= conv_integer( readaddr2(4 downto 0));
index3 <= conv_integer( writeaddr(4 downto 0));

read: process
begin
if readaddr1 = "00000" then
readdata1 <= "00000000";
else
readdata1 <= mem(index1);
end if;

if readaddr2 = "00000" then
readdata2 <= "00000000";
else
readdata2 <= mem(index2);
end if;
end process;



write: process(clock)
	begin
		-- The conv_integer function is in the .std_logic_arith package
		-- Convert the address vector into an integer to access array element
		wait until rising_edge(clock);
		if regwrite = '1' then
		mem(index3) <= writedata;
		end if;
	end process;
end behavioral;
