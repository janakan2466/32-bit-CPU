library verilog;
use verilog.vl_types.all;
entity register1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        d               : in     vl_logic;
        ld              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end register1_vlg_sample_tst;
