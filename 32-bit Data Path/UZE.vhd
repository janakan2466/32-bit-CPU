library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UZE is
port(UZE_in : in std_logic_vector(31 downto 0);
	  UZE_out : out std_logic_vector(31 downto 0));
end entity;

architecture Behavior of UZE is
signal zeros: std_logic_vector(15 downto 0) := (others => '0');
begin
	UZE_out <= UZE_in(15 downto 0) & zeros ;
end Behavior;