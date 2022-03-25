library verilog;
use verilog.vl_types.all;
entity ControlUnit2 is
    port(
        clk             : in     vl_logic;
        mclk            : in     vl_logic;
        enable          : in     vl_logic;
        statusC         : in     vl_logic;
        statusZ         : in     vl_logic;
        INST            : in     vl_logic_vector(31 downto 0);
        A_Mux           : out    vl_logic;
        B_Mux           : out    vl_logic;
        IM_MUX1         : out    vl_logic;
        REG_MUX         : out    vl_logic;
        IM_MUX2         : out    vl_logic_vector(1 downto 0);
        DATA_Mux        : out    vl_logic_vector(1 downto 0);
        ALU_op          : out    vl_logic_vector(2 downto 0);
        inc_PC          : out    vl_logic;
        ld_PC           : out    vl_logic;
        clr_IR          : out    vl_logic;
        ld_IR           : out    vl_logic;
        clr_A           : out    vl_logic;
        clr_B           : out    vl_logic;
        clr_C           : out    vl_logic;
        clr_Z           : out    vl_logic;
        ld_A            : out    vl_logic;
        ld_B            : out    vl_logic;
        ld_C            : out    vl_logic;
        ld_Z            : out    vl_logic;
        T               : out    vl_logic_vector(2 downto 0);
        wen             : out    vl_logic;
        en              : out    vl_logic
    );
end ControlUnit2;
