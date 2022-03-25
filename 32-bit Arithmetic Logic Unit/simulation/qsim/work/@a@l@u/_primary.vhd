library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        op              : in     vl_logic_vector(2 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        cout            : out    vl_logic
    );
end ALU;
