library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
port(
		a				:		in std_logic_vector(31 downto 0);
		b				:		in std_logic_vector(31 downto 0);
		op				:		in std_logic_vector(2 downto 0);
		result		:		out std_logic_vector(31 downto 0);
		zero			:		out std_logic;
		cout			:		out std_logic
);
end ALU;

architecture Behavior of ALU is 
	component adder32
	port(
			Cin		:		in 	std_logic;
			X,Y		:		in 	std_logic_vector(31 downto 0);
			S			:		out	std_logic_vector(31 downto 0);
			Cout		:		out 	std_logic
	);
	end component;
	
	signal result_s: std_logic_vector(31 downto 0) := (others => '0');
	signal result_add: std_logic_vector(31 downto 0) := (others => '0');
	signal result_sub: std_logic_vector(31 downto 0) := (others => '0');
	signal cout_s: std_logic := '0';
	signal cout_add: std_logic := '0';
	signal cout_sub: std_logic := '0';
	signal zero_s: std_logic; -- Set the zero flag as well
	
begin
	add0:	adder32	port map (op(2), a, b, result_add, cout_add);
	sub0:	adder32 port map (op(2), a, not b, result_sub, cout_sub);
	
	process (a, b, op)
	begin
		case (op) is	
			when "000" =>						-- "000" a and b
				result_s <= a and b;
				cout_s <= '0';
			when "001" =>						-- "001" a or b
				result_s <= a or b;
				cout_s <= '0';
			when "010" =>						-- "010" a + b
				result_s <= result_add;
				cout_s <= cout_add;
			when "011" =>						-- "011" b
				result_s <= b;
				cout_s <= '0';
			when "110" =>						-- "110" a - b
				result_s <= result_sub;
				cout_s <= cout_sub;
			when "100" =>						-- a s11 1
				result_s <= a(30 downto 0) & '0';
				cout_s <= a(31);
			when "101" =>						-- a srl 1
				result_s <= '0' & a(31 downto 1);
				cout_s <= '0';
			when others =>
				result_s <= a;
				cout_s <= '0';
		end case;
	
	case (result_s) is
		when (others => '0') =>
			zero_s <= '1';
		when others =>
			zero_s <= '0';
	end case;
end process;
	
	result <= result_s;
	cout <= cout_s;
	zero <= zero_s;
			
end Behavior;