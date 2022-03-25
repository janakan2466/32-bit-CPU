library verilog;
use verilog.vl_types.all;
entity CPU_TEST_Sim is
    port(
        cpuClk          : in     vl_logic;
        memClk          : in     vl_logic;
        rst             : in     vl_logic;
        outA            : out    vl_logic_vector(31 downto 0);
        outB            : out    vl_logic_vector(31 downto 0);
        outC            : out    vl_logic;
        outZ            : out    vl_logic;
        outIR           : out    vl_logic_vector(31 downto 0);
        outPC           : out    vl_logic_vector(31 downto 0);
        addrOut         : out    vl_logic_vector(5 downto 0);
        wEn             : out    vl_logic;
        memDataOut      : out    vl_logic_vector(31 downto 0);
        memDataIn       : out    vl_logic_vector(31 downto 0);
        T_Info          : out    vl_logic_vector(2 downto 0);
        wen_mem         : out    vl_logic;
        en_mem          : out    vl_logic
    );
end CPU_TEST_Sim;
