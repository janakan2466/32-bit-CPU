library verilog;
use verilog.vl_types.all;
entity mux2to1_vlg_sample_tst is
    port(
        s               : in     vl_logic;
        w0              : in     vl_logic_vector(31 downto 0);
        w1              : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux2to1_vlg_sample_tst;
