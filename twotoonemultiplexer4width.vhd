library ieee;
use ieee.std_logic_1164.all;
--
--
entity twotoonemultiplexer4width is
	port(a,b:in std_logic_vector(3 downto 0);
		s:in std_logic;
		outdata:out std_logic_vector(3 downto 0));
	end twotoonemultiplexer4width;
architecture structural of twotoonemultiplexer4width is
begin
	with s select
	outdata <=	a when '0',
				b when '1',
				b when others;
end structural;
