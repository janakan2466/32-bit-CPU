library verilog;
use verilog.vl_types.all;
entity register32 is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic_vector(31 downto 0)
    );
end register32;
