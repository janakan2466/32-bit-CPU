LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY cpu1 IS
PORT (
clk : IN STD_LOGIC;
mem_clk : IN STD_LOGIC;
rst : IN STD_LOGIC;
dataIn : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
dataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
addrOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
dOutA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
dOutB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
dOutC : OUT STD_LOGIC;
dOutZ : OUT STD_LOGIC;
dOutIR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
dOutPC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
wEn : OUT STD_LOGIC;
outT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
wen_mem : OUT STD_LOGIC;
en_mem : OUT STD_LOGIC
);
END cpu1;

ARCHITECTURE description OF cpu1 IS
COMPONENT Data_Path IS
PORT (
Clk, mClk : IN STD_LOGIC; -- clock Signal
--Memory Signals
WEN, EN : IN STD_LOGIC;
-- Register Control Signals (CLR and LD).
Clr_A , Ld_A : IN STD_LOGIC;
Clr_B , Ld_B : IN STD_LOGIC;
Clr_C , Ld_C : IN STD_LOGIC;
Clr_Z , Ld_Z : IN STD_LOGIC;
ClrPC , Ld_PC : IN STD_LOGIC;
ClrIR , Ld_IR : IN STD_LOGIC;
-- Register outputs (Some needed to feed back to control unit. Others pulled out for testing.
Out_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_C : OUT STD_LOGIC;
Out_Z : OUT STD_LOGIC;
Out_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_IR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
-- Special inputs to PC.
Inc_PC : IN STD_LOGIC;
-- Address and Data Bus signals for debugging.
ADDR_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
DATA_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
DATA_BUS, MEM_OUT, MEM_IN : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
MEM_ADDR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
-- Various MUX controls.
DATA_Mux : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
REG_Mux : IN STD_LOGIC;
A_MUX, B_MUX : IN STD_LOGIC;
IM_MUX1 : IN STD_LOGIC;
IM_MUX2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
-- ALU Operations.
ALU_Op : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END COMPONENT;

COMPONENT Control_NEW IS
PORT (
clk, mclk : IN STD_LOGIC;
enable : IN STD_LOGIC;
statusC, statusZ : IN STD_LOGIC;
INST : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
A_Mux, B_Mux : OUT STD_LOGIC;
IM_MUX1, REG_Mux : OUT STD_LOGIC;
IM_MUX2, DATA_Mux : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
ALU_op : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
inc_PC, ld_PC : OUT STD_LOGIC;
clr_IR : OUT STD_LOGIC;
ld_IR : OUT STD_LOGIC;
clr_A, clr_B, clr_C, clr_Z : OUT STD_LOGIC;
ld_A, ld_B, ld_C, ld_Z : OUT STD_LOGIC;
T : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
wen, en : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT reset_circuit IS
PORT (
Reset : IN STD_LOGIC;
Clk : IN STD_LOGIC;
Enable_PD : OUT STD_LOGIC;
Clr_PC : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL dp_mux1, dp_clrA, dp_ldA, dp_clrB, dp_ldB, dp_clrC, dp_ldC, dp_clrZ,
dp_ldZ, memWEN, memEN, dp_muxA, dp_muxB : STD_LOGIC;
SIGNAL mux_data, reg, enpd, irlc, irld, pinc, pclr, pcld, out0, out1, out7, out6 : STD_LOGIC;
SIGNAL outIR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL alu : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL dp_mux2, dp_muxData : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
dat : Data_Path
PORT MAP(
Clk => clk,
mClk => mem_clk,
WEN => memWEN,
EN => memEN,
Clr_A => dp_clrA,
Ld_A => dp_ldA, Clr_B => dp_clrB, Ld_B => dp_ldB, Clr_C => dp_clrC, Ld_C
=> dp_ldC, Clr_Z => dp_clrZ, Ld_Z => dp_ldZ,
ClrPC => pclr, Ld_PC => pcld, ClrIR => irlc, Ld_IR => irld,
Out_A => dOutA, Out_B => dOutB, Out_C => out0, Out_Z => out1, Out_PC =>
dOutPC, Out_IR => outIR, Inc_PC => pinc,
ADDR_OUT => addrOut, DATA_IN => dataIn, DATA_BUS => dataOut, DATA_Mux
=> dp_muxData, REG_Mux => reg, A_MUX => dp_muxA, B_MUX => dp_muxB, IM_MUX1 =>
dp_mux1, IM_MUX2 => dp_mux2,
ALU_Op => alu
);

control_unit : Control_NEW
PORT MAP(
clk => clk, mclk => mem_clk, enable => enpd, statusC => out0, statusZ =>
out1, INST => outIR,

A_Mux => dp_muxA, B_Mux => dp_muxB, IM_MUX1 => dp_mux1, REG_Mux => reg,
IM_MUX2 => dp_mux2, DATA_Mux => dp_muxData,
ALU_op => alu, inc_PC => pinc, ld_PC => pcld, clr_IR => irlc, ld_IR =>
irld,
clr_A => dp_clrA, clr_B => dp_clrB, clr_C => dp_clrC, clr_Z => dp_clrZ,
ld_A => dp_ldA, ld_B => dp_ldB, ld_C => dp_ldC, ld_Z => dp_ldZ,
T => outT, wen => memWEN, en => memEN
);

reset : reset_circuit
PORT MAP(
Reset => rst,
Clk => clk,
Enable_PD => enpd,
Clr_PC => pclr
);
dOutC <= out0;
dOutZ <= out1;
dOutIR <= outIR;
wen_mem <= out7;
en_mem <= out6;

END description;
