library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_check_tst is
    port(
        A_Mux           : in     vl_logic;
        ALU_op          : in     vl_logic_vector(2 downto 0);
        B_Mux           : in     vl_logic;
        clr_A           : in     vl_logic;
        clr_B           : in     vl_logic;
        clr_C           : in     vl_logic;
        clr_IR          : in     vl_logic;
        clr_Z           : in     vl_logic;
        DATA_Mux        : in     vl_logic_vector(1 downto 0);
        en              : in     vl_logic;
        IM_MUX1         : in     vl_logic;
        IM_MUX2         : in     vl_logic_vector(1 downto 0);
        inc_PC          : in     vl_logic;
        ld_A            : in     vl_logic;
        ld_B            : in     vl_logic;
        ld_C            : in     vl_logic;
        ld_IR           : in     vl_logic;
        ld_PC           : in     vl_logic;
        ld_Z            : in     vl_logic;
        REG_Mux         : in     vl_logic;
        T               : in     vl_logic_vector(2 downto 0);
        wen             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ControlUnit_vlg_check_tst;
