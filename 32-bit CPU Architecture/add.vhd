library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity add is 
port(
		A : in 	std_logic_vector(31 downto 0);
		B : out 	std_logic_vector(31 downto 0)
);
end add;

architecture Behavior of add is
begin 
	B <= A + 1;
end Behavior;