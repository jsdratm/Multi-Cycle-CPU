library ieee;
use ieee.std_logic_1164.all;
--
--
entity twotoonemultiplexer8width is
	port(a,b:in std_logic_vector(7 downto 0);
		s:in std_logic;
		outdata:out std_logic_vector(7 downto 0));
	end twotoonemultiplexer8width;
architecture structural of twotoonemultiplexer8width is
begin
	with s select
	outdata <=	a when '0',
				b when '1',
				b when others;
end structural;
