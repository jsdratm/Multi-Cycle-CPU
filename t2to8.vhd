library ieee;
use ieee.std_logic_1164.all;
--
--
entity t2to8 is
	port(a:in std_logic_vector(31 downto 0);
		outdata:out std_logic_vector(7 downto 0));
	end t2to8;
architecture structural of t2to8 is
begin
		outdata(7 downto 0) <= a(7 downto 0);
end structural;
