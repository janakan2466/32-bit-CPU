library verilog;
use verilog.vl_types.all;
entity data_mem_vlg_sample_tst is
    port(
        addr            : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic;
        wen             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end data_mem_vlg_sample_tst;
