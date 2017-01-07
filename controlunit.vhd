library ieee;
use ieee.std_logic_1164.all;
--
--
entity controlunit is
	port(
		clk: in std_logic;
		op:	 in std_logic_vector(5 downto 0);
		pcsource, alusrcb, aluop: out std_logic_vector(1 downto 0);
		alusrca, regwrite, regdst,irwrite,memtoreg,memwrite,memread,iord,pcwrite,pcwritecond,jal,jump,ab,aluout: out std_logic
	);
	end controlunit;
architecture structural of controlunit is
	component controlrom
		port(indata : in std_logic_vector(4 downto 0);
		sel,pcsource,alusrcb,aluop: out std_logic_vector(1 downto 0);
		alusrca, regwrite, regdst,irwrite,memtoreg,memwrite,memread,iord,pcwrite,pcwritecond,jal,jump,ab,aluout: out std_logic);
	end component;
	component microprogramcounter
		port(
		clock: in std_logic;
		writedata: in std_logic_vector(4 downto 0);
		outdata: out std_logic_vector(4 downto 0));
	end component;
	component zerofivebits
		port(
		output : out std_logic_vector(4 downto 0));
	end component;
	component dispatchrom1
		port(indata : in std_logic_vector(5 downto 0);
		 outdata : out std_logic_vector(4 downto 0));
	end component;
	component dispatchrom2
		port(indata : in std_logic_vector(5 downto 0);
		 outdata : out std_logic_vector(4 downto 0));
	end component;
	component fourtoonemultiplexer5width
		port(a,b,c,d:in std_logic_vector(4 downto 0);
		s:in std_logic_vector(1 downto 0);
		outdata:out std_logic_vector(4 downto 0));
	end component;
	component fivebitadder
		port(indata:in std_logic_vector(4 downto 0);
		outdata:out std_logic_vector(4 downto 0));
	end component;
signal currentstage,zerosignal,muxb,muxc,muxd,muxoutput : std_logic_vector(4 downto 0);
signal selectsignal : std_logic_vector(1 downto 0);
begin
	crom: controlrom 
	   	port map(currentstage,selectsignal,pcsource,alusrcb,aluop,alusrca,regwrite,regdst,irwrite,memtoreg,memwrite,memread,iord,pcwrite,pcwritecond,jal,jump,ab,aluout);
	mux5: fourtoonemultiplexer5width
		port map(zerosignal,muxb,muxc,muxd,selectsignal,muxoutput);
	zerocomp: zerofivebits
		port map(zerosignal);
	drom1: dispatchrom1
		port map(op,muxb);
	drom2: dispatchrom2
		port map(op,muxc);
	micropc: microprogramcounter
		port map(clk,muxoutput,currentstage);
	fbitadd: fivebitadder
		port map(currentstage,muxd);
end structural;
