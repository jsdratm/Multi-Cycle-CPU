library ieee;
use ieee.std_logic_1164.all;

entity one2bits is
	port(
		output : out std_logic_vector(1 downto 0));
end one2bits;

architecture behavioral of one2bits is
begin
output <= "01";
end behavioral;
