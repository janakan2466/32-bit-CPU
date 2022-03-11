library ieee;
use ieee.std_logic_1164.all;

entity adder32 is
port(
		Cin		:		in 	std_logic;
		X,Y		:		in 	std_logic_vector(31 downto 0);
		S			:		out	std_logic_vector(31 downto 0);
		Cout		:		out 	std_logic
);
end adder32;

architecture Behavior of adder32 is 
	component adder16
	port(
			Cin		:		in 	std_logic;
			X,Y		:		in 	std_logic_vector(15 downto 0);
			S			:		out	std_logic_vector(15 downto 0);
			Cout		:		out 	std_logic
	);
	end component;
	
	signal C: std_logic;
begin
	stage0:	adder16 port map (Cin, X(15 downto 0), Y(15 downto 0), S(15 downto 0), C);
	stage1:	adder16 port map (C, X(31 downto 16), Y(31 downto 16), S(31 downto 16), Cout);
end Behavior;