library verilog;
use verilog.vl_types.all;
entity mux2to1 is
    port(
        s               : in     vl_logic;
        w0              : in     vl_logic_vector(31 downto 0);
        w1              : in     vl_logic_vector(31 downto 0);
        f               : out    vl_logic_vector(31 downto 0)
    );
end mux2to1;
