library verilog;
use verilog.vl_types.all;
entity fulladd_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        s               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end fulladd_vlg_check_tst;
