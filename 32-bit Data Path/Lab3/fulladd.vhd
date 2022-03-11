library ieee;
use ieee.std_logic_1164.all;

entity fulladd is 
port(
		Cin, x, y 	:	in std_logic;
		s, Cout 		:  out std_logic
);
end fulladd;

architecture Behavior of fulladd is 
begin 
	s <= x xor y xor Cin;
	Cout <= (x and y) or (Cin and x) or (Cin and y);
end Behavior;