library ieee;
use ieee.std_logic_1164.all;
--
--
entity fourtoonemultiplexer5width is
	port(a,b,c,d:in std_logic_vector(4 downto 0);
		s:in std_logic_vector(1 downto 0);
		outdata:out std_logic_vector(4 downto 0));
	end fourtoonemultiplexer5width;
architecture structural of fourtoonemultiplexer5width is
begin
	with s select
	outdata <=	a when "00",
				b when "01",
				c when "10",
				d when "11",
				b when others;
end structural;
