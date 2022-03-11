library verilog;
use verilog.vl_types.all;
entity register1 is
    port(
        d               : in     vl_logic;
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic
    );
end register1;
