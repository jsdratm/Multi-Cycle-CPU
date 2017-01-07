library ieee;
use ieee.std_logic_1164.all;
--
--
entity fourtoeightbits is
	port(a:in std_logic_vector(3 downto 0);
		outdata:out std_logic_vector(7 downto 0));
	end fourtoeightbits;
architecture structural of fourtoeightbits is
begin
		outdata(7 downto 4) <= "0000";
		outdata(3 downto 0) <= a;
end structural;
