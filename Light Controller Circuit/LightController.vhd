library ieee;
use ieee.std_logic_1164.all;

entity LightController is
port (x1, x2 : in std_logic;
f : out std_logic );
end LightController;

architecture LogicFunction of LightController is
begin
f <= (x1 and not x2) or (not x1 and x2);
end LogicFunction;