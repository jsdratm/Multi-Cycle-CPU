library ieee;
use ieee.std_logic_1164.all;
--
--
entity eto32 is
	port(a:in std_logic_vector(7 downto 0);
		outdata:out std_logic_vector(31 downto 0));
	end eto32;
architecture structural of eto32 is
begin
		outdata(7 downto 0) <= a(7 downto 0);
		outdata(31 downto 8) <= "000000000000000000000000";
end structural;
