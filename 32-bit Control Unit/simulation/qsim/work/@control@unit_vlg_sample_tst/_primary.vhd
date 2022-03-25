library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        INST            : in     vl_logic_vector(31 downto 0);
        mclk            : in     vl_logic;
        statusC         : in     vl_logic;
        statusZ         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ControlUnit_vlg_sample_tst;
