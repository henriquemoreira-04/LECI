-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "03/19/2024 11:14:40"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TimerN IS
    PORT (
	start : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	clk : IN std_logic;
	timerOut : OUT std_logic
	);
END TimerN;

ARCHITECTURE structure OF TimerN IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_timerOut : std_logic;
SIGNAL \timerOut~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \s_count[0]~1_combout\ : std_logic;
SIGNAL \s_count[0]~2_combout\ : std_logic;
SIGNAL \s_count[2]~34_combout\ : std_logic;
SIGNAL \s_count[0]~0_combout\ : std_logic;
SIGNAL \s_count[31]~3_combout\ : std_logic;
SIGNAL \s_count[0]~35_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \s_count[1]~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \s_count[3]~5_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \s_count[4]~6_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \s_count[5]~7_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \s_count[6]~8_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \s_count[7]~9_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \s_count[8]~10_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \s_count[9]~11_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \s_count[10]~12_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \s_count[11]~13_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \s_count[12]~14_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \s_count[13]~15_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \s_count[14]~16_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \s_count[15]~17_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \s_count[16]~18_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \s_count[17]~19_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \s_count[18]~20_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \s_count[19]~21_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \s_count[20]~22_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \s_count[21]~23_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \s_count[22]~24_combout\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \s_count[23]~25_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \s_count[24]~26_combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \s_count[25]~27_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \s_count[26]~28_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \s_count[27]~29_combout\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \s_count[28]~30_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \s_count[29]~31_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \s_count[30]~33_combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \s_count[31]~32_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \timerOut~0_combout\ : std_logic;
SIGNAL \timerOut~1_combout\ : std_logic;
SIGNAL \timerOut~reg0_q\ : std_logic;
SIGNAL s_count : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_start <= start;
ww_reset <= reset;
ww_enable <= enable;
ww_clk <= clk;
timerOut <= ww_timerOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\timerOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \timerOut~reg0_q\,
	devoe => ww_devoe,
	o => \timerOut~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = s_count(0) $ (GND)
-- \Add0~1\ = CARRY(!s_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (s_count(1) & (!\Add0~1\)) # (!s_count(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!s_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (s_count(2) & (\Add0~3\ $ (GND))) # (!s_count(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((s_count(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\s_count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~1_combout\ = (s_count(0) & (!s_count(2) & !\start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datab => s_count(2),
	datac => \start~input_o\,
	combout => \s_count[0]~1_combout\);

\s_count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~2_combout\ = (!\reset~input_o\ & (((\Equal0~9_combout\ & \s_count[0]~1_combout\)) # (!\enable~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \enable~input_o\,
	datac => \Equal0~9_combout\,
	datad => \s_count[0]~1_combout\,
	combout => \s_count[0]~2_combout\);

\s_count[2]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[2]~34_combout\ = (s_count(2) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~4_combout\)))) # (!s_count(2) & (\s_count[31]~3_combout\ & (\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(2),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~4_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[2]~34_combout\);

\s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[2]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(2));

\s_count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~0_combout\ = ((s_count(0) & ((\start~input_o\) # (s_count(2)))) # (!s_count(0) & ((!s_count(2))))) # (!\Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datab => \start~input_o\,
	datac => s_count(2),
	datad => \Equal0~9_combout\,
	combout => \s_count[0]~0_combout\);

\s_count[31]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[31]~3_combout\ = (\s_count[0]~0_combout\ & (!\reset~input_o\ & !\s_count[0]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_count[0]~0_combout\,
	datac => \reset~input_o\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[31]~3_combout\);

\s_count[0]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~35_combout\ = (\Add0~0_combout\ & (!\s_count[31]~3_combout\ & ((s_count(0)) # (!\s_count[0]~2_combout\)))) # (!\Add0~0_combout\ & (((s_count(0)) # (!\s_count[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \s_count[31]~3_combout\,
	datac => \s_count[0]~2_combout\,
	datad => s_count(0),
	combout => \s_count[0]~35_combout\);

\s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[0]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(0));

\s_count[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[1]~4_combout\ = (s_count(1) & ((\s_count[0]~2_combout\) # ((\Add0~2_combout\ & \s_count[31]~3_combout\)))) # (!s_count(1) & (\Add0~2_combout\ & (\s_count[31]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(1),
	datab => \Add0~2_combout\,
	datac => \s_count[31]~3_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[1]~4_combout\);

\s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(1));

\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (s_count(3) & (!\Add0~5\)) # (!s_count(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!s_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

\s_count[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[3]~5_combout\ = (s_count(3) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~6_combout\)))) # (!s_count(3) & (\s_count[31]~3_combout\ & (\Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(3),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~6_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[3]~5_combout\);

\s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(3));

\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (s_count(4) & (\Add0~7\ $ (GND))) # (!s_count(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((s_count(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

\s_count[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[4]~6_combout\ = (s_count(4) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~8_combout\)))) # (!s_count(4) & (\s_count[31]~3_combout\ & (\Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(4),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~8_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[4]~6_combout\);

