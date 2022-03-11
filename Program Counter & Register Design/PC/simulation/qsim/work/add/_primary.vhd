library verilog;
use verilog.vl_types.all;
entity add is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : out    vl_logic_vector(31 downto 0)
    );
end add;
