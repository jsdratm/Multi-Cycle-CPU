library ieee;
use ieee.std_logic_1164.all;

entity thirtyone is
	port(
		output : out std_logic_vector(4 downto 0));
end thirtyone;

architecture behavioral of thirtyone is
begin
output <= "11111";
end behavioral;
