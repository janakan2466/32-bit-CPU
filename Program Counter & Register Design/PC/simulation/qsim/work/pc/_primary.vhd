library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        inc             : in     vl_logic;
        d               : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end pc;
