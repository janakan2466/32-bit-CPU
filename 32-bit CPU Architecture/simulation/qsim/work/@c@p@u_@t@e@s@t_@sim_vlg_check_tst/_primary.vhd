library verilog;
use verilog.vl_types.all;
entity CPU_TEST_Sim_vlg_check_tst is
    port(
        addrOut         : in     vl_logic_vector(5 downto 0);
        en_mem          : in     vl_logic;
        memDataIn       : in     vl_logic_vector(31 downto 0);
        memDataOut      : in     vl_logic_vector(31 downto 0);
        outA            : in     vl_logic_vector(31 downto 0);
        outB            : in     vl_logic_vector(31 downto 0);
        outC            : in     vl_logic;
        outIR           : in     vl_logic_vector(31 downto 0);
        outPC           : in     vl_logic_vector(31 downto 0);
        outZ            : in     vl_logic;
        T_Info          : in     vl_logic_vector(2 downto 0);
        wEn             : in     vl_logic;
        wen_mem         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CPU_TEST_Sim_vlg_check_tst;
