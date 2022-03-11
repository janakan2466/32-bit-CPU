library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
port(s 				  : in std_logic_vector(1 downto 0);
	  X1, X2, X3, X4 : in std_logic_vector(31 downto 0);
	  f 				  : out std_logic_vector(31 downto 0)
	  );
end mux4to1;

architecture Behavior of mux4to1 is
begin
	with s select
	f <= X1 when "00",
		  X2 when "01",
		  X3 when "10",
		  X4 when "11";
end Behavior;