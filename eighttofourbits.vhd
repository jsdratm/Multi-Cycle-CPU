library ieee;
use ieee.std_logic_1164.all;
--
--
entity eighttofourbits is
	port(a:in std_logic_vector(7 downto 0);
		outdata:out std_logic_vector(3 downto 0));
	end eighttofourbits;
architecture structural of eighttofourbits is
begin
		outdata(3 downto 0) <= a(3 downto 0);
end structural;
