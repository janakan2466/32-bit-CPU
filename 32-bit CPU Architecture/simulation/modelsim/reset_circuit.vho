-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.2 Build 209 09/17/2014 SJ Full Version"

-- DATE "03/24/2022 02:49:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	reset_circuit IS
    PORT (
	Reset : IN std_logic;
	Clk : IN std_logic;
	Enable_PD : OUT std_logic;
	Clr_PC : OUT std_logic
	);
END reset_circuit;

-- Design Ports Information
-- Enable_PD	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clr_PC	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF reset_circuit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Enable_PD : std_logic;
SIGNAL ww_Clr_PC : std_logic;
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Enable_PD~output_o\ : std_logic;
SIGNAL \Clr_PC~output_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \present_clk.clk0~0_combout\ : std_logic;
SIGNAL \present_clk.clk0~q\ : std_logic;
SIGNAL \present_clk~6_combout\ : std_logic;
SIGNAL \present_clk~9_combout\ : std_logic;
SIGNAL \present_clk.clk1~q\ : std_logic;
SIGNAL \present_clk~8_combout\ : std_logic;
SIGNAL \present_clk.clk2~q\ : std_logic;
SIGNAL \present_clk~7_combout\ : std_logic;
SIGNAL \present_clk.clk3~q\ : std_logic;
SIGNAL \Enable_PD~0_combout\ : std_logic;
SIGNAL \Enable_PD~reg0_q\ : std_logic;
SIGNAL \Clr_PC~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Enable_PD~reg0_q\ : std_logic;

BEGIN

ww_Reset <= Reset;
ww_Clk <= Clk;
Enable_PD <= ww_Enable_PD;
Clr_PC <= ww_Clr_PC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
\ALT_INV_Enable_PD~reg0_q\ <= NOT \Enable_PD~reg0_q\;

-- Location: IOOBUF_X0_Y52_N2
\Enable_PD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Enable_PD~reg0_q\,
	devoe => ww_devoe,
	o => \Enable_PD~output_o\);

-- Location: IOOBUF_X0_Y52_N23
\Clr_PC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Clr_PC~reg0_q\,
	devoe => ww_devoe,
	o => \Clr_PC~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\Clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G2
\Clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y52_N15
\Reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: LCCOMB_X1_Y52_N28
\present_clk.clk0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \present_clk.clk0~0_combout\ = !\Reset~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	combout => \present_clk.clk0~0_combout\);

-- Location: FF_X1_Y52_N29
\present_clk.clk0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \present_clk.clk0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_clk.clk0~q\);

-- Location: LCCOMB_X1_Y52_N16
\present_clk~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \present_clk~6_combout\ = (\Reset~input_o\) # (!\present_clk.clk0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \present_clk.clk0~q\,
	combout => \present_clk~6_combout\);

-- Location: LCCOMB_X1_Y52_N18
\present_clk~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \present_clk~9_combout\ = (!\Reset~input_o\ & !\present_clk.clk0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \present_clk.clk0~q\,
	combout => \present_clk~9_combout\);

-- Location: FF_X1_Y52_N19
\present_clk.clk1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \present_clk~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_clk.clk1~q\);

-- Location: LCCOMB_X1_Y52_N12
\present_clk~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \present_clk~8_combout\ = (\present_clk.clk0~q\ & (!\Reset~input_o\ & \present_clk.clk1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \present_clk.clk0~q\,
	datac => \Reset~input_o\,
	datad => \present_clk.clk1~q\,
	combout => \present_clk~8_combout\);

-- Location: FF_X1_Y52_N13
\present_clk.clk2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \present_clk~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_clk.clk2~q\);

-- Location: LCCOMB_X1_Y52_N2
\present_clk~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \present_clk~7_combout\ = (!\present_clk.clk1~q\ & (!\present_clk~6_combout\ & ((\present_clk.clk2~q\) # (\present_clk.clk3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_clk.clk2~q\,
	datab => \present_clk.clk1~q\,
	datac => \present_clk.clk3~q\,
	datad => \present_clk~6_combout\,
	combout => \present_clk~7_combout\);

-- Location: FF_X1_Y52_N3
\present_clk.clk3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \present_clk~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_clk.clk3~q\);

-- Location: LCCOMB_X1_Y52_N14
\Enable_PD~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Enable_PD~0_combout\ = (\Reset~input_o\) # (\present_clk.clk3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \present_clk.clk3~q\,
	combout => \Enable_PD~0_combout\);

-- Location: FF_X1_Y52_N17
\Enable_PD~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \present_clk~6_combout\,
	ena => \Enable_PD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Enable_PD~reg0_q\);

-- Location: FF_X1_Y52_N15
\Clr_PC~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Reset~input_o\,
	sload => VCC,
	ena => \Enable_PD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Clr_PC~reg0_q\);

ww_Enable_PD <= \Enable_PD~output_o\;

ww_Clr_PC <= \Clr_PC~output_o\;
END structure;