\s_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(4));

\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (s_count(5) & (!\Add0~9\)) # (!s_count(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!s_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

\s_count[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[5]~7_combout\ = (s_count(5) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~10_combout\)))) # (!s_count(5) & (\s_count[31]~3_combout\ & (\Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(5),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~10_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[5]~7_combout\);

\s_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[5]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(5));

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!s_count(1) & (!s_count(3) & (!s_count(4) & !s_count(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(1),
	datab => s_count(3),
	datac => s_count(4),
	datad => s_count(5),
	combout => \Equal0~0_combout\);

\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (s_count(6) & (\Add0~11\ $ (GND))) # (!s_count(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((s_count(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

\s_count[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[6]~8_combout\ = (s_count(6) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~12_combout\)))) # (!s_count(6) & (\s_count[31]~3_combout\ & (\Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(6),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~12_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[6]~8_combout\);

\s_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[6]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(6));

\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (s_count(7) & (!\Add0~13\)) # (!s_count(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!s_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

\s_count[7]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[7]~9_combout\ = (s_count(7) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~14_combout\)))) # (!s_count(7) & (\s_count[31]~3_combout\ & (\Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(7),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~14_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[7]~9_combout\);

\s_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(7));

\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (s_count(8) & (\Add0~15\ $ (GND))) # (!s_count(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((s_count(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

\s_count[8]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[8]~10_combout\ = (s_count(8) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~16_combout\)))) # (!s_count(8) & (\s_count[31]~3_combout\ & (\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(8),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~16_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[8]~10_combout\);

\s_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[8]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(8));

\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (s_count(9) & (!\Add0~17\)) # (!s_count(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!s_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

\s_count[9]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[9]~11_combout\ = (s_count(9) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~18_combout\)))) # (!s_count(9) & (\s_count[31]~3_combout\ & (\Add0~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(9),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~18_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[9]~11_combout\);

\s_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[9]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(9));

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!s_count(6) & (!s_count(7) & (!s_count(8) & !s_count(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(6),
	datab => s_count(7),
	datac => s_count(8),
	datad => s_count(9),
	combout => \Equal0~1_combout\);

\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (s_count(10) & (\Add0~19\ $ (GND))) # (!s_count(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((s_count(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

\s_count[10]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[10]~12_combout\ = (s_count(10) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~20_combout\)))) # (!s_count(10) & (\s_count[31]~3_combout\ & (\Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(10),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~20_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[10]~12_combout\);

\s_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[10]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(10));

\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (s_count(11) & (!\Add0~21\)) # (!s_count(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!s_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

\s_count[11]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[11]~13_combout\ = (s_count(11) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~22_combout\)))) # (!s_count(11) & (\s_count[31]~3_combout\ & (\Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(11),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~22_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[11]~13_combout\);

\s_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[11]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(11));

\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (s_count(12) & (\Add0~23\ $ (GND))) # (!s_count(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((s_count(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

\s_count[12]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[12]~14_combout\ = (s_count(12) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~24_combout\)))) # (!s_count(12) & (\s_count[31]~3_combout\ & (\Add0~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(12),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~24_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[12]~14_combout\);

\s_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[12]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(12));

\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (s_count(13) & (!\Add0~25\)) # (!s_count(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!s_count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

\s_count[13]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[13]~15_combout\ = (s_count(13) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~26_combout\)))) # (!s_count(13) & (\s_count[31]~3_combout\ & (\Add0~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(13),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~26_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[13]~15_combout\);

\s_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[13]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(13));

\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!s_count(10) & (!s_count(11) & (!s_count(12) & !s_count(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(10),
	datab => s_count(11),
	datac => s_count(12),
	datad => s_count(13),
	combout => \Equal0~2_combout\);

\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (s_count(14) & (\Add0~27\ $ (GND))) # (!s_count(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((s_count(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

\s_count[14]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[14]~16_combout\ = (s_count(14) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~28_combout\)))) # (!s_count(14) & (\s_count[31]~3_combout\ & (\Add0~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(14),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~28_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[14]~16_combout\);

\s_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[14]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(14));

\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (s_count(15) & (!\Add0~29\)) # (!s_count(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!s_count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

\s_count[15]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[15]~17_combout\ = (s_count(15) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~30_combout\)))) # (!s_count(15) & (\s_count[31]~3_combout\ & (\Add0~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(15),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~30_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[15]~17_combout\);

