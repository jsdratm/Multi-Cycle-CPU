library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY controlrom IS
	port(indata : in std_logic_vector(4 downto 0);
		sel,pcsource,alusrcb,aluop: out std_logic_vector(1 downto 0);
		alusrca, regwrite, regdst,irwrite,memtoreg,memwrite,memread,iord,pcwrite,pcwritecond,jal,jump,ab,aluout: out std_logic);	
END controlrom;

architecture behavioral of controlrom is
begin
	process(indata)
	begin
pcsource <= "00";
alusrcb <= "00";
aluop <= "00";
alusrca <= '0';
regwrite <= '0';
regdst <= '0';
irwrite <= '0';
memtoreg <= '0';
memwrite <= '0';
memread <= '0';
iord <= '0';
pcwrite <= '0';
pcwritecond <= '0';
jal <= '0';
jump <= '0';
ab <= '0';
aluout <= '0';
sel <= "00";
	case indata is
		when "00000" =>
			pcsource <= "01";
			alusrcb <= "01";
			aluop <= "00";
			alusrca <= '0';
			regwrite <= '0';
			regdst <= '0';
			irwrite <= '1';
			memtoreg <= '0';
			memwrite <= '0';
			memread <= '1';
			iord <= '0';
			pcwrite <= '0';
			pcwritecond <= '0';
			jal <= '0';
			jump <= '0';
			ab <= '1';
			aluout <= '1';
			sel <= "11";
		when "00001" =>
			pcwrite <= '1';
			pcwritecond <= '1';
			pcsource <= "01";
			alusrcb <= "11";
			ab <= '1';
			aluout <= '1';
			sel <= "01";
		when "00010" =>
			alusrcb <= "10";
			alusrca <= '1';
			memread <= '1';
			iord <= '1';
			ab <= '1';
			aluout <= '1';
			sel <= "10";
		when "00011" =>
			regwrite <= '1';
			memtoreg <= '1';
			iord <= '1';
			sel <= "11";
		when "00100" =>
			regwrite <= '1';
			memtoreg <= '1';
			sel <= "00";
		when "00101" =>
			memwrite <= '1';
			iord <= '1';
			sel <= "00";
		when "00110" =>
			aluop <= "10";
			alusrca <= '1';
			regwrite <= '1';
			regdst <= '1';
			ab <= '1';
			aluout <= '1';
			sel <= "11";
		when "00111" =>
			regdst <= '1';
			aluout <= '1';
			sel <= "00";
		when "01000" =>
			pcsource <= "01";
			aluop <= "01";
			alusrca <= '1';
			pcwritecond <= '1';
			ab <= '1';
			aluout <= '1';
			sel <= "00";
		when "01001" =>
			pcsource <= "10";
			pcwrite <= '1';
			ab <= '1';
			aluout <= '1';
			sel <= "00";
		when "01010" =>
			regwrite <= '1';
			aluout <= '1';
			sel <= "00";
		when "01011" =>
			regwrite <= '1';
			jal <= '1';
			ab <= '1';
			alusrca <= '1';
			alusrcb <= "10";
			sel <= "10";
		when "01100" =>
			ab <= '1';
			alusrca <= '1';
			alusrcb <= "10";
			aluout <= '1';
			sel <= "11";
		when "01101" =>
			regwrite <= '1';
			sel <= "00";
		when others =>
			sel <= "00";
	end case;
	end process;
end behavioral;
