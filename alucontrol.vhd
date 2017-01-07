library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY alucontrol IS
	port(aluop : in std_logic_vector(1 downto 0);	-- a and b are busses
		funct : in std_logic_vector(5 downto 0);
		jr : out std_logic;
		operation : out std_logic_vector(2 downto 0));
END alucontrol;

architecture behavioral of alucontrol is
begin
	process(aluop)
	variable temp: std_logic_vector(2 downto 0);
	begin
	case aluop is
		when "00" =>
			temp := "010";
			jr <= '0';
		when "01" =>
			temp := "110";
			jr <= '0';
		when "10" =>
			if funct(3 downto 0) = "0000" then
				temp := "010";
				jr <= '0';
			elsif funct(3 downto 0) = "0010" then
				temp := "110";
				jr <= '0';
			elsif funct(3 downto 0) = "0100" then
				temp := "000";
				jr <= '0';
			elsif funct(3 downto 0) = "0101" then
				temp := "001";
				jr <= '0';
			elsif funct(3 downto 0) = "1010" then
				temp := "111";
				jr <= '0';
			elsif funct(3 downto 0) = "1000" then
				temp := "010";
				jr <= '1';
			end if;
		when others =>
			temp := "010";
			jr <= '0';
	end case;
	operation <= temp;
	end process;
end behavioral;

