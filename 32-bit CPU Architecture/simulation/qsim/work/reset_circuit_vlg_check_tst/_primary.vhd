library verilog;
use verilog.vl_types.all;
entity reset_circuit_vlg_check_tst is
    port(
        Clr_PC          : in     vl_logic;
        Enable_PD       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end reset_circuit_vlg_check_tst;
