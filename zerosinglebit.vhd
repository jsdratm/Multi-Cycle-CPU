library ieee;
use ieee.std_logic_1164.all;

entity zerosinglebit is
	port(
		output : out std_logic);
end zerosinglebit;

architecture behavioral of zerosinglebit is
begin
output <= '0';
end behavioral;
