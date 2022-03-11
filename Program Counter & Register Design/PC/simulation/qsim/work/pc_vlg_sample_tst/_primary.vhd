library verilog;
use verilog.vl_types.all;
entity pc_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        d               : in     vl_logic_vector(31 downto 0);
        inc             : in     vl_logic;
        ld              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end pc_vlg_sample_tst;
