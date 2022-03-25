library verilog;
use verilog.vl_types.all;
entity reset_circuit_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reset_circuit_vlg_sample_tst;
