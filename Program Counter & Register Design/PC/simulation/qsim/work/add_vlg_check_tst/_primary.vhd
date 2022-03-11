library verilog;
use verilog.vl_types.all;
entity add_vlg_check_tst is
    port(
        B               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end add_vlg_check_tst;
