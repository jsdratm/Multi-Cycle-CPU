library ieee;
use ieee.std_logic_1164.all;

entity oneeightbits is
	port(
		output : out std_logic_vector(7 downto 0));
end oneeightbits;

architecture behavioral of oneeightbits is
begin
output <= "00000001";
end behavioral;
