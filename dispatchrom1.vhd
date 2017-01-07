library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY dispatchrom1 IS
	port(indata : in std_logic_vector(5 downto 0);
		 outdata : out std_logic_vector(4 downto 0));		
END dispatchrom1;

architecture behavioral of dispatchrom1 is
begin
	process(indata)
	variable temp: std_logic_vector(4 downto 0);
	begin
	case indata is
		when "000000" =>
			temp := "00110";
		when "100011" =>
			temp := "00010";
		when "101011" =>
			temp := "00010";
		when "000010" =>
			temp := "01001";
		when "000100" =>
			temp := "01000";
		when "001000" =>
			temp := "01100";
		when "000011" =>
			temp := "01011";
		when others =>
			temp := "00000";
	end case;
	outdata <= temp;
	end process;
end behavioral;

