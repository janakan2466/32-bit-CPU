library verilog;
use verilog.vl_types.all;
entity fulladd_vlg_sample_tst is
    port(
        Cin             : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end fulladd_vlg_sample_tst;
