library ieee;
use ieee.std_logic_1164.all;
--
--
entity twotoonemultiplexer5width is
	port(a,b:in std_logic_vector(4 downto 0);
		s:in std_logic;
		outdata:out std_logic_vector(4 downto 0));
	end twotoonemultiplexer5width;
architecture structural of twotoonemultiplexer5width is
begin
	with s select
	outdata <=	a when '0',
				b when '1',
				b when others;
end structural;