\s_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[15]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(15));

\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (s_count(16) & (\Add0~31\ $ (GND))) # (!s_count(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((s_count(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

\s_count[16]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[16]~18_combout\ = (s_count(16) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~32_combout\)))) # (!s_count(16) & (\s_count[31]~3_combout\ & (\Add0~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(16),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~32_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[16]~18_combout\);

\s_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[16]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(16));

\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (s_count(17) & (!\Add0~33\)) # (!s_count(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!s_count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

\s_count[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[17]~19_combout\ = (s_count(17) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~34_combout\)))) # (!s_count(17) & (\s_count[31]~3_combout\ & (\Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(17),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~34_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[17]~19_combout\);

\s_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[17]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(17));

\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!s_count(14) & (!s_count(15) & (!s_count(16) & !s_count(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(14),
	datab => s_count(15),
	datac => s_count(16),
	datad => s_count(17),
	combout => \Equal0~3_combout\);

\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~0_combout\ & (\Equal0~1_combout\ & (\Equal0~2_combout\ & \Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (s_count(18) & (\Add0~35\ $ (GND))) # (!s_count(18) & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((s_count(18) & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

\s_count[18]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[18]~20_combout\ = (s_count(18) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~36_combout\)))) # (!s_count(18) & (\s_count[31]~3_combout\ & (\Add0~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(18),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~36_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[18]~20_combout\);

\s_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[18]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(18));

\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (s_count(19) & (!\Add0~37\)) # (!s_count(19) & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!s_count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

\s_count[19]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[19]~21_combout\ = (s_count(19) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~38_combout\)))) # (!s_count(19) & (\s_count[31]~3_combout\ & (\Add0~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(19),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~38_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[19]~21_combout\);

\s_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[19]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(19));

\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (s_count(20) & (\Add0~39\ $ (GND))) # (!s_count(20) & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((s_count(20) & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

\s_count[20]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[20]~22_combout\ = (s_count(20) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~40_combout\)))) # (!s_count(20) & (\s_count[31]~3_combout\ & (\Add0~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(20),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~40_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[20]~22_combout\);

\s_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[20]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(20));

\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (s_count(21) & (!\Add0~41\)) # (!s_count(21) & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!s_count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

\s_count[21]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[21]~23_combout\ = (s_count(21) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~42_combout\)))) # (!s_count(21) & (\s_count[31]~3_combout\ & (\Add0~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(21),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~42_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[21]~23_combout\);

\s_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[21]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(21));

\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!s_count(18) & (!s_count(19) & (!s_count(20) & !s_count(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(18),
	datab => s_count(19),
	datac => s_count(20),
	datad => s_count(21),
	combout => \Equal0~5_combout\);

\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (s_count(22) & (\Add0~43\ $ (GND))) # (!s_count(22) & (!\Add0~43\ & VCC))
-- \Add0~45\ = CARRY((s_count(22) & !\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(22),
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

\s_count[22]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[22]~24_combout\ = (s_count(22) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~44_combout\)))) # (!s_count(22) & (\s_count[31]~3_combout\ & (\Add0~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(22),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~44_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[22]~24_combout\);

\s_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[22]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(22));

\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (s_count(23) & (!\Add0~45\)) # (!s_count(23) & ((\Add0~45\) # (GND)))
-- \Add0~47\ = CARRY((!\Add0~45\) # (!s_count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(23),
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

\s_count[23]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[23]~25_combout\ = (s_count(23) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~46_combout\)))) # (!s_count(23) & (\s_count[31]~3_combout\ & (\Add0~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(23),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~46_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[23]~25_combout\);

\s_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[23]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(23));

\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (s_count(24) & (\Add0~47\ $ (GND))) # (!s_count(24) & (!\Add0~47\ & VCC))
-- \Add0~49\ = CARRY((s_count(24) & !\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(24),
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

\s_count[24]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[24]~26_combout\ = (s_count(24) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~48_combout\)))) # (!s_count(24) & (\s_count[31]~3_combout\ & (\Add0~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(24),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~48_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[24]~26_combout\);

\s_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[24]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(24));

\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (s_count(25) & (!\Add0~49\)) # (!s_count(25) & ((\Add0~49\) # (GND)))
-- \Add0~51\ = CARRY((!\Add0~49\) # (!s_count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(25),
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

\s_count[25]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[25]~27_combout\ = (s_count(25) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~50_combout\)))) # (!s_count(25) & (\s_count[31]~3_combout\ & (\Add0~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(25),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~50_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[25]~27_combout\);

\s_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[25]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(25));

