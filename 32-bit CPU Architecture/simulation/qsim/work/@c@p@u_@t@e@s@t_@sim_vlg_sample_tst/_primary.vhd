library verilog;
use verilog.vl_types.all;
entity CPU_TEST_Sim_vlg_sample_tst is
    port(
        cpuClk          : in     vl_logic;
        memClk          : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_TEST_Sim_vlg_sample_tst;
