library ieee;
use ieee.std_logic_1164.all;

ENTITY CPU_TEST_Sim IS
	PORT(
		cpuClk : in std_logic;
		memClk : in std_logic;
		rst : in std_logic;
		-- Debug data.
		outA, outB : out std_logic_vector(31 downto 0);
		outC, outZ : out std_logic;
		outIR : out std_logic_vector(31 downto 0);
		outPC : out std_logic_vector(31 downto 0);
		-- Processor-Inst Memory Interface.
		addrOut : out std_logic_vector(5 downto 0);
		wEn : out std_logic;
		memDataOut : out std_logic_vector(31 downto 0);
		memDataIn : out std_logic_vector(31 downto 0);
		-- Processor State
		T_Info : out std_logic_vector(2 downto 0);
		--data Memory Interface
		wen_mem, en_mem : out std_logic);
END CPU_TEST_Sim;

ARCHITECTURE behavior OF CPU_TEST_Sim IS
	COMPONENT system_memory
		PORT(
			address 	: IN 	STD_LOGIC_VECTOR (5 DOWNTO 0);
			clock 	: IN 	STD_LOGIC ;
			data 		: IN 	STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren 		: IN 	STD_LOGIC ;
			q 			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
 );
 END COMPONENT;
 
	COMPONENT cpu1
		PORT(
			clk 		: in std_logic;
			mem_clk 	: in std_logic;
			rst 		: in std_logic;
			dataIn 	: in std_logic_vector(31 downto 0); 
			dataOut 	: out std_logic_vector(31 downto 0);
			addrOut 	: out std_logic_vector(31 downto 0);
			wEn : out std_logic;
			dOutA, dOutB : out std_logic_vector(31 downto 0);
			dOutC, dOutZ : out std_logic;
			dOutIR : out std_logic_vector(31 downto 0);
			dOutPC : out std_logic_vector(31 downto 0);
			outT : out std_logic_vector(2 downto 0);
			wen_mem, en_mem : out std_logic);
	END COMPONENT;
	
	signal cpu_to_mem: std_logic_vector(31 downto 0);
	signal mem_to_cpu: std_logic_vector(31 downto 0);
	signal add_from_cpu: std_logic_vector(31 downto 0);
	signal wen_from_cpu: std_logic;

BEGIN
 -- Component instantiations.
	main_memory : system_memory
		PORT MAP(
			 address => add_from_cpu(5 downto 0),
			 clock => memClk,
			 data => cpu_to_mem,
			 wren => wen_from_cpu,
			 q => mem_to_cpu
		 );
	main_processor : cpu1
		PORT MAP(
		 clk => cpuClk,
		 mem_clk => memClk,
		 rst => rst,
		 dataIn => mem_to_cpu,
		 dataOut => cpu_to_mem,
		 addrOut => add_from_cpu,
		 wEn => wen_from_cpu,
		 dOutA => outA,
		 dOutB => outB,
		 dOutC => outC,
		 dOutZ => outZ,
		 dOutIR => outIR,
		 dOutPC => outPC,
		 outT => T_Info,
		 wen_mem => wen_mem,
		 en_mem => en_mem
		 );
	
	addrOut <= add_from_cpu(5 downto 0);
	wEn <= wen_from_cpu;
	memDataOut <= mem_to_cpu;
	memDataIn <= cpu_to_mem;
END behavior;