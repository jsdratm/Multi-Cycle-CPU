library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
--
--
entity fivebitadder is
	port(indata:in std_logic_vector(4 downto 0);
		outdata:out std_logic_vector(4 downto 0));
	end fivebitadder;
architecture structural of fivebitadder is
begin
process
variable temp: std_logic_vector(4 downto 0);
begin
		temp := indata + "00001";
		outdata <= temp;
end process;
end structural;
