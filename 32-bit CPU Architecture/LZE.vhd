library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LZE is
port(LZE_in : in std_logic_vector(31 downto 0);
	  LZE_out : out std_logic_vector(31 downto 0));
end entity;

architecture Behavior of LZE is
signal zeros: std_logic_vector(15 downto 0) := (others => '0');
begin
	LZE_out <= zeros & LZE_in(15 downto 0);
end Behavior;