\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!s_count(22) & (!s_count(23) & (!s_count(24) & !s_count(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(22),
	datab => s_count(23),
	datac => s_count(24),
	datad => s_count(25),
	combout => \Equal0~6_combout\);

\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (s_count(26) & (\Add0~51\ $ (GND))) # (!s_count(26) & (!\Add0~51\ & VCC))
-- \Add0~53\ = CARRY((s_count(26) & !\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(26),
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

\s_count[26]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[26]~28_combout\ = (s_count(26) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~52_combout\)))) # (!s_count(26) & (\s_count[31]~3_combout\ & (\Add0~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(26),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~52_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[26]~28_combout\);

\s_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[26]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(26));

\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (s_count(27) & (!\Add0~53\)) # (!s_count(27) & ((\Add0~53\) # (GND)))
-- \Add0~55\ = CARRY((!\Add0~53\) # (!s_count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(27),
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

\s_count[27]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[27]~29_combout\ = (s_count(27) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~54_combout\)))) # (!s_count(27) & (\s_count[31]~3_combout\ & (\Add0~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(27),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~54_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[27]~29_combout\);

\s_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[27]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(27));

\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (s_count(28) & (\Add0~55\ $ (GND))) # (!s_count(28) & (!\Add0~55\ & VCC))
-- \Add0~57\ = CARRY((s_count(28) & !\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(28),
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

\s_count[28]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[28]~30_combout\ = (s_count(28) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~56_combout\)))) # (!s_count(28) & (\s_count[31]~3_combout\ & (\Add0~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(28),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~56_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[28]~30_combout\);

\s_count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[28]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(28));

\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (s_count(29) & (!\Add0~57\)) # (!s_count(29) & ((\Add0~57\) # (GND)))
-- \Add0~59\ = CARRY((!\Add0~57\) # (!s_count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(29),
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

\s_count[29]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[29]~31_combout\ = (s_count(29) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~58_combout\)))) # (!s_count(29) & (\s_count[31]~3_combout\ & (\Add0~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(29),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~58_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[29]~31_combout\);

\s_count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[29]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(29));

\Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!s_count(26) & (!s_count(27) & (!s_count(28) & !s_count(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(26),
	datab => s_count(27),
	datac => s_count(28),
	datad => s_count(29),
	combout => \Equal0~7_combout\);

\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (s_count(30) & (\Add0~59\ $ (GND))) # (!s_count(30) & (!\Add0~59\ & VCC))
-- \Add0~61\ = CARRY((s_count(30) & !\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(30),
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

\s_count[30]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[30]~33_combout\ = (s_count(30) & ((\s_count[0]~2_combout\) # ((\s_count[31]~3_combout\ & \Add0~60_combout\)))) # (!s_count(30) & (\s_count[31]~3_combout\ & (\Add0~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(30),
	datab => \s_count[31]~3_combout\,
	datac => \Add0~60_combout\,
	datad => \s_count[0]~2_combout\,
	combout => \s_count[30]~33_combout\);

\s_count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[30]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(30));

\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = s_count(31) $ (!\Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(31),
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

\s_count[31]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[31]~32_combout\ = (\s_count[31]~3_combout\ & (!\Add0~62_combout\ & ((s_count(31)) # (!\s_count[0]~2_combout\)))) # (!\s_count[31]~3_combout\ & (((s_count(31)) # (!\s_count[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_count[31]~3_combout\,
	datab => \Add0~62_combout\,
	datac => \s_count[0]~2_combout\,
	datad => s_count(31),
	combout => \s_count[31]~32_combout\);

\s_count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[31]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(31));

\Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (\Equal0~7_combout\ & (s_count(31) & !s_count(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~7_combout\,
	datab => s_count(31),
	datad => s_count(30),
	combout => \Equal0~8_combout\);

\Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~4_combout\ & (\Equal0~5_combout\ & (\Equal0~6_combout\ & \Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~5_combout\,
	datac => \Equal0~6_combout\,
	datad => \Equal0~8_combout\,
	combout => \Equal0~9_combout\);

\timerOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timerOut~0_combout\ = (\enable~input_o\ & (\Equal0~9_combout\ & (s_count(2) & !s_count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datab => \Equal0~9_combout\,
	datac => s_count(2),
	datad => s_count(0),
	combout => \timerOut~0_combout\);

\timerOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timerOut~1_combout\ = (!\reset~input_o\ & ((\timerOut~0_combout\) # ((\timerOut~reg0_q\ & !\enable~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timerOut~0_combout\,
	datab => \timerOut~reg0_q\,
	datac => \enable~input_o\,
	datad => \reset~input_o\,
	combout => \timerOut~1_combout\);

\timerOut~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \timerOut~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timerOut~reg0_q\);

ww_timerOut <= \timerOut~output_o\;
END structure;


