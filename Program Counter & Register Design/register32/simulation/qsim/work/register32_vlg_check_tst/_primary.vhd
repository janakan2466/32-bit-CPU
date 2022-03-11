library verilog;
use verilog.vl_types.all;
entity register32_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end register32_vlg_check_tst;
