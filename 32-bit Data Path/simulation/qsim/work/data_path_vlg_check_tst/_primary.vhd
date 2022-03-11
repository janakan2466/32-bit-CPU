library verilog;
use verilog.vl_types.all;
entity data_path_vlg_check_tst is
    port(
        ADDR_OUT        : in     vl_logic_vector(31 downto 0);
        DATA_BUS        : in     vl_logic_vector(31 downto 0);
        MEM_ADDR        : in     vl_logic_vector(7 downto 0);
        MEM_IN          : in     vl_logic_vector(31 downto 0);
        MEM_OUT         : in     vl_logic_vector(31 downto 0);
        Out_A           : in     vl_logic_vector(31 downto 0);
        Out_B           : in     vl_logic_vector(31 downto 0);
        Out_C           : in     vl_logic;
        Out_IR          : in     vl_logic_vector(31 downto 0);
        Out_PC          : in     vl_logic_vector(31 downto 0);
        Out_Z           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end data_path_vlg_check_tst;
