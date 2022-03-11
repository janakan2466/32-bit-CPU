library verilog;
use verilog.vl_types.all;
entity adder16_vlg_sample_tst is
    port(
        Cin             : in     vl_logic;
        X               : in     vl_logic_vector(15 downto 0);
        Y               : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end adder16_vlg_sample_tst;
