library ieee;
use ieee.std_logic_1164.all;

entity onesinglebit is
	port(
		output : out std_logic);
end onesinglebit;

architecture behavioral of onesinglebit is
begin
output <= '1';
end behavioral;
