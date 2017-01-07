library ieee;
use ieee.std_logic_1164.all;

entity zerofivebits is
	port(
		output : out std_logic_vector(4 downto 0));
end zerofivebits;

architecture behavioral of zerofivebits is
begin
output <= "00000";
end behavioral;
