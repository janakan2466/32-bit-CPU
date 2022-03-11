library verilog;
use verilog.vl_types.all;
entity data_mem_vlg_check_tst is
    port(
        data_out        : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end data_mem_vlg_check_tst;
