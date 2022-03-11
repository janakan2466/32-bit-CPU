library verilog;
use verilog.vl_types.all;
entity data_mem is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        wen             : in     vl_logic;
        en              : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end data_mem;
