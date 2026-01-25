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

-- DATE "06/03/2024 14:49:18"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	HornoControlador IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(2 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(0 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(2 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX6 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END HornoControlador;

-- Design Ports Information
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF HornoControlador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \keys_debouncer|start_stop_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|start_stop_reg[1]~feeder_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \keys_debouncer|time_adjust_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|time_adjust_out~combout\ : std_logic;
SIGNAL \U2|td_val[0]~8_combout\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \keys_debouncer|reset_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|reset_out~combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \keys_debouncer|key_dec_reg[0]~feeder_combout\ : std_logic;
SIGNAL \U2|temp_val~24_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \U2|process_0~1_combout\ : std_logic;
SIGNAL \U2|td_val[0]~9\ : std_logic;
SIGNAL \U2|td_val[1]~10_combout\ : std_logic;
SIGNAL \U2|td_val[1]~11\ : std_logic;
SIGNAL \U2|td_val[2]~12_combout\ : std_logic;
SIGNAL \U2|td_val[2]~13\ : std_logic;
SIGNAL \U2|td_val[3]~14_combout\ : std_logic;
SIGNAL \U2|td_val[3]~15\ : std_logic;
SIGNAL \U2|td_val[4]~16_combout\ : std_logic;
SIGNAL \U2|td_val[4]~17\ : std_logic;
SIGNAL \U2|td_val[5]~18_combout\ : std_logic;
SIGNAL \U2|td_val[5]~19\ : std_logic;
SIGNAL \U2|td_val[6]~20_combout\ : std_logic;
SIGNAL \U2|td_val[6]~21\ : std_logic;
SIGNAL \U2|td_val[7]~22_combout\ : std_logic;
SIGNAL \U3|timer[0]~32_combout\ : std_logic;
SIGNAL \U3|timer[3]~36_combout\ : std_logic;
SIGNAL \U3|timer[3]~37_combout\ : std_logic;
SIGNAL \U3|timer[0]~33\ : std_logic;
SIGNAL \U3|timer[1]~34_combout\ : std_logic;
SIGNAL \U3|timer[1]~35\ : std_logic;
SIGNAL \U3|timer[2]~38_combout\ : std_logic;
SIGNAL \U3|timer[2]~39\ : std_logic;
SIGNAL \U3|timer[3]~40_combout\ : std_logic;
SIGNAL \U3|timer[3]~41\ : std_logic;
SIGNAL \U3|timer[4]~42_combout\ : std_logic;
SIGNAL \U3|timer[4]~43\ : std_logic;
SIGNAL \U3|timer[5]~44_combout\ : std_logic;
SIGNAL \U3|timer[5]~45\ : std_logic;
SIGNAL \U3|timer[6]~46_combout\ : std_logic;
SIGNAL \U3|timer[6]~47\ : std_logic;
SIGNAL \U3|timer[7]~48_combout\ : std_logic;
SIGNAL \U3|td[0]~0_combout\ : std_logic;
SIGNAL \U3|LessThan1~9_cout\ : std_logic;
SIGNAL \U3|LessThan1~11_cout\ : std_logic;
SIGNAL \U3|LessThan1~13_cout\ : std_logic;
SIGNAL \U3|LessThan1~15_cout\ : std_logic;
SIGNAL \U3|LessThan1~17_cout\ : std_logic;
SIGNAL \U3|LessThan1~19_cout\ : std_logic;
SIGNAL \U3|LessThan1~21_cout\ : std_logic;
SIGNAL \U3|LessThan1~22_combout\ : std_logic;
SIGNAL \U3|tf[31]~feeder_combout\ : std_logic;
SIGNAL \U3|timer[7]~49\ : std_logic;
SIGNAL \U3|timer[8]~50_combout\ : std_logic;
SIGNAL \U3|timer[8]~51\ : std_logic;
SIGNAL \U3|timer[9]~52_combout\ : std_logic;
SIGNAL \U3|timer[9]~53\ : std_logic;
SIGNAL \U3|timer[10]~54_combout\ : std_logic;
SIGNAL \U3|timer[10]~55\ : std_logic;
SIGNAL \U3|timer[11]~56_combout\ : std_logic;
SIGNAL \U3|timer[11]~57\ : std_logic;
SIGNAL \U3|timer[12]~58_combout\ : std_logic;
SIGNAL \U3|timer[12]~59\ : std_logic;
SIGNAL \U3|timer[13]~60_combout\ : std_logic;
SIGNAL \U3|timer[13]~61\ : std_logic;
SIGNAL \U3|timer[14]~62_combout\ : std_logic;
SIGNAL \U3|timer[14]~63\ : std_logic;
SIGNAL \U3|timer[15]~64_combout\ : std_logic;
SIGNAL \U3|timer[15]~65\ : std_logic;
SIGNAL \U3|timer[16]~66_combout\ : std_logic;
SIGNAL \U3|timer[16]~67\ : std_logic;
SIGNAL \U3|timer[17]~68_combout\ : std_logic;
SIGNAL \U3|timer[17]~69\ : std_logic;
SIGNAL \U3|timer[18]~70_combout\ : std_logic;
SIGNAL \U3|timer[18]~71\ : std_logic;
SIGNAL \U3|timer[19]~72_combout\ : std_logic;
SIGNAL \U3|timer[19]~73\ : std_logic;
SIGNAL \U3|timer[20]~74_combout\ : std_logic;
SIGNAL \U3|timer[20]~75\ : std_logic;
SIGNAL \U3|timer[21]~76_combout\ : std_logic;
SIGNAL \U3|timer[21]~77\ : std_logic;
SIGNAL \U3|timer[22]~78_combout\ : std_logic;
SIGNAL \U3|timer[22]~79\ : std_logic;
SIGNAL \U3|timer[23]~80_combout\ : std_logic;
SIGNAL \U3|timer[23]~81\ : std_logic;
SIGNAL \U3|timer[24]~82_combout\ : std_logic;
SIGNAL \U3|timer[24]~83\ : std_logic;
SIGNAL \U3|timer[25]~84_combout\ : std_logic;
SIGNAL \U3|timer[25]~85\ : std_logic;
SIGNAL \U3|timer[26]~86_combout\ : std_logic;
SIGNAL \U3|timer[26]~87\ : std_logic;
SIGNAL \U3|timer[27]~88_combout\ : std_logic;
SIGNAL \U3|timer[27]~89\ : std_logic;
SIGNAL \U3|timer[28]~90_combout\ : std_logic;
SIGNAL \U3|timer[28]~91\ : std_logic;
SIGNAL \U3|timer[29]~92_combout\ : std_logic;
SIGNAL \U3|timer[29]~93\ : std_logic;
SIGNAL \U3|timer[30]~94_combout\ : std_logic;
SIGNAL \U3|timer[30]~95\ : std_logic;
SIGNAL \U3|timer[31]~96_combout\ : std_logic;
SIGNAL \U3|LessThan1~24_combout\ : std_logic;
SIGNAL \U2|tf_val[0]~8_combout\ : std_logic;
SIGNAL \U2|process_0~2_combout\ : std_logic;
SIGNAL \U2|tf_val[0]~9\ : std_logic;
SIGNAL \U2|tf_val[1]~10_combout\ : std_logic;
SIGNAL \U2|tf_val[1]~11\ : std_logic;
SIGNAL \U2|tf_val[2]~12_combout\ : std_logic;
SIGNAL \U2|tf_val[2]~13\ : std_logic;
SIGNAL \U2|tf_val[3]~14_combout\ : std_logic;
SIGNAL \U3|tf[3]~feeder_combout\ : std_logic;
SIGNAL \U3|Equal0~1_combout\ : std_logic;
SIGNAL \U2|tf_val[3]~15\ : std_logic;
SIGNAL \U2|tf_val[4]~16_combout\ : std_logic;
SIGNAL \U2|tf_val[4]~17\ : std_logic;
SIGNAL \U2|tf_val[5]~18_combout\ : std_logic;
SIGNAL \U3|tf[5]~feeder_combout\ : std_logic;
SIGNAL \U3|Equal0~2_combout\ : std_logic;
SIGNAL \U2|tf_val[5]~19\ : std_logic;
SIGNAL \U2|tf_val[6]~20_combout\ : std_logic;
SIGNAL \U2|tf_val[6]~21\ : std_logic;
SIGNAL \U2|tf_val[7]~22_combout\ : std_logic;
SIGNAL \U3|tf[7]~feeder_combout\ : std_logic;
SIGNAL \U3|Equal0~3_combout\ : std_logic;
SIGNAL \U3|tf[0]~0_combout\ : std_logic;
SIGNAL \U3|Equal0~0_combout\ : std_logic;
SIGNAL \U3|Equal0~4_combout\ : std_logic;
SIGNAL \U3|LessThan1~1_combout\ : std_logic;
SIGNAL \U3|LessThan1~3_combout\ : std_logic;
SIGNAL \U3|LessThan1~2_combout\ : std_logic;
SIGNAL \U3|LessThan1~0_combout\ : std_logic;
SIGNAL \U3|LessThan1~4_combout\ : std_logic;
SIGNAL \U3|LessThan1~5_combout\ : std_logic;
SIGNAL \U3|LessThan1~6_combout\ : std_logic;
SIGNAL \U3|LessThan1~7_combout\ : std_logic;
SIGNAL \U3|process_0~0_combout\ : std_logic;
SIGNAL \U3|Selector1~0_combout\ : std_logic;
SIGNAL \U3|state.IDLE~0_combout\ : std_logic;
SIGNAL \U3|state.IDLE~1_combout\ : std_logic;
SIGNAL \U3|state.IDLE~q\ : std_logic;
SIGNAL \U3|Selector1~1_combout\ : std_logic;
SIGNAL \U3|Selector1~2_combout\ : std_logic;
SIGNAL \U3|state.COOKING~q\ : std_logic;
SIGNAL \U3|Selector2~3_combout\ : std_logic;
SIGNAL \U3|Selector2~2_combout\ : std_logic;
SIGNAL \U3|state.DONE~q\ : std_logic;
SIGNAL \U3|led_alert~0_combout\ : std_logic;
SIGNAL \U3|led_alert~q\ : std_logic;
SIGNAL \U2|temp_val[0]~8_combout\ : std_logic;
SIGNAL \U2|process_0~0_combout\ : std_logic;
SIGNAL \U2|temp_val[0]~9\ : std_logic;
SIGNAL \U2|temp_val[1]~10_combout\ : std_logic;
SIGNAL \U2|temp_val[1]~11\ : std_logic;
SIGNAL \U2|temp_val[2]~12_combout\ : std_logic;
SIGNAL \U2|temp_val[2]~13\ : std_logic;
SIGNAL \U2|temp_val[3]~14_combout\ : std_logic;
SIGNAL \U2|temp_val[3]~15\ : std_logic;
SIGNAL \U2|temp_val[4]~16_combout\ : std_logic;
SIGNAL \U2|temp_val[4]~17\ : std_logic;
SIGNAL \U2|temp_val[5]~18_combout\ : std_logic;
SIGNAL \U2|temp_val[5]~19\ : std_logic;
SIGNAL \U2|temp_val[6]~20_combout\ : std_logic;
SIGNAL \U2|temp_val[6]~21\ : std_logic;
SIGNAL \U2|temp_val[7]~22_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~11_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~12_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~10_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~5_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~4_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_ones[1]~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_ones[3]~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_ones[2]~1_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~25_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~26_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~27_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~28_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~30_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~31_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~9_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~6_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~14_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|LessThan0~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~8_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|LessThan0~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~9_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~13_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~6_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~15_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd~7_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_tens[1]~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_tens[0]~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_tens[3]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_temp|bcd_tens[2]~0_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~42_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~43_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~14_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~11_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~7_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~41_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~11_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~12_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~10_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~4_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~5_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_ones[2]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_ones[3]~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_ones[1]~2_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~25_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~26_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~27_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~28_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~30_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~31_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~9_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~6_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~14_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|LessThan0~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|LessThan0~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~8_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~9_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~13_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~7_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~6_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd~15_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_tens[1]~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_tens[3]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_tens[0]~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_td|bcd_tens[2]~0_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~42_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~43_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~11_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~14_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~7_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~41_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~12_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~11_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~10_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~4_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~5_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_ones[3]~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_ones[2]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_ones[1]~2_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~28_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~30_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~25_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~26_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~27_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~31_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~9_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~6_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~13_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|LessThan0~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~14_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~6_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|LessThan0~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~7_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~15_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~8_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd~9_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_tens[3]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_tens[2]~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_tens[0]~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_tf|bcd_tens[1]~2_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~42_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~43_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~7_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~11_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~15_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~14_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~41_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~39_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~40_combout\ : std_logic;
SIGNAL \U1|current_temp[0]~32_combout\ : std_logic;
SIGNAL \U1|Add0~1\ : std_logic;
SIGNAL \U1|Add0~3\ : std_logic;
SIGNAL \U1|Add0~5\ : std_logic;
SIGNAL \U1|Add0~7\ : std_logic;
SIGNAL \U1|Add0~9\ : std_logic;
SIGNAL \U1|Add0~11\ : std_logic;
SIGNAL \U1|Add0~13\ : std_logic;
SIGNAL \U1|Add0~14_combout\ : std_logic;
SIGNAL \U1|Add0~12_combout\ : std_logic;
SIGNAL \U1|Add0~10_combout\ : std_logic;
SIGNAL \U1|Add0~8_combout\ : std_logic;
SIGNAL \U1|Add0~6_combout\ : std_logic;
SIGNAL \U1|Add0~4_combout\ : std_logic;
SIGNAL \U1|Add0~2_combout\ : std_logic;
SIGNAL \U1|Add0~0_combout\ : std_logic;
SIGNAL \U1|target_temp[0]~0_combout\ : std_logic;
SIGNAL \U1|LessThan0~1_cout\ : std_logic;
SIGNAL \U1|LessThan0~3_cout\ : std_logic;
SIGNAL \U1|LessThan0~5_cout\ : std_logic;
SIGNAL \U1|LessThan0~7_cout\ : std_logic;
SIGNAL \U1|LessThan0~9_cout\ : std_logic;
SIGNAL \U1|LessThan0~11_cout\ : std_logic;
SIGNAL \U1|LessThan0~13_cout\ : std_logic;
SIGNAL \U1|LessThan0~15_cout\ : std_logic;
SIGNAL \U1|LessThan0~17_cout\ : std_logic;
SIGNAL \U1|LessThan0~19_cout\ : std_logic;
SIGNAL \U1|LessThan0~21_cout\ : std_logic;
SIGNAL \U1|LessThan0~23_cout\ : std_logic;
SIGNAL \U1|LessThan0~25_cout\ : std_logic;
SIGNAL \U1|LessThan0~27_cout\ : std_logic;
SIGNAL \U1|LessThan0~29_cout\ : std_logic;
SIGNAL \U1|LessThan0~31_cout\ : std_logic;
SIGNAL \U1|LessThan0~33_cout\ : std_logic;
SIGNAL \U1|LessThan0~35_cout\ : std_logic;
SIGNAL \U1|LessThan0~37_cout\ : std_logic;
SIGNAL \U1|LessThan0~39_cout\ : std_logic;
SIGNAL \U1|LessThan0~41_cout\ : std_logic;
SIGNAL \U1|LessThan0~43_cout\ : std_logic;
SIGNAL \U1|LessThan0~45_cout\ : std_logic;
SIGNAL \U1|LessThan0~47_cout\ : std_logic;
SIGNAL \U1|LessThan0~49_cout\ : std_logic;
SIGNAL \U1|LessThan0~51_cout\ : std_logic;
SIGNAL \U1|LessThan0~53_cout\ : std_logic;
SIGNAL \U1|LessThan0~55_cout\ : std_logic;
SIGNAL \U1|LessThan0~57_cout\ : std_logic;
SIGNAL \U1|LessThan0~59_cout\ : std_logic;
SIGNAL \U1|LessThan0~61_cout\ : std_logic;
SIGNAL \U1|LessThan0~62_combout\ : std_logic;
SIGNAL \U1|current_temp~48_combout\ : std_logic;
SIGNAL \U1|current_temp[0]~33\ : std_logic;
SIGNAL \U1|current_temp[1]~34_combout\ : std_logic;
SIGNAL \U1|current_temp[1]~35\ : std_logic;
SIGNAL \U1|current_temp[2]~36_combout\ : std_logic;
SIGNAL \U1|current_temp[2]~37\ : std_logic;
SIGNAL \U1|current_temp[3]~38_combout\ : std_logic;
SIGNAL \U1|current_temp[3]~39\ : std_logic;
SIGNAL \U1|current_temp[4]~40_combout\ : std_logic;
SIGNAL \U1|current_temp[4]~41\ : std_logic;
SIGNAL \U1|current_temp[5]~42_combout\ : std_logic;
SIGNAL \U1|current_temp[5]~43\ : std_logic;
SIGNAL \U1|current_temp[6]~45\ : std_logic;
SIGNAL \U1|current_temp[7]~46_combout\ : std_logic;
SIGNAL \U1|current_temp[7]~47\ : std_logic;
SIGNAL \U1|current_temp[8]~49_combout\ : std_logic;
SIGNAL \U1|current_temp[8]~50\ : std_logic;
SIGNAL \U1|current_temp[9]~51_combout\ : std_logic;
SIGNAL \U1|current_temp[9]~52\ : std_logic;
SIGNAL \U1|current_temp[10]~53_combout\ : std_logic;
SIGNAL \U1|current_temp[10]~54\ : std_logic;
SIGNAL \U1|current_temp[11]~55_combout\ : std_logic;
SIGNAL \U1|current_temp[11]~56\ : std_logic;
SIGNAL \U1|current_temp[12]~57_combout\ : std_logic;
SIGNAL \U1|current_temp[12]~58\ : std_logic;
SIGNAL \U1|current_temp[13]~59_combout\ : std_logic;
SIGNAL \U1|current_temp[13]~60\ : std_logic;
SIGNAL \U1|current_temp[14]~61_combout\ : std_logic;
SIGNAL \U1|current_temp[14]~62\ : std_logic;
SIGNAL \U1|current_temp[15]~63_combout\ : std_logic;
SIGNAL \U1|current_temp[15]~64\ : std_logic;
SIGNAL \U1|current_temp[16]~65_combout\ : std_logic;
SIGNAL \U1|current_temp[16]~66\ : std_logic;
SIGNAL \U1|current_temp[17]~67_combout\ : std_logic;
SIGNAL \U1|current_temp[17]~68\ : std_logic;
SIGNAL \U1|current_temp[18]~69_combout\ : std_logic;
SIGNAL \U1|current_temp[18]~70\ : std_logic;
SIGNAL \U1|current_temp[19]~71_combout\ : std_logic;
SIGNAL \U1|current_temp[19]~72\ : std_logic;
SIGNAL \U1|current_temp[20]~73_combout\ : std_logic;
SIGNAL \U1|current_temp[20]~74\ : std_logic;
SIGNAL \U1|current_temp[21]~75_combout\ : std_logic;
SIGNAL \U1|current_temp[21]~76\ : std_logic;
SIGNAL \U1|current_temp[22]~77_combout\ : std_logic;
SIGNAL \U1|current_temp[22]~78\ : std_logic;
SIGNAL \U1|current_temp[23]~79_combout\ : std_logic;
SIGNAL \U1|current_temp[23]~80\ : std_logic;
SIGNAL \U1|current_temp[24]~81_combout\ : std_logic;
SIGNAL \U1|current_temp[24]~82\ : std_logic;
SIGNAL \U1|current_temp[25]~83_combout\ : std_logic;
SIGNAL \U1|current_temp[25]~84\ : std_logic;
SIGNAL \U1|current_temp[26]~85_combout\ : std_logic;
SIGNAL \U1|current_temp[26]~86\ : std_logic;
SIGNAL \U1|current_temp[27]~87_combout\ : std_logic;
SIGNAL \U1|current_temp[27]~88\ : std_logic;
SIGNAL \U1|current_temp[28]~89_combout\ : std_logic;
SIGNAL \U1|current_temp[28]~90\ : std_logic;
SIGNAL \U1|current_temp[29]~91_combout\ : std_logic;
SIGNAL \U1|current_temp[29]~92\ : std_logic;
SIGNAL \U1|current_temp[30]~93_combout\ : std_logic;
SIGNAL \U1|current_temp[30]~94\ : std_logic;
SIGNAL \U1|current_temp[31]~95_combout\ : std_logic;
SIGNAL \U1|Add2~1\ : std_logic;
SIGNAL \U1|Add2~3\ : std_logic;
SIGNAL \U1|Add2~5\ : std_logic;
SIGNAL \U1|Add2~7\ : std_logic;
SIGNAL \U1|Add2~9\ : std_logic;
SIGNAL \U1|Add2~11\ : std_logic;
SIGNAL \U1|Add2~13\ : std_logic;
SIGNAL \U1|Add2~15\ : std_logic;
SIGNAL \U1|Add2~17\ : std_logic;
SIGNAL \U1|Add2~19\ : std_logic;
SIGNAL \U1|Add2~21\ : std_logic;
SIGNAL \U1|Add2~23\ : std_logic;
SIGNAL \U1|Add2~25\ : std_logic;
SIGNAL \U1|Add2~27\ : std_logic;
SIGNAL \U1|Add2~29\ : std_logic;
SIGNAL \U1|Add2~31\ : std_logic;
SIGNAL \U1|Add2~33\ : std_logic;
SIGNAL \U1|Add2~35\ : std_logic;
SIGNAL \U1|Add2~37\ : std_logic;
SIGNAL \U1|Add2~39\ : std_logic;
SIGNAL \U1|Add2~41\ : std_logic;
SIGNAL \U1|Add2~43\ : std_logic;
SIGNAL \U1|Add2~45\ : std_logic;
SIGNAL \U1|Add2~47\ : std_logic;
SIGNAL \U1|Add2~49\ : std_logic;
SIGNAL \U1|Add2~51\ : std_logic;
SIGNAL \U1|Add2~53\ : std_logic;
SIGNAL \U1|Add2~55\ : std_logic;
SIGNAL \U1|Add2~57\ : std_logic;
SIGNAL \U1|Add2~59\ : std_logic;
SIGNAL \U1|Add2~60_combout\ : std_logic;
SIGNAL \U1|Add2~58_combout\ : std_logic;
SIGNAL \U1|Add2~56_combout\ : std_logic;
SIGNAL \U1|Add2~54_combout\ : std_logic;
SIGNAL \U1|Add2~52_combout\ : std_logic;
SIGNAL \U1|Add2~50_combout\ : std_logic;
SIGNAL \U1|Add2~48_combout\ : std_logic;
SIGNAL \U1|Add2~46_combout\ : std_logic;
SIGNAL \U1|Add2~44_combout\ : std_logic;
SIGNAL \U1|Add2~42_combout\ : std_logic;
SIGNAL \U1|Add2~40_combout\ : std_logic;
SIGNAL \U1|Add2~38_combout\ : std_logic;
SIGNAL \U1|Add2~36_combout\ : std_logic;
SIGNAL \U1|Add2~34_combout\ : std_logic;
SIGNAL \U1|Add2~32_combout\ : std_logic;
SIGNAL \U1|Add2~30_combout\ : std_logic;
SIGNAL \U1|Add2~28_combout\ : std_logic;
SIGNAL \U1|Add2~26_combout\ : std_logic;
SIGNAL \U1|Add2~24_combout\ : std_logic;
SIGNAL \U1|Add2~22_combout\ : std_logic;
SIGNAL \U1|Add2~20_combout\ : std_logic;
SIGNAL \U1|Add2~18_combout\ : std_logic;
SIGNAL \U1|Add2~16_combout\ : std_logic;
SIGNAL \U1|Add2~14_combout\ : std_logic;
SIGNAL \U1|Add2~12_combout\ : std_logic;
SIGNAL \U1|Add2~10_combout\ : std_logic;
SIGNAL \U1|Add2~8_combout\ : std_logic;
SIGNAL \U1|Add2~6_combout\ : std_logic;
SIGNAL \U1|Add2~4_combout\ : std_logic;
SIGNAL \U1|Add2~2_combout\ : std_logic;
SIGNAL \U1|Add2~0_combout\ : std_logic;
SIGNAL \U1|LessThan1~1_cout\ : std_logic;
SIGNAL \U1|LessThan1~3_cout\ : std_logic;
SIGNAL \U1|LessThan1~5_cout\ : std_logic;
SIGNAL \U1|LessThan1~7_cout\ : std_logic;
SIGNAL \U1|LessThan1~9_cout\ : std_logic;
SIGNAL \U1|LessThan1~11_cout\ : std_logic;
SIGNAL \U1|LessThan1~13_cout\ : std_logic;
SIGNAL \U1|LessThan1~15_cout\ : std_logic;
SIGNAL \U1|LessThan1~17_cout\ : std_logic;
SIGNAL \U1|LessThan1~19_cout\ : std_logic;
SIGNAL \U1|LessThan1~21_cout\ : std_logic;
SIGNAL \U1|LessThan1~23_cout\ : std_logic;
SIGNAL \U1|LessThan1~25_cout\ : std_logic;
SIGNAL \U1|LessThan1~27_cout\ : std_logic;
SIGNAL \U1|LessThan1~29_cout\ : std_logic;
SIGNAL \U1|LessThan1~31_cout\ : std_logic;
SIGNAL \U1|LessThan1~33_cout\ : std_logic;
SIGNAL \U1|LessThan1~35_cout\ : std_logic;
SIGNAL \U1|LessThan1~37_cout\ : std_logic;
SIGNAL \U1|LessThan1~39_cout\ : std_logic;
SIGNAL \U1|LessThan1~41_cout\ : std_logic;
SIGNAL \U1|LessThan1~43_cout\ : std_logic;
SIGNAL \U1|LessThan1~45_cout\ : std_logic;
SIGNAL \U1|LessThan1~47_cout\ : std_logic;
SIGNAL \U1|LessThan1~49_cout\ : std_logic;
SIGNAL \U1|LessThan1~51_cout\ : std_logic;
SIGNAL \U1|LessThan1~53_cout\ : std_logic;
SIGNAL \U1|LessThan1~55_cout\ : std_logic;
SIGNAL \U1|LessThan1~57_cout\ : std_logic;
SIGNAL \U1|LessThan1~59_cout\ : std_logic;
SIGNAL \U1|LessThan1~61_cout\ : std_logic;
SIGNAL \U1|LessThan1~62_combout\ : std_logic;
SIGNAL \U1|heating~0_combout\ : std_logic;
SIGNAL \U1|heating~q\ : std_logic;
SIGNAL \U1|current_temp[6]~44_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~8_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~7_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~6_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~0_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~4_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~5_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd~3_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ : std_logic;
SIGNAL \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~23_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~24_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~26_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~27_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~25_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~28_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~29_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~30_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~32_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~31_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~33_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~34_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~35_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~8_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~9_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~6_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~19_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~20_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~12_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~21_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~22_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~38_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~36_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~37_combout\ : std_logic;
SIGNAL \U2|temp_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U2|td_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|td\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U2|tf_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \keys_debouncer|reset_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U3|timer\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U1|current_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \keys_debouncer|start_stop_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \keys_debouncer|time_adjust_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \keys_debouncer|key_dec_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U3|tf\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U1|target_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|ALT_INV_state.COOKING~q\ : std_logic;
SIGNAL \keys_debouncer|ALT_INV_reset_out~combout\ : std_logic;
SIGNAL \HEX6_inst|ALT_INV_decOut_n~36_combout\ : std_logic;
SIGNAL \HEX6_inst|ALT_INV_decOut_n~34_combout\ : std_logic;
SIGNAL \HEX5_inst|ALT_INV_decOut_n~39_combout\ : std_logic;
SIGNAL \HEX5_inst|ALT_INV_decOut_n~37_combout\ : std_logic;
SIGNAL \HEX4_inst|ALT_INV_decOut_n~34_combout\ : std_logic;
SIGNAL \HEX4_inst|ALT_INV_decOut_n~32_combout\ : std_logic;
SIGNAL \HEX3_inst|ALT_INV_decOut_n~39_combout\ : std_logic;
SIGNAL \HEX3_inst|ALT_INV_decOut_n~37_combout\ : std_logic;
SIGNAL \HEX2_inst|ALT_INV_decOut_n~34_combout\ : std_logic;
SIGNAL \HEX2_inst|ALT_INV_decOut_n~32_combout\ : std_logic;
SIGNAL \HEX1_inst|ALT_INV_decOut_n~39_combout\ : std_logic;
SIGNAL \HEX1_inst|ALT_INV_decOut_n~37_combout\ : std_logic;
SIGNAL \HEX0_inst|ALT_INV_decOut_n~34_combout\ : std_logic;
SIGNAL \HEX0_inst|ALT_INV_decOut_n~32_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\U3|ALT_INV_state.COOKING~q\ <= NOT \U3|state.COOKING~q\;
\keys_debouncer|ALT_INV_reset_out~combout\ <= NOT \keys_debouncer|reset_out~combout\;
\HEX6_inst|ALT_INV_decOut_n~36_combout\ <= NOT \HEX6_inst|decOut_n~36_combout\;
\HEX6_inst|ALT_INV_decOut_n~34_combout\ <= NOT \HEX6_inst|decOut_n~34_combout\;
\HEX5_inst|ALT_INV_decOut_n~39_combout\ <= NOT \HEX5_inst|decOut_n~39_combout\;
\HEX5_inst|ALT_INV_decOut_n~37_combout\ <= NOT \HEX5_inst|decOut_n~37_combout\;
\HEX4_inst|ALT_INV_decOut_n~34_combout\ <= NOT \HEX4_inst|decOut_n~34_combout\;
\HEX4_inst|ALT_INV_decOut_n~32_combout\ <= NOT \HEX4_inst|decOut_n~32_combout\;
\HEX3_inst|ALT_INV_decOut_n~39_combout\ <= NOT \HEX3_inst|decOut_n~39_combout\;
\HEX3_inst|ALT_INV_decOut_n~37_combout\ <= NOT \HEX3_inst|decOut_n~37_combout\;
\HEX2_inst|ALT_INV_decOut_n~34_combout\ <= NOT \HEX2_inst|decOut_n~34_combout\;
\HEX2_inst|ALT_INV_decOut_n~32_combout\ <= NOT \HEX2_inst|decOut_n~32_combout\;
\HEX1_inst|ALT_INV_decOut_n~39_combout\ <= NOT \HEX1_inst|decOut_n~39_combout\;
\HEX1_inst|ALT_INV_decOut_n~37_combout\ <= NOT \HEX1_inst|decOut_n~37_combout\;
\HEX0_inst|ALT_INV_decOut_n~34_combout\ <= NOT \HEX0_inst|decOut_n~34_combout\;
\HEX0_inst|ALT_INV_decOut_n~32_combout\ <= NOT \HEX0_inst|decOut_n~32_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U3|led_alert~q\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|decOut_n~23_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|decOut_n~31_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|ALT_INV_decOut_n~32_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|decOut_n~33_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|ALT_INV_decOut_n~34_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_inst|decOut_n~35_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|decOut_n~43_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|ALT_INV_decOut_n~37_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|decOut_n~38_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|decOut_n~41_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|ALT_INV_decOut_n~39_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_inst|decOut_n~40_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|decOut_n~23_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|decOut_n~31_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|ALT_INV_decOut_n~32_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|decOut_n~33_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|ALT_INV_decOut_n~34_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_inst|decOut_n~35_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|decOut_n~43_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|ALT_INV_decOut_n~37_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|decOut_n~38_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|decOut_n~41_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|ALT_INV_decOut_n~39_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_inst|decOut_n~40_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|decOut_n~23_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|decOut_n~31_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|ALT_INV_decOut_n~32_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|decOut_n~33_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|ALT_INV_decOut_n~34_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_inst|decOut_n~35_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|decOut_n~43_combout\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|ALT_INV_decOut_n~37_combout\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|decOut_n~38_combout\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|decOut_n~41_combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|ALT_INV_decOut_n~39_combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_inst|decOut_n~40_combout\,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|decOut_n~23_combout\,
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|decOut_n~33_combout\,
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|ALT_INV_decOut_n~34_combout\,
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|decOut_n~35_combout\,
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|decOut_n~38_combout\,
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|ALT_INV_decOut_n~36_combout\,
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX6_inst|decOut_n~37_combout\,
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X91_Y21_N18
\keys_debouncer|start_stop_reg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|start_stop_reg[0]~feeder_combout\ = \KEY[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[0]~input_o\,
	combout => \keys_debouncer|start_stop_reg[0]~feeder_combout\);

-- Location: FF_X91_Y21_N19
\keys_debouncer|start_stop_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|start_stop_reg[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|start_stop_reg\(0));

-- Location: LCCOMB_X91_Y21_N22
\keys_debouncer|start_stop_reg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|start_stop_reg[1]~feeder_combout\ = \keys_debouncer|start_stop_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keys_debouncer|start_stop_reg\(0),
	combout => \keys_debouncer|start_stop_reg[1]~feeder_combout\);

-- Location: FF_X91_Y21_N23
\keys_debouncer|start_stop_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|start_stop_reg[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|start_stop_reg\(1));

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X107_Y21_N8
\keys_debouncer|time_adjust_reg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|time_adjust_reg[0]~feeder_combout\ = \KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[1]~input_o\,
	combout => \keys_debouncer|time_adjust_reg[0]~feeder_combout\);

-- Location: FF_X107_Y21_N9
\keys_debouncer|time_adjust_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|time_adjust_reg[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|time_adjust_reg\(0));

-- Location: FF_X107_Y21_N31
\keys_debouncer|time_adjust_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keys_debouncer|time_adjust_reg\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|time_adjust_reg\(1));

-- Location: LCCOMB_X107_Y21_N30
\keys_debouncer|time_adjust_out\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|time_adjust_out~combout\ = (\keys_debouncer|time_adjust_reg\(0) & !\keys_debouncer|time_adjust_reg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keys_debouncer|time_adjust_reg\(0),
	datac => \keys_debouncer|time_adjust_reg\(1),
	combout => \keys_debouncer|time_adjust_out~combout\);

-- Location: LCCOMB_X92_Y21_N12
\U2|td_val[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[0]~8_combout\ = \U2|td_val\(0) $ (VCC)
-- \U2|td_val[0]~9\ = CARRY(\U2|td_val\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datad => VCC,
	combout => \U2|td_val[0]~8_combout\,
	cout => \U2|td_val[0]~9\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LCCOMB_X88_Y21_N28
\keys_debouncer|reset_reg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|reset_reg[0]~feeder_combout\ = \KEY[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[3]~input_o\,
	combout => \keys_debouncer|reset_reg[0]~feeder_combout\);

-- Location: FF_X88_Y21_N29
\keys_debouncer|reset_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|reset_reg[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|reset_reg\(0));

-- Location: FF_X88_Y21_N31
\keys_debouncer|reset_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keys_debouncer|reset_reg\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|reset_reg\(1));

-- Location: LCCOMB_X88_Y21_N30
\keys_debouncer|reset_out\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|reset_out~combout\ = (!\keys_debouncer|reset_reg\(1) & \keys_debouncer|reset_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keys_debouncer|reset_reg\(1),
	datad => \keys_debouncer|reset_reg\(0),
	combout => \keys_debouncer|reset_out~combout\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LCCOMB_X107_Y21_N12
\keys_debouncer|key_dec_reg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|key_dec_reg[0]~feeder_combout\ = \KEY[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[2]~input_o\,
	combout => \keys_debouncer|key_dec_reg[0]~feeder_combout\);

-- Location: FF_X107_Y21_N13
\keys_debouncer|key_dec_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|key_dec_reg[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|key_dec_reg\(0));

-- Location: FF_X107_Y21_N19
\keys_debouncer|key_dec_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keys_debouncer|key_dec_reg\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|key_dec_reg\(1));

-- Location: LCCOMB_X107_Y21_N18
\U2|temp_val~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val~24_combout\ = (\keys_debouncer|time_adjust_reg\(1) & (((!\keys_debouncer|key_dec_reg\(1) & \keys_debouncer|key_dec_reg\(0))))) # (!\keys_debouncer|time_adjust_reg\(1) & ((\keys_debouncer|time_adjust_reg\(0)) # 
-- ((!\keys_debouncer|key_dec_reg\(1) & \keys_debouncer|key_dec_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_reg\(1),
	datab => \keys_debouncer|time_adjust_reg\(0),
	datac => \keys_debouncer|key_dec_reg\(1),
	datad => \keys_debouncer|key_dec_reg\(0),
	combout => \U2|temp_val~24_combout\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LCCOMB_X107_Y21_N22
\U2|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~1_combout\ = (\U2|temp_val~24_combout\ & (!\SW[1]~input_o\ & \SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val~24_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~1_combout\);

-- Location: FF_X92_Y21_N13
\U2|td_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[0]~8_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(0));

-- Location: LCCOMB_X92_Y21_N14
\U2|td_val[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[1]~10_combout\ = (\U2|td_val\(1) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[0]~9\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|td_val[0]~9\ & VCC)))) # (!\U2|td_val\(1) & ((\keys_debouncer|time_adjust_out~combout\ & 
-- ((\U2|td_val[0]~9\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[0]~9\))))
-- \U2|td_val[1]~11\ = CARRY((\U2|td_val\(1) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[0]~9\)) # (!\U2|td_val\(1) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|td_val[0]~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(1),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[0]~9\,
	combout => \U2|td_val[1]~10_combout\,
	cout => \U2|td_val[1]~11\);

-- Location: FF_X92_Y21_N15
\U2|td_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[1]~10_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(1));

-- Location: LCCOMB_X92_Y21_N16
\U2|td_val[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[2]~12_combout\ = ((\U2|td_val\(2) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|td_val[1]~11\)))) # (GND)
-- \U2|td_val[2]~13\ = CARRY((\U2|td_val\(2) & ((!\U2|td_val[1]~11\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|td_val\(2) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[1]~11\,
	combout => \U2|td_val[2]~12_combout\,
	cout => \U2|td_val[2]~13\);

-- Location: FF_X92_Y21_N17
\U2|td_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[2]~12_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(2));

-- Location: LCCOMB_X92_Y21_N18
\U2|td_val[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[3]~14_combout\ = (\U2|td_val\(3) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[2]~13\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|td_val[2]~13\ & VCC)))) # (!\U2|td_val\(3) & ((\keys_debouncer|time_adjust_out~combout\ & 
-- ((\U2|td_val[2]~13\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[2]~13\))))
-- \U2|td_val[3]~15\ = CARRY((\U2|td_val\(3) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[2]~13\)) # (!\U2|td_val\(3) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|td_val[2]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[2]~13\,
	combout => \U2|td_val[3]~14_combout\,
	cout => \U2|td_val[3]~15\);

-- Location: FF_X92_Y21_N19
\U2|td_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[3]~14_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(3));

-- Location: LCCOMB_X92_Y21_N20
\U2|td_val[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[4]~16_combout\ = ((\U2|td_val\(4) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|td_val[3]~15\)))) # (GND)
-- \U2|td_val[4]~17\ = CARRY((\U2|td_val\(4) & ((!\U2|td_val[3]~15\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|td_val\(4) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(4),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[3]~15\,
	combout => \U2|td_val[4]~16_combout\,
	cout => \U2|td_val[4]~17\);

-- Location: FF_X92_Y21_N21
\U2|td_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[4]~16_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(4));

-- Location: LCCOMB_X92_Y21_N22
\U2|td_val[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[5]~18_combout\ = (\U2|td_val\(5) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[4]~17\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|td_val[4]~17\ & VCC)))) # (!\U2|td_val\(5) & ((\keys_debouncer|time_adjust_out~combout\ & 
-- ((\U2|td_val[4]~17\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|td_val[4]~17\))))
-- \U2|td_val[5]~19\ = CARRY((\U2|td_val\(5) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[4]~17\)) # (!\U2|td_val\(5) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|td_val[4]~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[4]~17\,
	combout => \U2|td_val[5]~18_combout\,
	cout => \U2|td_val[5]~19\);

-- Location: FF_X92_Y21_N23
\U2|td_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[5]~18_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(5));

-- Location: LCCOMB_X92_Y21_N24
\U2|td_val[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[6]~20_combout\ = ((\U2|td_val\(6) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|td_val[5]~19\)))) # (GND)
-- \U2|td_val[6]~21\ = CARRY((\U2|td_val\(6) & ((!\U2|td_val[5]~19\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|td_val\(6) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|td_val[5]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|td_val[5]~19\,
	combout => \U2|td_val[6]~20_combout\,
	cout => \U2|td_val[6]~21\);

-- Location: FF_X92_Y21_N25
\U2|td_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[6]~20_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(6));

-- Location: LCCOMB_X92_Y21_N26
\U2|td_val[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[7]~22_combout\ = \U2|td_val\(7) $ (\keys_debouncer|time_adjust_out~combout\ $ (!\U2|td_val[6]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \keys_debouncer|time_adjust_out~combout\,
	cin => \U2|td_val[6]~21\,
	combout => \U2|td_val[7]~22_combout\);

-- Location: FF_X92_Y21_N27
\U2|td_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|td_val[7]~22_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|td_val\(7));

-- Location: FF_X90_Y20_N15
\U3|td[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(7),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(7));

-- Location: LCCOMB_X89_Y22_N0
\U3|timer[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[0]~32_combout\ = \U3|timer\(0) $ (VCC)
-- \U3|timer[0]~33\ = CARRY(\U3|timer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(0),
	datad => VCC,
	combout => \U3|timer[0]~32_combout\,
	cout => \U3|timer[0]~33\);

-- Location: LCCOMB_X91_Y21_N24
\U3|timer[3]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[3]~36_combout\ = ((\keys_debouncer|start_stop_reg\(1)) # (\U3|state.IDLE~q\)) # (!\keys_debouncer|start_stop_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keys_debouncer|start_stop_reg\(0),
	datac => \keys_debouncer|start_stop_reg\(1),
	datad => \U3|state.IDLE~q\,
	combout => \U3|timer[3]~36_combout\);

-- Location: LCCOMB_X90_Y21_N2
\U3|timer[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[3]~37_combout\ = ((\U3|state.COOKING~q\ & !\U3|process_0~0_combout\)) # (!\U3|timer[3]~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.COOKING~q\,
	datab => \U3|timer[3]~36_combout\,
	datad => \U3|process_0~0_combout\,
	combout => \U3|timer[3]~37_combout\);

-- Location: FF_X89_Y22_N1
\U3|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[0]~32_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(0));

-- Location: LCCOMB_X89_Y22_N2
\U3|timer[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[1]~34_combout\ = (\U3|timer\(1) & (!\U3|timer[0]~33\)) # (!\U3|timer\(1) & ((\U3|timer[0]~33\) # (GND)))
-- \U3|timer[1]~35\ = CARRY((!\U3|timer[0]~33\) # (!\U3|timer\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(1),
	datad => VCC,
	cin => \U3|timer[0]~33\,
	combout => \U3|timer[1]~34_combout\,
	cout => \U3|timer[1]~35\);

-- Location: FF_X89_Y22_N3
\U3|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[1]~34_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(1));

-- Location: LCCOMB_X89_Y22_N4
\U3|timer[2]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[2]~38_combout\ = (\U3|timer\(2) & (\U3|timer[1]~35\ $ (GND))) # (!\U3|timer\(2) & (!\U3|timer[1]~35\ & VCC))
-- \U3|timer[2]~39\ = CARRY((\U3|timer\(2) & !\U3|timer[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(2),
	datad => VCC,
	cin => \U3|timer[1]~35\,
	combout => \U3|timer[2]~38_combout\,
	cout => \U3|timer[2]~39\);

-- Location: FF_X89_Y22_N5
\U3|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[2]~38_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(2));

-- Location: LCCOMB_X89_Y22_N6
\U3|timer[3]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[3]~40_combout\ = (\U3|timer\(3) & (!\U3|timer[2]~39\)) # (!\U3|timer\(3) & ((\U3|timer[2]~39\) # (GND)))
-- \U3|timer[3]~41\ = CARRY((!\U3|timer[2]~39\) # (!\U3|timer\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(3),
	datad => VCC,
	cin => \U3|timer[2]~39\,
	combout => \U3|timer[3]~40_combout\,
	cout => \U3|timer[3]~41\);

-- Location: FF_X89_Y22_N7
\U3|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[3]~40_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(3));

-- Location: LCCOMB_X89_Y22_N8
\U3|timer[4]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[4]~42_combout\ = (\U3|timer\(4) & (\U3|timer[3]~41\ $ (GND))) # (!\U3|timer\(4) & (!\U3|timer[3]~41\ & VCC))
-- \U3|timer[4]~43\ = CARRY((\U3|timer\(4) & !\U3|timer[3]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(4),
	datad => VCC,
	cin => \U3|timer[3]~41\,
	combout => \U3|timer[4]~42_combout\,
	cout => \U3|timer[4]~43\);

-- Location: FF_X89_Y22_N9
\U3|timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[4]~42_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(4));

-- Location: LCCOMB_X89_Y22_N10
\U3|timer[5]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[5]~44_combout\ = (\U3|timer\(5) & (!\U3|timer[4]~43\)) # (!\U3|timer\(5) & ((\U3|timer[4]~43\) # (GND)))
-- \U3|timer[5]~45\ = CARRY((!\U3|timer[4]~43\) # (!\U3|timer\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(5),
	datad => VCC,
	cin => \U3|timer[4]~43\,
	combout => \U3|timer[5]~44_combout\,
	cout => \U3|timer[5]~45\);

-- Location: FF_X89_Y22_N11
\U3|timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[5]~44_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(5));

-- Location: LCCOMB_X89_Y22_N12
\U3|timer[6]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[6]~46_combout\ = (\U3|timer\(6) & (\U3|timer[5]~45\ $ (GND))) # (!\U3|timer\(6) & (!\U3|timer[5]~45\ & VCC))
-- \U3|timer[6]~47\ = CARRY((\U3|timer\(6) & !\U3|timer[5]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(6),
	datad => VCC,
	cin => \U3|timer[5]~45\,
	combout => \U3|timer[6]~46_combout\,
	cout => \U3|timer[6]~47\);

-- Location: FF_X89_Y22_N13
\U3|timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[6]~46_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(6));

-- Location: LCCOMB_X89_Y22_N14
\U3|timer[7]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[7]~48_combout\ = (\U3|timer\(7) & (!\U3|timer[6]~47\)) # (!\U3|timer\(7) & ((\U3|timer[6]~47\) # (GND)))
-- \U3|timer[7]~49\ = CARRY((!\U3|timer[6]~47\) # (!\U3|timer\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(7),
	datad => VCC,
	cin => \U3|timer[6]~47\,
	combout => \U3|timer[7]~48_combout\,
	cout => \U3|timer[7]~49\);

-- Location: FF_X89_Y22_N15
\U3|timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[7]~48_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(7));

-- Location: FF_X90_Y20_N13
\U3|td[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(6),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(6));

-- Location: FF_X90_Y20_N11
\U3|td[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(5),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(5));

-- Location: FF_X90_Y20_N9
\U3|td[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(4),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(4));

-- Location: FF_X90_Y20_N7
\U3|td[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(3),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(3));

-- Location: FF_X90_Y20_N5
\U3|td[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(2),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(2));

-- Location: FF_X90_Y20_N3
\U3|td[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|td_val\(1),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(1));

-- Location: LCCOMB_X90_Y20_N24
\U3|td[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|td[0]~0_combout\ = !\U2|td_val\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|td_val\(0),
	combout => \U3|td[0]~0_combout\);

-- Location: FF_X90_Y20_N25
\U3|td[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|td[0]~0_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(0));

-- Location: LCCOMB_X90_Y20_N0
\U3|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~9_cout\ = CARRY((!\U3|td\(0) & !\U3|timer\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|td\(0),
	datab => \U3|timer\(0),
	datad => VCC,
	cout => \U3|LessThan1~9_cout\);

-- Location: LCCOMB_X90_Y20_N2
\U3|LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~11_cout\ = CARRY((\U3|timer\(1) & ((!\U3|LessThan1~9_cout\) # (!\U3|td\(1)))) # (!\U3|timer\(1) & (!\U3|td\(1) & !\U3|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(1),
	datab => \U3|td\(1),
	datad => VCC,
	cin => \U3|LessThan1~9_cout\,
	cout => \U3|LessThan1~11_cout\);

-- Location: LCCOMB_X90_Y20_N4
\U3|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~13_cout\ = CARRY((\U3|timer\(2) & (\U3|td\(2) & !\U3|LessThan1~11_cout\)) # (!\U3|timer\(2) & ((\U3|td\(2)) # (!\U3|LessThan1~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(2),
	datab => \U3|td\(2),
	datad => VCC,
	cin => \U3|LessThan1~11_cout\,
	cout => \U3|LessThan1~13_cout\);

-- Location: LCCOMB_X90_Y20_N6
\U3|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~15_cout\ = CARRY((\U3|td\(3) & (\U3|timer\(3) & !\U3|LessThan1~13_cout\)) # (!\U3|td\(3) & ((\U3|timer\(3)) # (!\U3|LessThan1~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|td\(3),
	datab => \U3|timer\(3),
	datad => VCC,
	cin => \U3|LessThan1~13_cout\,
	cout => \U3|LessThan1~15_cout\);

-- Location: LCCOMB_X90_Y20_N8
\U3|LessThan1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~17_cout\ = CARRY((\U3|timer\(4) & (\U3|td\(4) & !\U3|LessThan1~15_cout\)) # (!\U3|timer\(4) & ((\U3|td\(4)) # (!\U3|LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(4),
	datab => \U3|td\(4),
	datad => VCC,
	cin => \U3|LessThan1~15_cout\,
	cout => \U3|LessThan1~17_cout\);

-- Location: LCCOMB_X90_Y20_N10
\U3|LessThan1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~19_cout\ = CARRY((\U3|td\(5) & (\U3|timer\(5) & !\U3|LessThan1~17_cout\)) # (!\U3|td\(5) & ((\U3|timer\(5)) # (!\U3|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|td\(5),
	datab => \U3|timer\(5),
	datad => VCC,
	cin => \U3|LessThan1~17_cout\,
	cout => \U3|LessThan1~19_cout\);

-- Location: LCCOMB_X90_Y20_N12
\U3|LessThan1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~21_cout\ = CARRY((\U3|timer\(6) & (\U3|td\(6) & !\U3|LessThan1~19_cout\)) # (!\U3|timer\(6) & ((\U3|td\(6)) # (!\U3|LessThan1~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(6),
	datab => \U3|td\(6),
	datad => VCC,
	cin => \U3|LessThan1~19_cout\,
	cout => \U3|LessThan1~21_cout\);

-- Location: LCCOMB_X90_Y20_N14
\U3|LessThan1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~22_combout\ = (\U3|td\(7) & ((\U3|LessThan1~21_cout\) # (!\U3|timer\(7)))) # (!\U3|td\(7) & (\U3|LessThan1~21_cout\ & !\U3|timer\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|td\(7),
	datad => \U3|timer\(7),
	cin => \U3|LessThan1~21_cout\,
	combout => \U3|LessThan1~22_combout\);

-- Location: LCCOMB_X90_Y21_N8
\U3|tf[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[31]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \U3|tf[31]~feeder_combout\);

-- Location: FF_X90_Y21_N9
\U3|tf[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[31]~feeder_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(31));

-- Location: LCCOMB_X89_Y22_N16
\U3|timer[8]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[8]~50_combout\ = (\U3|timer\(8) & (\U3|timer[7]~49\ $ (GND))) # (!\U3|timer\(8) & (!\U3|timer[7]~49\ & VCC))
-- \U3|timer[8]~51\ = CARRY((\U3|timer\(8) & !\U3|timer[7]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(8),
	datad => VCC,
	cin => \U3|timer[7]~49\,
	combout => \U3|timer[8]~50_combout\,
	cout => \U3|timer[8]~51\);

-- Location: FF_X89_Y22_N17
\U3|timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[8]~50_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(8));

-- Location: LCCOMB_X89_Y22_N18
\U3|timer[9]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[9]~52_combout\ = (\U3|timer\(9) & (!\U3|timer[8]~51\)) # (!\U3|timer\(9) & ((\U3|timer[8]~51\) # (GND)))
-- \U3|timer[9]~53\ = CARRY((!\U3|timer[8]~51\) # (!\U3|timer\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(9),
	datad => VCC,
	cin => \U3|timer[8]~51\,
	combout => \U3|timer[9]~52_combout\,
	cout => \U3|timer[9]~53\);

-- Location: FF_X89_Y22_N19
\U3|timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[9]~52_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(9));

-- Location: LCCOMB_X89_Y22_N20
\U3|timer[10]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[10]~54_combout\ = (\U3|timer\(10) & (\U3|timer[9]~53\ $ (GND))) # (!\U3|timer\(10) & (!\U3|timer[9]~53\ & VCC))
-- \U3|timer[10]~55\ = CARRY((\U3|timer\(10) & !\U3|timer[9]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(10),
	datad => VCC,
	cin => \U3|timer[9]~53\,
	combout => \U3|timer[10]~54_combout\,
	cout => \U3|timer[10]~55\);

-- Location: FF_X89_Y22_N21
\U3|timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[10]~54_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(10));

-- Location: LCCOMB_X89_Y22_N22
\U3|timer[11]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[11]~56_combout\ = (\U3|timer\(11) & (!\U3|timer[10]~55\)) # (!\U3|timer\(11) & ((\U3|timer[10]~55\) # (GND)))
-- \U3|timer[11]~57\ = CARRY((!\U3|timer[10]~55\) # (!\U3|timer\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(11),
	datad => VCC,
	cin => \U3|timer[10]~55\,
	combout => \U3|timer[11]~56_combout\,
	cout => \U3|timer[11]~57\);

-- Location: FF_X89_Y22_N23
\U3|timer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[11]~56_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(11));

-- Location: LCCOMB_X89_Y22_N24
\U3|timer[12]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[12]~58_combout\ = (\U3|timer\(12) & (\U3|timer[11]~57\ $ (GND))) # (!\U3|timer\(12) & (!\U3|timer[11]~57\ & VCC))
-- \U3|timer[12]~59\ = CARRY((\U3|timer\(12) & !\U3|timer[11]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(12),
	datad => VCC,
	cin => \U3|timer[11]~57\,
	combout => \U3|timer[12]~58_combout\,
	cout => \U3|timer[12]~59\);

-- Location: FF_X89_Y22_N25
\U3|timer[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[12]~58_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(12));

-- Location: LCCOMB_X89_Y22_N26
\U3|timer[13]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[13]~60_combout\ = (\U3|timer\(13) & (!\U3|timer[12]~59\)) # (!\U3|timer\(13) & ((\U3|timer[12]~59\) # (GND)))
-- \U3|timer[13]~61\ = CARRY((!\U3|timer[12]~59\) # (!\U3|timer\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(13),
	datad => VCC,
	cin => \U3|timer[12]~59\,
	combout => \U3|timer[13]~60_combout\,
	cout => \U3|timer[13]~61\);

-- Location: FF_X89_Y22_N27
\U3|timer[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[13]~60_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(13));

-- Location: LCCOMB_X89_Y22_N28
\U3|timer[14]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[14]~62_combout\ = (\U3|timer\(14) & (\U3|timer[13]~61\ $ (GND))) # (!\U3|timer\(14) & (!\U3|timer[13]~61\ & VCC))
-- \U3|timer[14]~63\ = CARRY((\U3|timer\(14) & !\U3|timer[13]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(14),
	datad => VCC,
	cin => \U3|timer[13]~61\,
	combout => \U3|timer[14]~62_combout\,
	cout => \U3|timer[14]~63\);

-- Location: FF_X89_Y22_N29
\U3|timer[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[14]~62_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(14));

-- Location: LCCOMB_X89_Y22_N30
\U3|timer[15]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[15]~64_combout\ = (\U3|timer\(15) & (!\U3|timer[14]~63\)) # (!\U3|timer\(15) & ((\U3|timer[14]~63\) # (GND)))
-- \U3|timer[15]~65\ = CARRY((!\U3|timer[14]~63\) # (!\U3|timer\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(15),
	datad => VCC,
	cin => \U3|timer[14]~63\,
	combout => \U3|timer[15]~64_combout\,
	cout => \U3|timer[15]~65\);

-- Location: FF_X89_Y22_N31
\U3|timer[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[15]~64_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(15));

-- Location: LCCOMB_X89_Y21_N0
\U3|timer[16]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[16]~66_combout\ = (\U3|timer\(16) & (\U3|timer[15]~65\ $ (GND))) # (!\U3|timer\(16) & (!\U3|timer[15]~65\ & VCC))
-- \U3|timer[16]~67\ = CARRY((\U3|timer\(16) & !\U3|timer[15]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(16),
	datad => VCC,
	cin => \U3|timer[15]~65\,
	combout => \U3|timer[16]~66_combout\,
	cout => \U3|timer[16]~67\);

-- Location: FF_X89_Y21_N1
\U3|timer[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[16]~66_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(16));

-- Location: LCCOMB_X89_Y21_N2
\U3|timer[17]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[17]~68_combout\ = (\U3|timer\(17) & (!\U3|timer[16]~67\)) # (!\U3|timer\(17) & ((\U3|timer[16]~67\) # (GND)))
-- \U3|timer[17]~69\ = CARRY((!\U3|timer[16]~67\) # (!\U3|timer\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(17),
	datad => VCC,
	cin => \U3|timer[16]~67\,
	combout => \U3|timer[17]~68_combout\,
	cout => \U3|timer[17]~69\);

-- Location: FF_X89_Y21_N3
\U3|timer[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[17]~68_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(17));

-- Location: LCCOMB_X89_Y21_N4
\U3|timer[18]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[18]~70_combout\ = (\U3|timer\(18) & (\U3|timer[17]~69\ $ (GND))) # (!\U3|timer\(18) & (!\U3|timer[17]~69\ & VCC))
-- \U3|timer[18]~71\ = CARRY((\U3|timer\(18) & !\U3|timer[17]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(18),
	datad => VCC,
	cin => \U3|timer[17]~69\,
	combout => \U3|timer[18]~70_combout\,
	cout => \U3|timer[18]~71\);

-- Location: FF_X89_Y21_N5
\U3|timer[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[18]~70_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(18));

-- Location: LCCOMB_X89_Y21_N6
\U3|timer[19]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[19]~72_combout\ = (\U3|timer\(19) & (!\U3|timer[18]~71\)) # (!\U3|timer\(19) & ((\U3|timer[18]~71\) # (GND)))
-- \U3|timer[19]~73\ = CARRY((!\U3|timer[18]~71\) # (!\U3|timer\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(19),
	datad => VCC,
	cin => \U3|timer[18]~71\,
	combout => \U3|timer[19]~72_combout\,
	cout => \U3|timer[19]~73\);

-- Location: FF_X89_Y21_N7
\U3|timer[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[19]~72_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(19));

-- Location: LCCOMB_X89_Y21_N8
\U3|timer[20]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[20]~74_combout\ = (\U3|timer\(20) & (\U3|timer[19]~73\ $ (GND))) # (!\U3|timer\(20) & (!\U3|timer[19]~73\ & VCC))
-- \U3|timer[20]~75\ = CARRY((\U3|timer\(20) & !\U3|timer[19]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(20),
	datad => VCC,
	cin => \U3|timer[19]~73\,
	combout => \U3|timer[20]~74_combout\,
	cout => \U3|timer[20]~75\);

-- Location: FF_X89_Y21_N9
\U3|timer[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[20]~74_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(20));

-- Location: LCCOMB_X89_Y21_N10
\U3|timer[21]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[21]~76_combout\ = (\U3|timer\(21) & (!\U3|timer[20]~75\)) # (!\U3|timer\(21) & ((\U3|timer[20]~75\) # (GND)))
-- \U3|timer[21]~77\ = CARRY((!\U3|timer[20]~75\) # (!\U3|timer\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(21),
	datad => VCC,
	cin => \U3|timer[20]~75\,
	combout => \U3|timer[21]~76_combout\,
	cout => \U3|timer[21]~77\);

-- Location: FF_X89_Y21_N11
\U3|timer[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[21]~76_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(21));

-- Location: LCCOMB_X89_Y21_N12
\U3|timer[22]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[22]~78_combout\ = (\U3|timer\(22) & (\U3|timer[21]~77\ $ (GND))) # (!\U3|timer\(22) & (!\U3|timer[21]~77\ & VCC))
-- \U3|timer[22]~79\ = CARRY((\U3|timer\(22) & !\U3|timer[21]~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(22),
	datad => VCC,
	cin => \U3|timer[21]~77\,
	combout => \U3|timer[22]~78_combout\,
	cout => \U3|timer[22]~79\);

-- Location: FF_X89_Y21_N13
\U3|timer[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[22]~78_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(22));

-- Location: LCCOMB_X89_Y21_N14
\U3|timer[23]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[23]~80_combout\ = (\U3|timer\(23) & (!\U3|timer[22]~79\)) # (!\U3|timer\(23) & ((\U3|timer[22]~79\) # (GND)))
-- \U3|timer[23]~81\ = CARRY((!\U3|timer[22]~79\) # (!\U3|timer\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(23),
	datad => VCC,
	cin => \U3|timer[22]~79\,
	combout => \U3|timer[23]~80_combout\,
	cout => \U3|timer[23]~81\);

-- Location: FF_X89_Y21_N15
\U3|timer[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[23]~80_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(23));

-- Location: LCCOMB_X89_Y21_N16
\U3|timer[24]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[24]~82_combout\ = (\U3|timer\(24) & (\U3|timer[23]~81\ $ (GND))) # (!\U3|timer\(24) & (!\U3|timer[23]~81\ & VCC))
-- \U3|timer[24]~83\ = CARRY((\U3|timer\(24) & !\U3|timer[23]~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(24),
	datad => VCC,
	cin => \U3|timer[23]~81\,
	combout => \U3|timer[24]~82_combout\,
	cout => \U3|timer[24]~83\);

-- Location: FF_X89_Y21_N17
\U3|timer[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[24]~82_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(24));

-- Location: LCCOMB_X89_Y21_N18
\U3|timer[25]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[25]~84_combout\ = (\U3|timer\(25) & (!\U3|timer[24]~83\)) # (!\U3|timer\(25) & ((\U3|timer[24]~83\) # (GND)))
-- \U3|timer[25]~85\ = CARRY((!\U3|timer[24]~83\) # (!\U3|timer\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(25),
	datad => VCC,
	cin => \U3|timer[24]~83\,
	combout => \U3|timer[25]~84_combout\,
	cout => \U3|timer[25]~85\);

-- Location: FF_X89_Y21_N19
\U3|timer[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[25]~84_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(25));

-- Location: LCCOMB_X89_Y21_N20
\U3|timer[26]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[26]~86_combout\ = (\U3|timer\(26) & (\U3|timer[25]~85\ $ (GND))) # (!\U3|timer\(26) & (!\U3|timer[25]~85\ & VCC))
-- \U3|timer[26]~87\ = CARRY((\U3|timer\(26) & !\U3|timer[25]~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(26),
	datad => VCC,
	cin => \U3|timer[25]~85\,
	combout => \U3|timer[26]~86_combout\,
	cout => \U3|timer[26]~87\);

-- Location: FF_X89_Y21_N21
\U3|timer[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[26]~86_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(26));

-- Location: LCCOMB_X89_Y21_N22
\U3|timer[27]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[27]~88_combout\ = (\U3|timer\(27) & (!\U3|timer[26]~87\)) # (!\U3|timer\(27) & ((\U3|timer[26]~87\) # (GND)))
-- \U3|timer[27]~89\ = CARRY((!\U3|timer[26]~87\) # (!\U3|timer\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(27),
	datad => VCC,
	cin => \U3|timer[26]~87\,
	combout => \U3|timer[27]~88_combout\,
	cout => \U3|timer[27]~89\);

-- Location: FF_X89_Y21_N23
\U3|timer[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[27]~88_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(27));

-- Location: LCCOMB_X89_Y21_N24
\U3|timer[28]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[28]~90_combout\ = (\U3|timer\(28) & (\U3|timer[27]~89\ $ (GND))) # (!\U3|timer\(28) & (!\U3|timer[27]~89\ & VCC))
-- \U3|timer[28]~91\ = CARRY((\U3|timer\(28) & !\U3|timer[27]~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(28),
	datad => VCC,
	cin => \U3|timer[27]~89\,
	combout => \U3|timer[28]~90_combout\,
	cout => \U3|timer[28]~91\);

-- Location: FF_X89_Y21_N25
\U3|timer[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[28]~90_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(28));

-- Location: LCCOMB_X89_Y21_N26
\U3|timer[29]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[29]~92_combout\ = (\U3|timer\(29) & (!\U3|timer[28]~91\)) # (!\U3|timer\(29) & ((\U3|timer[28]~91\) # (GND)))
-- \U3|timer[29]~93\ = CARRY((!\U3|timer[28]~91\) # (!\U3|timer\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(29),
	datad => VCC,
	cin => \U3|timer[28]~91\,
	combout => \U3|timer[29]~92_combout\,
	cout => \U3|timer[29]~93\);

-- Location: FF_X89_Y21_N27
\U3|timer[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[29]~92_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(29));

-- Location: LCCOMB_X89_Y21_N28
\U3|timer[30]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[30]~94_combout\ = (\U3|timer\(30) & (\U3|timer[29]~93\ $ (GND))) # (!\U3|timer\(30) & (!\U3|timer[29]~93\ & VCC))
-- \U3|timer[30]~95\ = CARRY((\U3|timer\(30) & !\U3|timer[29]~93\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|timer\(30),
	datad => VCC,
	cin => \U3|timer[29]~93\,
	combout => \U3|timer[30]~94_combout\,
	cout => \U3|timer[30]~95\);

-- Location: FF_X89_Y21_N29
\U3|timer[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[30]~94_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(30));

-- Location: LCCOMB_X89_Y21_N30
\U3|timer[31]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[31]~96_combout\ = \U3|timer\(31) $ (\U3|timer[30]~95\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(31),
	cin => \U3|timer[30]~95\,
	combout => \U3|timer[31]~96_combout\);

-- Location: FF_X89_Y21_N31
\U3|timer[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|timer[31]~96_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sclr => \U3|ALT_INV_state.COOKING~q\,
	ena => \U3|timer[3]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(31));

-- Location: LCCOMB_X90_Y21_N14
\U3|LessThan1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~24_combout\ = (\U3|tf\(31) & \U3|timer\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U3|tf\(31),
	datad => \U3|timer\(31),
	combout => \U3|LessThan1~24_combout\);

-- Location: LCCOMB_X86_Y21_N8
\U2|tf_val[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[0]~8_combout\ = \U2|tf_val\(0) $ (VCC)
-- \U2|tf_val[0]~9\ = CARRY(\U2|tf_val\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|tf_val\(0),
	datad => VCC,
	combout => \U2|tf_val[0]~8_combout\,
	cout => \U2|tf_val[0]~9\);

-- Location: LCCOMB_X107_Y21_N24
\U2|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~2_combout\ = (\U2|temp_val~24_combout\ & (\SW[1]~input_o\ & !\SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val~24_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~2_combout\);

-- Location: FF_X86_Y21_N9
\U2|tf_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[0]~8_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(0));

-- Location: LCCOMB_X86_Y21_N10
\U2|tf_val[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[1]~10_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(1) & (!\U2|tf_val[0]~9\)) # (!\U2|tf_val\(1) & ((\U2|tf_val[0]~9\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(1) & (\U2|tf_val[0]~9\ & 
-- VCC)) # (!\U2|tf_val\(1) & (!\U2|tf_val[0]~9\))))
-- \U2|tf_val[1]~11\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|tf_val[0]~9\) # (!\U2|tf_val\(1)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|tf_val\(1) & !\U2|tf_val[0]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(1),
	datad => VCC,
	cin => \U2|tf_val[0]~9\,
	combout => \U2|tf_val[1]~10_combout\,
	cout => \U2|tf_val[1]~11\);

-- Location: FF_X86_Y21_N11
\U2|tf_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[1]~10_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(1));

-- Location: LCCOMB_X86_Y21_N12
\U2|tf_val[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[2]~12_combout\ = ((\keys_debouncer|time_adjust_out~combout\ $ (\U2|tf_val\(2) $ (\U2|tf_val[1]~11\)))) # (GND)
-- \U2|tf_val[2]~13\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & (\U2|tf_val\(2) & !\U2|tf_val[1]~11\)) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(2)) # (!\U2|tf_val[1]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(2),
	datad => VCC,
	cin => \U2|tf_val[1]~11\,
	combout => \U2|tf_val[2]~12_combout\,
	cout => \U2|tf_val[2]~13\);

-- Location: FF_X86_Y21_N13
\U2|tf_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[2]~12_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(2));

-- Location: FF_X90_Y20_N29
\U3|tf[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|tf_val\(2),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(2));

-- Location: LCCOMB_X86_Y21_N14
\U2|tf_val[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[3]~14_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(3) & (!\U2|tf_val[2]~13\)) # (!\U2|tf_val\(3) & ((\U2|tf_val[2]~13\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(3) & (\U2|tf_val[2]~13\ & 
-- VCC)) # (!\U2|tf_val\(3) & (!\U2|tf_val[2]~13\))))
-- \U2|tf_val[3]~15\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|tf_val[2]~13\) # (!\U2|tf_val\(3)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|tf_val\(3) & !\U2|tf_val[2]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(3),
	datad => VCC,
	cin => \U2|tf_val[2]~13\,
	combout => \U2|tf_val[3]~14_combout\,
	cout => \U2|tf_val[3]~15\);

-- Location: FF_X86_Y21_N15
\U2|tf_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[3]~14_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(3));

-- Location: LCCOMB_X90_Y20_N18
\U3|tf[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[3]~feeder_combout\ = \U2|tf_val\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|tf_val\(3),
	combout => \U3|tf[3]~feeder_combout\);

-- Location: FF_X90_Y20_N19
\U3|tf[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[3]~feeder_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(3));

-- Location: LCCOMB_X90_Y20_N28
\U3|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~1_combout\ = (\U3|timer\(2) & (\U3|tf\(2) & (\U3|timer\(3) $ (!\U3|tf\(3))))) # (!\U3|timer\(2) & (!\U3|tf\(2) & (\U3|timer\(3) $ (!\U3|tf\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(2),
	datab => \U3|timer\(3),
	datac => \U3|tf\(2),
	datad => \U3|tf\(3),
	combout => \U3|Equal0~1_combout\);

-- Location: LCCOMB_X86_Y21_N16
\U2|tf_val[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[4]~16_combout\ = ((\keys_debouncer|time_adjust_out~combout\ $ (\U2|tf_val\(4) $ (\U2|tf_val[3]~15\)))) # (GND)
-- \U2|tf_val[4]~17\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & (\U2|tf_val\(4) & !\U2|tf_val[3]~15\)) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(4)) # (!\U2|tf_val[3]~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(4),
	datad => VCC,
	cin => \U2|tf_val[3]~15\,
	combout => \U2|tf_val[4]~16_combout\,
	cout => \U2|tf_val[4]~17\);

-- Location: FF_X86_Y21_N17
\U2|tf_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[4]~16_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(4));

-- Location: FF_X90_Y20_N21
\U3|tf[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|tf_val\(4),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(4));

-- Location: LCCOMB_X86_Y21_N18
\U2|tf_val[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[5]~18_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(5) & (!\U2|tf_val[4]~17\)) # (!\U2|tf_val\(5) & ((\U2|tf_val[4]~17\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(5) & (\U2|tf_val[4]~17\ & 
-- VCC)) # (!\U2|tf_val\(5) & (!\U2|tf_val[4]~17\))))
-- \U2|tf_val[5]~19\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|tf_val[4]~17\) # (!\U2|tf_val\(5)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|tf_val\(5) & !\U2|tf_val[4]~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(5),
	datad => VCC,
	cin => \U2|tf_val[4]~17\,
	combout => \U2|tf_val[5]~18_combout\,
	cout => \U2|tf_val[5]~19\);

-- Location: FF_X86_Y21_N19
\U2|tf_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[5]~18_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(5));

-- Location: LCCOMB_X90_Y20_N30
\U3|tf[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[5]~feeder_combout\ = \U2|tf_val\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|tf_val\(5),
	combout => \U3|tf[5]~feeder_combout\);

-- Location: FF_X90_Y20_N31
\U3|tf[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[5]~feeder_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(5));

-- Location: LCCOMB_X90_Y20_N20
\U3|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~2_combout\ = (\U3|timer\(4) & (\U3|tf\(4) & (\U3|timer\(5) $ (!\U3|tf\(5))))) # (!\U3|timer\(4) & (!\U3|tf\(4) & (\U3|timer\(5) $ (!\U3|tf\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(4),
	datab => \U3|timer\(5),
	datac => \U3|tf\(4),
	datad => \U3|tf\(5),
	combout => \U3|Equal0~2_combout\);

-- Location: LCCOMB_X86_Y21_N20
\U2|tf_val[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[6]~20_combout\ = ((\keys_debouncer|time_adjust_out~combout\ $ (\U2|tf_val\(6) $ (\U2|tf_val[5]~19\)))) # (GND)
-- \U2|tf_val[6]~21\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & (\U2|tf_val\(6) & !\U2|tf_val[5]~19\)) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|tf_val\(6)) # (!\U2|tf_val[5]~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|tf_val\(6),
	datad => VCC,
	cin => \U2|tf_val[5]~19\,
	combout => \U2|tf_val[6]~20_combout\,
	cout => \U2|tf_val[6]~21\);

-- Location: FF_X86_Y21_N21
\U2|tf_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[6]~20_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(6));

-- Location: FF_X90_Y21_N31
\U3|tf[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|tf_val\(6),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(6));

-- Location: LCCOMB_X86_Y21_N22
\U2|tf_val[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[7]~22_combout\ = \U2|tf_val\(7) $ (\U2|tf_val[6]~21\ $ (!\keys_debouncer|time_adjust_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(7),
	datad => \keys_debouncer|time_adjust_out~combout\,
	cin => \U2|tf_val[6]~21\,
	combout => \U2|tf_val[7]~22_combout\);

-- Location: FF_X86_Y21_N23
\U2|tf_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|tf_val[7]~22_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|tf_val\(7));

-- Location: LCCOMB_X90_Y21_N12
\U3|tf[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[7]~feeder_combout\ = \U2|tf_val\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|tf_val\(7),
	combout => \U3|tf[7]~feeder_combout\);

-- Location: FF_X90_Y21_N13
\U3|tf[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[7]~feeder_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(7));

-- Location: LCCOMB_X90_Y21_N30
\U3|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~3_combout\ = (\U3|timer\(6) & (\U3|tf\(6) & (\U3|timer\(7) $ (!\U3|tf\(7))))) # (!\U3|timer\(6) & (!\U3|tf\(6) & (\U3|timer\(7) $ (!\U3|tf\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(6),
	datab => \U3|timer\(7),
	datac => \U3|tf\(6),
	datad => \U3|tf\(7),
	combout => \U3|Equal0~3_combout\);

-- Location: LCCOMB_X90_Y20_N26
\U3|tf[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[0]~0_combout\ = !\U2|tf_val\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|tf_val\(0),
	combout => \U3|tf[0]~0_combout\);

-- Location: FF_X90_Y20_N27
\U3|tf[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[0]~0_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(0));

-- Location: FF_X90_Y20_N17
\U3|tf[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|tf_val\(1),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(1));

-- Location: LCCOMB_X90_Y20_N16
\U3|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~0_combout\ = (\U3|tf\(0) & (!\U3|timer\(0) & (\U3|timer\(1) $ (!\U3|tf\(1))))) # (!\U3|tf\(0) & (\U3|timer\(0) & (\U3|timer\(1) $ (!\U3|tf\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|tf\(0),
	datab => \U3|timer\(1),
	datac => \U3|tf\(1),
	datad => \U3|timer\(0),
	combout => \U3|Equal0~0_combout\);

-- Location: LCCOMB_X90_Y21_N26
\U3|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~4_combout\ = (\U3|Equal0~1_combout\ & (\U3|Equal0~2_combout\ & (\U3|Equal0~3_combout\ & \U3|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Equal0~1_combout\,
	datab => \U3|Equal0~2_combout\,
	datac => \U3|Equal0~3_combout\,
	datad => \U3|Equal0~0_combout\,
	combout => \U3|Equal0~4_combout\);

-- Location: LCCOMB_X90_Y22_N4
\U3|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~1_combout\ = (!\U3|timer\(11) & (!\U3|timer\(12) & (!\U3|timer\(13) & !\U3|timer\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(11),
	datab => \U3|timer\(12),
	datac => \U3|timer\(13),
	datad => \U3|timer\(10),
	combout => \U3|LessThan1~1_combout\);

-- Location: LCCOMB_X90_Y21_N16
\U3|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~3_combout\ = (!\U3|timer\(21) & (!\U3|timer\(18) & (!\U3|timer\(19) & !\U3|timer\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(21),
	datab => \U3|timer\(18),
	datac => \U3|timer\(19),
	datad => \U3|timer\(20),
	combout => \U3|LessThan1~3_combout\);

-- Location: LCCOMB_X90_Y21_N22
\U3|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~2_combout\ = (!\U3|timer\(16) & (!\U3|timer\(15) & (!\U3|timer\(14) & !\U3|timer\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(16),
	datab => \U3|timer\(15),
	datac => \U3|timer\(14),
	datad => \U3|timer\(17),
	combout => \U3|LessThan1~2_combout\);

-- Location: LCCOMB_X90_Y21_N28
\U3|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~0_combout\ = (!\U3|timer\(8) & (!\U3|timer\(9) & (\U3|timer\(31) $ (\U3|tf\(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(8),
	datab => \U3|timer\(31),
	datac => \U3|tf\(31),
	datad => \U3|timer\(9),
	combout => \U3|LessThan1~0_combout\);

-- Location: LCCOMB_X90_Y21_N6
\U3|LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~4_combout\ = (\U3|LessThan1~1_combout\ & (\U3|LessThan1~3_combout\ & (\U3|LessThan1~2_combout\ & \U3|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|LessThan1~1_combout\,
	datab => \U3|LessThan1~3_combout\,
	datac => \U3|LessThan1~2_combout\,
	datad => \U3|LessThan1~0_combout\,
	combout => \U3|LessThan1~4_combout\);

-- Location: LCCOMB_X90_Y21_N4
\U3|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~5_combout\ = (!\U3|timer\(23) & (!\U3|timer\(25) & (!\U3|timer\(24) & !\U3|timer\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(23),
	datab => \U3|timer\(25),
	datac => \U3|timer\(24),
	datad => \U3|timer\(22),
	combout => \U3|LessThan1~5_combout\);

-- Location: LCCOMB_X90_Y21_N10
\U3|LessThan1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~6_combout\ = (!\U3|timer\(29) & (!\U3|timer\(27) & (!\U3|timer\(26) & !\U3|timer\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(29),
	datab => \U3|timer\(27),
	datac => \U3|timer\(26),
	datad => \U3|timer\(28),
	combout => \U3|LessThan1~6_combout\);

-- Location: LCCOMB_X90_Y21_N20
\U3|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~7_combout\ = (\U3|LessThan1~4_combout\ & (!\U3|timer\(30) & (\U3|LessThan1~5_combout\ & \U3|LessThan1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|LessThan1~4_combout\,
	datab => \U3|timer\(30),
	datac => \U3|LessThan1~5_combout\,
	datad => \U3|LessThan1~6_combout\,
	combout => \U3|LessThan1~7_combout\);

-- Location: LCCOMB_X90_Y21_N24
\U3|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|process_0~0_combout\ = (\U3|LessThan1~7_combout\ & ((\U3|Equal0~4_combout\) # ((!\U3|LessThan1~22_combout\ & !\U3|LessThan1~24_combout\)))) # (!\U3|LessThan1~7_combout\ & (((!\U3|LessThan1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|LessThan1~22_combout\,
	datab => \U3|LessThan1~24_combout\,
	datac => \U3|Equal0~4_combout\,
	datad => \U3|LessThan1~7_combout\,
	combout => \U3|process_0~0_combout\);

-- Location: LCCOMB_X91_Y21_N28
\U3|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector1~0_combout\ = (\U3|state.DONE~q\ & ((\keys_debouncer|start_stop_reg\(1)) # (!\keys_debouncer|start_stop_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keys_debouncer|start_stop_reg\(0),
	datac => \keys_debouncer|start_stop_reg\(1),
	datad => \U3|state.DONE~q\,
	combout => \U3|Selector1~0_combout\);

-- Location: LCCOMB_X91_Y21_N26
\U3|state.IDLE~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|state.IDLE~0_combout\ = (\U3|Selector1~1_combout\ & (\U3|state.IDLE~q\)) # (!\U3|Selector1~1_combout\ & ((!\U3|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Selector1~1_combout\,
	datab => \U3|state.IDLE~q\,
	datad => \U3|Selector1~0_combout\,
	combout => \U3|state.IDLE~0_combout\);

-- Location: LCCOMB_X91_Y21_N20
\U3|state.IDLE~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|state.IDLE~1_combout\ = (\U3|state.COOKING~q\ & ((\U3|process_0~0_combout\ & ((!\U3|Selector1~0_combout\))) # (!\U3|process_0~0_combout\ & (\U3|state.IDLE~0_combout\)))) # (!\U3|state.COOKING~q\ & (((\U3|state.IDLE~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.COOKING~q\,
	datab => \U3|process_0~0_combout\,
	datac => \U3|state.IDLE~0_combout\,
	datad => \U3|Selector1~0_combout\,
	combout => \U3|state.IDLE~1_combout\);

-- Location: FF_X91_Y21_N21
\U3|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|state.IDLE~1_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|state.IDLE~q\);

-- Location: LCCOMB_X91_Y21_N10
\U3|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector1~1_combout\ = (\keys_debouncer|start_stop_reg\(0) & ((\keys_debouncer|start_stop_reg\(1) & (!\U3|state.DONE~q\)) # (!\keys_debouncer|start_stop_reg\(1) & ((\U3|state.IDLE~q\))))) # (!\keys_debouncer|start_stop_reg\(0) & (!\U3|state.DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.DONE~q\,
	datab => \keys_debouncer|start_stop_reg\(0),
	datac => \keys_debouncer|start_stop_reg\(1),
	datad => \U3|state.IDLE~q\,
	combout => \U3|Selector1~1_combout\);

-- Location: LCCOMB_X91_Y21_N6
\U3|Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector1~2_combout\ = (\U3|Selector1~1_combout\ & (((\U3|state.COOKING~q\ & !\U3|process_0~0_combout\)))) # (!\U3|Selector1~1_combout\ & (!\U3|Selector1~0_combout\ & ((!\U3|process_0~0_combout\) # (!\U3|state.COOKING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Selector1~1_combout\,
	datab => \U3|Selector1~0_combout\,
	datac => \U3|state.COOKING~q\,
	datad => \U3|process_0~0_combout\,
	combout => \U3|Selector1~2_combout\);

-- Location: FF_X91_Y21_N7
\U3|state.COOKING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|Selector1~2_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|state.COOKING~q\);

-- Location: LCCOMB_X91_Y21_N4
\U3|Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector2~3_combout\ = (\U3|state.DONE~q\ & (\keys_debouncer|start_stop_reg\(0) & (!\keys_debouncer|start_stop_reg\(1) & \U3|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.DONE~q\,
	datab => \keys_debouncer|start_stop_reg\(0),
	datac => \keys_debouncer|start_stop_reg\(1),
	datad => \U3|state.IDLE~q\,
	combout => \U3|Selector2~3_combout\);

-- Location: LCCOMB_X91_Y21_N12
\U3|Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector2~2_combout\ = (\U3|state.COOKING~q\ & ((\U3|process_0~0_combout\ & ((!\U3|Selector1~0_combout\))) # (!\U3|process_0~0_combout\ & (\U3|Selector2~3_combout\)))) # (!\U3|state.COOKING~q\ & (((\U3|Selector2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.COOKING~q\,
	datab => \U3|process_0~0_combout\,
	datac => \U3|Selector2~3_combout\,
	datad => \U3|Selector1~0_combout\,
	combout => \U3|Selector2~2_combout\);

-- Location: FF_X91_Y21_N13
\U3|state.DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|Selector2~2_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|state.DONE~q\);

-- Location: LCCOMB_X91_Y21_N8
\U3|led_alert~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|led_alert~0_combout\ = (\U3|state.DONE~q\ & (!\keys_debouncer|start_stop_reg\(1) & (\keys_debouncer|start_stop_reg\(0)))) # (!\U3|state.DONE~q\ & (((\U3|led_alert~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|start_stop_reg\(1),
	datab => \keys_debouncer|start_stop_reg\(0),
	datac => \U3|led_alert~q\,
	datad => \U3|state.DONE~q\,
	combout => \U3|led_alert~0_combout\);

-- Location: FF_X91_Y21_N9
\U3|led_alert\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|led_alert~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|led_alert~q\);

-- Location: LCCOMB_X88_Y21_N4
\U2|temp_val[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[0]~8_combout\ = \U2|temp_val\(0) $ (VCC)
-- \U2|temp_val[0]~9\ = CARRY(\U2|temp_val\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val\(0),
	datad => VCC,
	combout => \U2|temp_val[0]~8_combout\,
	cout => \U2|temp_val[0]~9\);

-- Location: LCCOMB_X107_Y21_N0
\U2|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~0_combout\ = (\U2|temp_val~24_combout\ & (!\SW[1]~input_o\ & !\SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val~24_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~0_combout\);

-- Location: FF_X88_Y21_N5
\U2|temp_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[0]~8_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(0));

-- Location: LCCOMB_X88_Y21_N6
\U2|temp_val[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[1]~10_combout\ = (\U2|temp_val\(1) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[0]~9\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|temp_val[0]~9\ & VCC)))) # (!\U2|temp_val\(1) & 
-- ((\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val[0]~9\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[0]~9\))))
-- \U2|temp_val[1]~11\ = CARRY((\U2|temp_val\(1) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[0]~9\)) # (!\U2|temp_val\(1) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|temp_val[0]~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[0]~9\,
	combout => \U2|temp_val[1]~10_combout\,
	cout => \U2|temp_val[1]~11\);

-- Location: FF_X88_Y21_N7
\U2|temp_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[1]~10_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(1));

-- Location: LCCOMB_X88_Y21_N8
\U2|temp_val[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[2]~12_combout\ = ((\U2|temp_val\(2) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[1]~11\)))) # (GND)
-- \U2|temp_val[2]~13\ = CARRY((\U2|temp_val\(2) & ((!\U2|temp_val[1]~11\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|temp_val\(2) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(2),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[1]~11\,
	combout => \U2|temp_val[2]~12_combout\,
	cout => \U2|temp_val[2]~13\);

-- Location: FF_X88_Y21_N9
\U2|temp_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[2]~12_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(2));

-- Location: LCCOMB_X88_Y21_N10
\U2|temp_val[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[3]~14_combout\ = (\U2|temp_val\(3) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[2]~13\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|temp_val[2]~13\ & VCC)))) # (!\U2|temp_val\(3) & 
-- ((\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val[2]~13\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[2]~13\))))
-- \U2|temp_val[3]~15\ = CARRY((\U2|temp_val\(3) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[2]~13\)) # (!\U2|temp_val\(3) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|temp_val[2]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[2]~13\,
	combout => \U2|temp_val[3]~14_combout\,
	cout => \U2|temp_val[3]~15\);

-- Location: FF_X88_Y21_N11
\U2|temp_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[3]~14_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(3));

-- Location: LCCOMB_X88_Y21_N12
\U2|temp_val[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[4]~16_combout\ = ((\U2|temp_val\(4) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[3]~15\)))) # (GND)
-- \U2|temp_val[4]~17\ = CARRY((\U2|temp_val\(4) & ((!\U2|temp_val[3]~15\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|temp_val\(4) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[3]~15\,
	combout => \U2|temp_val[4]~16_combout\,
	cout => \U2|temp_val[4]~17\);

-- Location: FF_X88_Y21_N13
\U2|temp_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[4]~16_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(4));

-- Location: LCCOMB_X88_Y21_N14
\U2|temp_val[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[5]~18_combout\ = (\U2|temp_val\(5) & ((\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[4]~17\)) # (!\keys_debouncer|time_adjust_out~combout\ & (\U2|temp_val[4]~17\ & VCC)))) # (!\U2|temp_val\(5) & 
-- ((\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val[4]~17\) # (GND))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val[4]~17\))))
-- \U2|temp_val[5]~19\ = CARRY((\U2|temp_val\(5) & (\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[4]~17\)) # (!\U2|temp_val\(5) & ((\keys_debouncer|time_adjust_out~combout\) # (!\U2|temp_val[4]~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[4]~17\,
	combout => \U2|temp_val[5]~18_combout\,
	cout => \U2|temp_val[5]~19\);

-- Location: FF_X88_Y21_N15
\U2|temp_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[5]~18_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(5));

-- Location: LCCOMB_X88_Y21_N16
\U2|temp_val[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[6]~20_combout\ = ((\U2|temp_val\(6) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[5]~19\)))) # (GND)
-- \U2|temp_val[6]~21\ = CARRY((\U2|temp_val\(6) & ((!\U2|temp_val[5]~19\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|temp_val\(6) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[5]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(6),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[5]~19\,
	combout => \U2|temp_val[6]~20_combout\,
	cout => \U2|temp_val[6]~21\);

-- Location: FF_X88_Y21_N17
\U2|temp_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[6]~20_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(6));

-- Location: LCCOMB_X88_Y21_N18
\U2|temp_val[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[7]~22_combout\ = \keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[6]~21\ $ (!\U2|temp_val\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => \U2|temp_val\(7),
	cin => \U2|temp_val[6]~21\,
	combout => \U2|temp_val[7]~22_combout\);

-- Location: FF_X88_Y21_N19
\U2|temp_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[7]~22_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(7));

-- Location: LCCOMB_X94_Y26_N22
\bin_to_bcd_temp|bcd~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~11_combout\ = (\U2|temp_val\(4) & (\U2|temp_val\(6) $ (((\U2|temp_val\(5)) # (!\U2|temp_val\(7)))))) # (!\U2|temp_val\(4) & ((\U2|temp_val\(5) & (\U2|temp_val\(6) & !\U2|temp_val\(7))) # (!\U2|temp_val\(5) & (!\U2|temp_val\(6) & 
-- \U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|bcd~11_combout\);

-- Location: LCCOMB_X94_Y26_N4
\bin_to_bcd_temp|bcd~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~12_combout\ = (\U2|temp_val\(5) & (!\U2|temp_val\(7) & ((\U2|temp_val\(4)) # (!\U2|temp_val\(6))))) # (!\U2|temp_val\(5) & (\U2|temp_val\(7) & ((\U2|temp_val\(6)) # (!\U2|temp_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|bcd~12_combout\);

-- Location: LCCOMB_X94_Y26_N28
\bin_to_bcd_temp|bcd~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~10_combout\ = (\U2|temp_val\(4) & (!\U2|temp_val\(5) & (!\U2|temp_val\(6) & \U2|temp_val\(7)))) # (!\U2|temp_val\(4) & (\U2|temp_val\(6) & (\U2|temp_val\(5) $ (!\U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|bcd~10_combout\);

-- Location: LCCOMB_X94_Y26_N16
\bin_to_bcd_temp|bcd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~0_combout\ = (\bin_to_bcd_temp|bcd~12_combout\ & (!\bin_to_bcd_temp|bcd~11_combout\ & (!\U2|temp_val\(3)))) # (!\bin_to_bcd_temp|bcd~12_combout\ & (\bin_to_bcd_temp|bcd~10_combout\ & ((\bin_to_bcd_temp|bcd~11_combout\) # 
-- (\U2|temp_val\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~11_combout\,
	datab => \bin_to_bcd_temp|bcd~12_combout\,
	datac => \U2|temp_val\(3),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \bin_to_bcd_temp|bcd~0_combout\);

-- Location: LCCOMB_X94_Y26_N24
\bin_to_bcd_temp|bcd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~2_combout\ = (\bin_to_bcd_temp|bcd~11_combout\ & ((\U2|temp_val\(3)) # ((!\bin_to_bcd_temp|bcd~12_combout\ & !\bin_to_bcd_temp|bcd~10_combout\)))) # (!\bin_to_bcd_temp|bcd~11_combout\ & (((!\U2|temp_val\(3) & 
-- \bin_to_bcd_temp|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~11_combout\,
	datab => \bin_to_bcd_temp|bcd~12_combout\,
	datac => \U2|temp_val\(3),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \bin_to_bcd_temp|bcd~2_combout\);

-- Location: LCCOMB_X94_Y26_N14
\bin_to_bcd_temp|bcd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~1_combout\ = (\bin_to_bcd_temp|bcd~12_combout\ & (!\U2|temp_val\(3) & ((\bin_to_bcd_temp|bcd~11_combout\) # (\bin_to_bcd_temp|bcd~10_combout\)))) # (!\bin_to_bcd_temp|bcd~12_combout\ & ((\U2|temp_val\(3) $ 
-- (\bin_to_bcd_temp|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~11_combout\,
	datab => \bin_to_bcd_temp|bcd~12_combout\,
	datac => \U2|temp_val\(3),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \bin_to_bcd_temp|bcd~1_combout\);

-- Location: LCCOMB_X95_Y26_N12
\bin_to_bcd_temp|bcd~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~5_combout\ = (\bin_to_bcd_temp|bcd~0_combout\ & ((\U2|temp_val\(2) $ (!\bin_to_bcd_temp|bcd~1_combout\)))) # (!\bin_to_bcd_temp|bcd~0_combout\ & (\bin_to_bcd_temp|bcd~1_combout\ & ((\U2|temp_val\(2)) # 
-- (!\bin_to_bcd_temp|bcd~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~1_combout\,
	combout => \bin_to_bcd_temp|bcd~5_combout\);

-- Location: LCCOMB_X95_Y26_N4
\bin_to_bcd_temp|bcd~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~3_combout\ = (\bin_to_bcd_temp|bcd~2_combout\ & (((!\U2|temp_val\(2) & !\bin_to_bcd_temp|bcd~1_combout\)))) # (!\bin_to_bcd_temp|bcd~2_combout\ & (\bin_to_bcd_temp|bcd~0_combout\ & ((\U2|temp_val\(2)) # 
-- (\bin_to_bcd_temp|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~1_combout\,
	combout => \bin_to_bcd_temp|bcd~3_combout\);

-- Location: LCCOMB_X95_Y26_N2
\bin_to_bcd_temp|bcd~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~4_combout\ = (\bin_to_bcd_temp|bcd~0_combout\ & (((!\U2|temp_val\(2))))) # (!\bin_to_bcd_temp|bcd~0_combout\ & ((\bin_to_bcd_temp|bcd~2_combout\ & (!\U2|temp_val\(2) & \bin_to_bcd_temp|bcd~1_combout\)) # 
-- (!\bin_to_bcd_temp|bcd~2_combout\ & (\U2|temp_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~1_combout\,
	combout => \bin_to_bcd_temp|bcd~4_combout\);

-- Location: LCCOMB_X95_Y30_N12
\bin_to_bcd_temp|bcd_ones[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_ones[1]~2_combout\ = (\bin_to_bcd_temp|bcd~5_combout\ & (!\U2|temp_val\(1) & ((\bin_to_bcd_temp|bcd~3_combout\) # (\bin_to_bcd_temp|bcd~4_combout\)))) # (!\bin_to_bcd_temp|bcd~5_combout\ & (\bin_to_bcd_temp|bcd~3_combout\ $ 
-- ((\U2|temp_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~5_combout\,
	datab => \bin_to_bcd_temp|bcd~3_combout\,
	datac => \U2|temp_val\(1),
	datad => \bin_to_bcd_temp|bcd~4_combout\,
	combout => \bin_to_bcd_temp|bcd_ones[1]~2_combout\);

-- Location: LCCOMB_X95_Y30_N24
\bin_to_bcd_temp|bcd_ones[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_ones[3]~0_combout\ = (\bin_to_bcd_temp|bcd~5_combout\ & (((!\U2|temp_val\(1) & !\bin_to_bcd_temp|bcd~4_combout\)))) # (!\bin_to_bcd_temp|bcd~5_combout\ & (\bin_to_bcd_temp|bcd~3_combout\ & ((\U2|temp_val\(1)) # 
-- (\bin_to_bcd_temp|bcd~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~5_combout\,
	datab => \bin_to_bcd_temp|bcd~3_combout\,
	datac => \U2|temp_val\(1),
	datad => \bin_to_bcd_temp|bcd~4_combout\,
	combout => \bin_to_bcd_temp|bcd_ones[3]~0_combout\);

-- Location: LCCOMB_X95_Y30_N30
\bin_to_bcd_temp|bcd_ones[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_ones[2]~1_combout\ = (\bin_to_bcd_temp|bcd~3_combout\ & ((\U2|temp_val\(1) $ (!\bin_to_bcd_temp|bcd~4_combout\)))) # (!\bin_to_bcd_temp|bcd~3_combout\ & (\bin_to_bcd_temp|bcd~4_combout\ & ((\U2|temp_val\(1)) # 
-- (!\bin_to_bcd_temp|bcd~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~5_combout\,
	datab => \bin_to_bcd_temp|bcd~3_combout\,
	datac => \U2|temp_val\(1),
	datad => \bin_to_bcd_temp|bcd~4_combout\,
	combout => \bin_to_bcd_temp|bcd_ones[2]~1_combout\);

-- Location: LCCOMB_X95_Y30_N10
\HEX0_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~23_combout\ = (\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_temp|bcd_ones[3]~0_combout\)) # (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_temp|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & 
-- \U2|temp_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X95_Y30_N8
\HEX0_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~24_combout\ = (\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & (!\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & (\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & \U2|temp_val\(0)))) # (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & 
-- (\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & (!\bin_to_bcd_temp|bcd_ones[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X95_Y26_N6
\HEX0_inst|decOut_n~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~25_combout\ = (\U2|temp_val\(0) & (((\bin_to_bcd_temp|bcd~0_combout\ & \U2|temp_val\(1))))) # (!\U2|temp_val\(0) & (\bin_to_bcd_temp|bcd~2_combout\ & (!\bin_to_bcd_temp|bcd~0_combout\ & !\U2|temp_val\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(0),
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \bin_to_bcd_temp|bcd~0_combout\,
	datad => \U2|temp_val\(1),
	combout => \HEX0_inst|decOut_n~25_combout\);

-- Location: LCCOMB_X95_Y26_N16
\HEX0_inst|decOut_n~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~26_combout\ = (\HEX0_inst|decOut_n~25_combout\) # ((!\bin_to_bcd_temp|bcd~0_combout\ & (\bin_to_bcd_temp|bcd~2_combout\ & !\HEX0_inst|decOut_n~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \HEX0_inst|decOut_n~24_combout\,
	datad => \HEX0_inst|decOut_n~25_combout\,
	combout => \HEX0_inst|decOut_n~26_combout\);

-- Location: LCCOMB_X95_Y26_N0
\HEX0_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~37_combout\ = (!\bin_to_bcd_temp|bcd~2_combout\ & ((\bin_to_bcd_temp|bcd~0_combout\ & ((!\U2|temp_val\(1)) # (!\HEX0_inst|decOut_n~24_combout\))) # (!\bin_to_bcd_temp|bcd~0_combout\ & ((\U2|temp_val\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \HEX0_inst|decOut_n~24_combout\,
	datad => \U2|temp_val\(1),
	combout => \HEX0_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X95_Y26_N10
\HEX0_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~38_combout\ = (!\bin_to_bcd_temp|bcd~2_combout\ & ((\HEX0_inst|decOut_n~37_combout\ & ((!\U2|temp_val\(0)))) # (!\HEX0_inst|decOut_n~37_combout\ & (!\U2|temp_val\(1) & \U2|temp_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \HEX0_inst|decOut_n~37_combout\,
	datac => \U2|temp_val\(0),
	datad => \bin_to_bcd_temp|bcd~2_combout\,
	combout => \HEX0_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X95_Y26_N26
\HEX0_inst|decOut_n~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~27_combout\ = (\bin_to_bcd_temp|bcd~1_combout\ & (((\U2|temp_val\(2))))) # (!\bin_to_bcd_temp|bcd~1_combout\ & ((\U2|temp_val\(2) & ((\HEX0_inst|decOut_n~38_combout\))) # (!\U2|temp_val\(2) & (\HEX0_inst|decOut_n~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~1_combout\,
	datab => \HEX0_inst|decOut_n~26_combout\,
	datac => \U2|temp_val\(2),
	datad => \HEX0_inst|decOut_n~38_combout\,
	combout => \HEX0_inst|decOut_n~27_combout\);

-- Location: LCCOMB_X94_Y26_N18
\HEX0_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~29_combout\ = (\bin_to_bcd_temp|bcd~12_combout\ & (\bin_to_bcd_temp|bcd~11_combout\ $ ((\U2|temp_val\(3))))) # (!\bin_to_bcd_temp|bcd~12_combout\ & (!\bin_to_bcd_temp|bcd~11_combout\ & ((!\bin_to_bcd_temp|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~11_combout\,
	datab => \bin_to_bcd_temp|bcd~12_combout\,
	datac => \U2|temp_val\(3),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \HEX0_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X95_Y26_N20
\HEX0_inst|decOut_n~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~28_combout\ = (\U2|temp_val\(0) & (!\bin_to_bcd_temp|bcd~2_combout\ & (\bin_to_bcd_temp|bcd~0_combout\ $ (\U2|temp_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(0),
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \bin_to_bcd_temp|bcd~0_combout\,
	datad => \U2|temp_val\(1),
	combout => \HEX0_inst|decOut_n~28_combout\);

-- Location: LCCOMB_X95_Y26_N18
\HEX0_inst|decOut_n~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~30_combout\ = (\HEX0_inst|decOut_n~28_combout\) # ((!\U2|temp_val\(1) & (!\HEX0_inst|decOut_n~29_combout\ & !\HEX0_inst|decOut_n~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \HEX0_inst|decOut_n~29_combout\,
	datac => \HEX0_inst|decOut_n~24_combout\,
	datad => \HEX0_inst|decOut_n~28_combout\,
	combout => \HEX0_inst|decOut_n~30_combout\);

-- Location: LCCOMB_X95_Y26_N28
\HEX0_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~39_combout\ = (\U2|temp_val\(0) & ((\bin_to_bcd_temp|bcd~2_combout\ $ (\HEX0_inst|decOut_n~24_combout\)) # (!\U2|temp_val\(1)))) # (!\U2|temp_val\(0) & (\U2|temp_val\(1) $ (((!\bin_to_bcd_temp|bcd~2_combout\ & 
-- !\HEX0_inst|decOut_n~24_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(0),
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \HEX0_inst|decOut_n~24_combout\,
	datad => \U2|temp_val\(1),
	combout => \HEX0_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X95_Y26_N30
\HEX0_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~40_combout\ = (\bin_to_bcd_temp|bcd~0_combout\ & ((\HEX0_inst|decOut_n~39_combout\) # ((!\bin_to_bcd_temp|bcd~2_combout\ & !\HEX0_inst|decOut_n~24_combout\)))) # (!\bin_to_bcd_temp|bcd~0_combout\ & (\HEX0_inst|decOut_n~39_combout\ & 
-- ((\bin_to_bcd_temp|bcd~2_combout\) # (!\HEX0_inst|decOut_n~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \HEX0_inst|decOut_n~24_combout\,
	datad => \HEX0_inst|decOut_n~39_combout\,
	combout => \HEX0_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X95_Y26_N8
\HEX0_inst|decOut_n~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~31_combout\ = (\HEX0_inst|decOut_n~27_combout\ & ((\HEX0_inst|decOut_n~30_combout\) # ((!\bin_to_bcd_temp|bcd~1_combout\)))) # (!\HEX0_inst|decOut_n~27_combout\ & (((\HEX0_inst|decOut_n~40_combout\ & \bin_to_bcd_temp|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX0_inst|decOut_n~27_combout\,
	datab => \HEX0_inst|decOut_n~30_combout\,
	datac => \HEX0_inst|decOut_n~40_combout\,
	datad => \bin_to_bcd_temp|bcd~1_combout\,
	combout => \HEX0_inst|decOut_n~31_combout\);

-- Location: LCCOMB_X95_Y30_N22
\HEX0_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~32_combout\ = (\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & (((!\bin_to_bcd_temp|bcd_ones[3]~0_combout\)))) # (!\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & (((!\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & \U2|temp_val\(0))) # 
-- (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X95_Y30_N0
\HEX0_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~33_combout\ = (\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_temp|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & \U2|temp_val\(0))))) # (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & 
-- (\bin_to_bcd_temp|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & \U2|temp_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X94_Y26_N20
\HEX0_inst|decOut_n~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~9_combout\ = (\U2|temp_val\(5) & (!\U2|temp_val\(7) & (\U2|temp_val\(4) $ (!\U2|temp_val\(6))))) # (!\U2|temp_val\(5) & (!\U2|temp_val\(4) & (\U2|temp_val\(6) & \U2|temp_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \HEX0_inst|decOut_n~9_combout\);

-- Location: LCCOMB_X94_Y26_N12
\HEX0_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~21_combout\ = (\U2|temp_val\(3) & (((\U2|temp_val\(2)) # (\bin_to_bcd_temp|bcd~10_combout\)))) # (!\U2|temp_val\(3) & (\HEX0_inst|decOut_n~9_combout\ & (!\U2|temp_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \HEX0_inst|decOut_n~9_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \HEX0_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X94_Y26_N30
\HEX0_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~15_combout\ = (\U2|temp_val\(5) & (\U2|temp_val\(4) & (!\U2|temp_val\(6) & !\U2|temp_val\(7)))) # (!\U2|temp_val\(5) & (\U2|temp_val\(7) & (\U2|temp_val\(4) $ (!\U2|temp_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \HEX0_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X94_Y26_N10
\HEX0_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~8_combout\ = (\U2|temp_val\(4) & (\U2|temp_val\(6) & (\U2|temp_val\(5) $ (!\U2|temp_val\(7))))) # (!\U2|temp_val\(4) & (!\U2|temp_val\(6) & (\U2|temp_val\(5) $ (!\U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \HEX0_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X94_Y26_N26
\HEX0_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~22_combout\ = (\HEX0_inst|decOut_n~21_combout\ & (((\HEX0_inst|decOut_n~8_combout\)) # (!\U2|temp_val\(2)))) # (!\HEX0_inst|decOut_n~21_combout\ & (\U2|temp_val\(2) & (\HEX0_inst|decOut_n~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX0_inst|decOut_n~21_combout\,
	datab => \U2|temp_val\(2),
	datac => \HEX0_inst|decOut_n~15_combout\,
	datad => \HEX0_inst|decOut_n~8_combout\,
	combout => \HEX0_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X94_Y26_N0
\HEX0_inst|decOut_n~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~6_combout\ = (\U2|temp_val\(4) & (!\U2|temp_val\(6) & (\U2|temp_val\(5) $ (!\U2|temp_val\(7))))) # (!\U2|temp_val\(4) & (\U2|temp_val\(5) & (\U2|temp_val\(6) & !\U2|temp_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \HEX0_inst|decOut_n~6_combout\);

-- Location: LCCOMB_X94_Y26_N8
\HEX0_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~19_combout\ = (\U2|temp_val\(3) & ((\HEX0_inst|decOut_n~6_combout\) # ((\U2|temp_val\(2))))) # (!\U2|temp_val\(3) & (((!\U2|temp_val\(2) & \bin_to_bcd_temp|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \HEX0_inst|decOut_n~6_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \HEX0_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X94_Y26_N2
\HEX0_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~20_combout\ = (\U2|temp_val\(2) & ((\HEX0_inst|decOut_n~19_combout\ & ((\HEX0_inst|decOut_n~9_combout\))) # (!\HEX0_inst|decOut_n~19_combout\ & (\HEX0_inst|decOut_n~8_combout\)))) # (!\U2|temp_val\(2) & 
-- (((\HEX0_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX0_inst|decOut_n~8_combout\,
	datab => \U2|temp_val\(2),
	datac => \HEX0_inst|decOut_n~19_combout\,
	datad => \HEX0_inst|decOut_n~9_combout\,
	combout => \HEX0_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X95_Y30_N18
\HEX0_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~36_combout\ = (\U2|temp_val\(0)) # ((\U2|temp_val\(1) & (\HEX0_inst|decOut_n~22_combout\)) # (!\U2|temp_val\(1) & ((\HEX0_inst|decOut_n~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX0_inst|decOut_n~22_combout\,
	datab => \U2|temp_val\(1),
	datac => \HEX0_inst|decOut_n~20_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X95_Y30_N2
\HEX0_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~34_combout\ = (\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_temp|bcd_ones[3]~0_combout\ & ((!\U2|temp_val\(0)) # (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\)))) # (!\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & 
-- (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_temp|bcd_ones[3]~0_combout\) # (!\U2|temp_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X95_Y30_N28
\HEX0_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~35_combout\ = (\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_temp|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_temp|bcd_ones[2]~1_combout\ & \U2|temp_val\(0))))) # (!\bin_to_bcd_temp|bcd_ones[1]~2_combout\ & 
-- (\bin_to_bcd_temp|bcd_ones[3]~0_combout\ $ ((!\bin_to_bcd_temp|bcd_ones[2]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_ones[3]~0_combout\,
	datac => \bin_to_bcd_temp|bcd_ones[2]~1_combout\,
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X94_Y26_N6
\bin_to_bcd_temp|bcd~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~14_combout\ = \bin_to_bcd_temp|bcd~10_combout\ $ ((((!\bin_to_bcd_temp|bcd~11_combout\ & !\U2|temp_val\(3))) # (!\bin_to_bcd_temp|bcd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~11_combout\,
	datab => \bin_to_bcd_temp|bcd~12_combout\,
	datac => \U2|temp_val\(3),
	datad => \bin_to_bcd_temp|bcd~10_combout\,
	combout => \bin_to_bcd_temp|bcd~14_combout\);

-- Location: LCCOMB_X99_Y26_N14
\bin_to_bcd_temp|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|LessThan0~1_combout\ = (\U2|temp_val\(7) & ((\U2|temp_val\(5)) # (\U2|temp_val\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|LessThan0~1_combout\);

-- Location: LCCOMB_X99_Y26_N22
\bin_to_bcd_temp|bcd~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~8_combout\ = (\U2|temp_val\(5) & (\U2|temp_val\(4) & (\U2|temp_val\(6) & \U2|temp_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|bcd~8_combout\);

-- Location: LCCOMB_X99_Y26_N18
\bin_to_bcd_temp|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|LessThan0~0_combout\ = (\U2|temp_val\(5)) # (\U2|temp_val\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datac => \U2|temp_val\(6),
	combout => \bin_to_bcd_temp|LessThan0~0_combout\);

-- Location: LCCOMB_X99_Y26_N12
\bin_to_bcd_temp|bcd~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~9_combout\ = (\bin_to_bcd_temp|bcd~8_combout\) # ((!\bin_to_bcd_temp|bcd~14_combout\ & ((!\bin_to_bcd_temp|LessThan0~0_combout\) # (!\bin_to_bcd_temp|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~14_combout\,
	datab => \bin_to_bcd_temp|LessThan0~1_combout\,
	datac => \bin_to_bcd_temp|bcd~8_combout\,
	datad => \bin_to_bcd_temp|LessThan0~0_combout\,
	combout => \bin_to_bcd_temp|bcd~9_combout\);

-- Location: LCCOMB_X99_Y26_N16
\bin_to_bcd_temp|bcd~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~13_combout\ = (\U2|temp_val\(5) & (((!\U2|temp_val\(4) & \U2|temp_val\(7))) # (!\U2|temp_val\(6)))) # (!\U2|temp_val\(5) & ((\U2|temp_val\(6) & ((\U2|temp_val\(7)) # (!\U2|temp_val\(4)))) # (!\U2|temp_val\(6) & 
-- ((!\U2|temp_val\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(6),
	datad => \U2|temp_val\(7),
	combout => \bin_to_bcd_temp|bcd~13_combout\);

-- Location: LCCOMB_X99_Y26_N20
\bin_to_bcd_temp|bcd~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~6_combout\ = (\bin_to_bcd_temp|bcd~14_combout\ & (\bin_to_bcd_temp|bcd~13_combout\ & \bin_to_bcd_temp|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~14_combout\,
	datab => \bin_to_bcd_temp|bcd~13_combout\,
	datac => \bin_to_bcd_temp|LessThan0~1_combout\,
	combout => \bin_to_bcd_temp|bcd~6_combout\);

-- Location: LCCOMB_X95_Y26_N22
\bin_to_bcd_temp|bcd~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~15_combout\ = \bin_to_bcd_temp|bcd~0_combout\ $ ((((!\U2|temp_val\(2) & !\bin_to_bcd_temp|bcd~1_combout\)) # (!\bin_to_bcd_temp|bcd~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~0_combout\,
	datab => \bin_to_bcd_temp|bcd~2_combout\,
	datac => \U2|temp_val\(2),
	datad => \bin_to_bcd_temp|bcd~1_combout\,
	combout => \bin_to_bcd_temp|bcd~15_combout\);

-- Location: LCCOMB_X99_Y26_N24
\bin_to_bcd_temp|bcd~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd~7_combout\ = (!\bin_to_bcd_temp|bcd~13_combout\ & (((!\bin_to_bcd_temp|LessThan0~0_combout\) # (!\bin_to_bcd_temp|LessThan0~1_combout\)) # (!\bin_to_bcd_temp|bcd~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~14_combout\,
	datab => \bin_to_bcd_temp|bcd~13_combout\,
	datac => \bin_to_bcd_temp|LessThan0~1_combout\,
	datad => \bin_to_bcd_temp|LessThan0~0_combout\,
	combout => \bin_to_bcd_temp|bcd~7_combout\);

-- Location: LCCOMB_X99_Y26_N10
\bin_to_bcd_temp|bcd_tens[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_tens[1]~2_combout\ = (\bin_to_bcd_temp|bcd~6_combout\ & (((!\bin_to_bcd_temp|bcd~15_combout\)))) # (!\bin_to_bcd_temp|bcd~6_combout\ & ((\bin_to_bcd_temp|bcd~15_combout\ & ((!\bin_to_bcd_temp|bcd~7_combout\) # 
-- (!\bin_to_bcd_temp|bcd~9_combout\))) # (!\bin_to_bcd_temp|bcd~15_combout\ & ((\bin_to_bcd_temp|bcd~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~9_combout\,
	datab => \bin_to_bcd_temp|bcd~6_combout\,
	datac => \bin_to_bcd_temp|bcd~15_combout\,
	datad => \bin_to_bcd_temp|bcd~7_combout\,
	combout => \bin_to_bcd_temp|bcd_tens[1]~2_combout\);

-- Location: LCCOMB_X95_Y26_N24
\bin_to_bcd_temp|bcd_tens[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_tens[0]~3_combout\ = \bin_to_bcd_temp|bcd~3_combout\ $ ((((!\U2|temp_val\(1) & !\bin_to_bcd_temp|bcd~4_combout\)) # (!\bin_to_bcd_temp|bcd~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \bin_to_bcd_temp|bcd~4_combout\,
	datac => \bin_to_bcd_temp|bcd~3_combout\,
	datad => \bin_to_bcd_temp|bcd~5_combout\,
	combout => \bin_to_bcd_temp|bcd_tens[0]~3_combout\);

-- Location: LCCOMB_X99_Y26_N8
\bin_to_bcd_temp|bcd_tens[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_tens[3]~1_combout\ = (\bin_to_bcd_temp|bcd~15_combout\ & (!\bin_to_bcd_temp|bcd~9_combout\ & ((\bin_to_bcd_temp|bcd~7_combout\)))) # (!\bin_to_bcd_temp|bcd~15_combout\ & (((\bin_to_bcd_temp|bcd~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~9_combout\,
	datab => \bin_to_bcd_temp|bcd~6_combout\,
	datac => \bin_to_bcd_temp|bcd~15_combout\,
	datad => \bin_to_bcd_temp|bcd~7_combout\,
	combout => \bin_to_bcd_temp|bcd_tens[3]~1_combout\);

-- Location: LCCOMB_X99_Y26_N6
\bin_to_bcd_temp|bcd_tens[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_temp|bcd_tens[2]~0_combout\ = (\bin_to_bcd_temp|bcd~9_combout\ & (((!\bin_to_bcd_temp|bcd~6_combout\ & !\bin_to_bcd_temp|bcd~7_combout\)) # (!\bin_to_bcd_temp|bcd~15_combout\))) # (!\bin_to_bcd_temp|bcd~9_combout\ & 
-- (\bin_to_bcd_temp|bcd~6_combout\ & (\bin_to_bcd_temp|bcd~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd~9_combout\,
	datab => \bin_to_bcd_temp|bcd~6_combout\,
	datac => \bin_to_bcd_temp|bcd~15_combout\,
	datad => \bin_to_bcd_temp|bcd~7_combout\,
	combout => \bin_to_bcd_temp|bcd_tens[2]~0_combout\);

-- Location: LCCOMB_X99_Y26_N28
\HEX1_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~36_combout\ = (\bin_to_bcd_temp|bcd_tens[1]~2_combout\ & (\bin_to_bcd_temp|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & !\bin_to_bcd_temp|bcd_tens[3]~1_combout\))))) # (!\bin_to_bcd_temp|bcd_tens[1]~2_combout\ 
-- & (((\bin_to_bcd_temp|bcd_tens[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_tens[0]~3_combout\,
	datac => \bin_to_bcd_temp|bcd_tens[3]~1_combout\,
	datad => \bin_to_bcd_temp|bcd_tens[2]~0_combout\,
	combout => \HEX1_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X96_Y26_N28
\HEX1_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~20_combout\ = (!\U2|temp_val\(4) & ((\U2|temp_val\(5) & (!\U2|temp_val\(6) & \U2|temp_val\(7))) # (!\U2|temp_val\(5) & (\U2|temp_val\(6) & !\U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(4),
	datad => \U2|temp_val\(7),
	combout => \HEX1_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X96_Y26_N10
\HEX1_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~21_combout\ = (!\U2|temp_val\(6) & ((\U2|temp_val\(5) & (\U2|temp_val\(4) $ (\U2|temp_val\(7)))) # (!\U2|temp_val\(5) & (\U2|temp_val\(4) & \U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(4),
	datad => \U2|temp_val\(7),
	combout => \HEX1_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X96_Y26_N24
\HEX1_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~19_combout\ = (\U2|temp_val\(3) & ((\HEX1_inst|decOut_n~21_combout\))) # (!\U2|temp_val\(3) & (\HEX1_inst|decOut_n~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \HEX1_inst|decOut_n~20_combout\,
	datac => \U2|temp_val\(3),
	datad => \HEX1_inst|decOut_n~21_combout\,
	combout => \HEX1_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X96_Y26_N30
\HEX1_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~23_combout\ = (\U2|temp_val\(5) & (!\U2|temp_val\(6) & (\U2|temp_val\(4) $ (\U2|temp_val\(7))))) # (!\U2|temp_val\(5) & (\U2|temp_val\(6) & (!\U2|temp_val\(4) & !\U2|temp_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(4),
	datad => \U2|temp_val\(7),
	combout => \HEX1_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X96_Y26_N12
\HEX1_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~24_combout\ = (\U2|temp_val\(4) & ((\U2|temp_val\(5) & (\U2|temp_val\(6) $ (!\U2|temp_val\(7)))) # (!\U2|temp_val\(5) & (!\U2|temp_val\(6) & \U2|temp_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(4),
	datad => \U2|temp_val\(7),
	combout => \HEX1_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X96_Y26_N18
\HEX1_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~22_combout\ = (\U2|temp_val\(3) & ((\HEX1_inst|decOut_n~24_combout\))) # (!\U2|temp_val\(3) & (\HEX1_inst|decOut_n~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val\(3),
	datac => \HEX1_inst|decOut_n~23_combout\,
	datad => \HEX1_inst|decOut_n~24_combout\,
	combout => \HEX1_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X95_Y26_N14
\HEX1_inst|decOut_n~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~42_combout\ = (\U2|temp_val\(1) & ((\U2|temp_val\(2) $ (\HEX1_inst|decOut_n~22_combout\)))) # (!\U2|temp_val\(1) & ((\U2|temp_val\(2) & ((\HEX1_inst|decOut_n~22_combout\))) # (!\U2|temp_val\(2) & (\HEX1_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \HEX1_inst|decOut_n~19_combout\,
	datac => \U2|temp_val\(2),
	datad => \HEX1_inst|decOut_n~22_combout\,
	combout => \HEX1_inst|decOut_n~42_combout\);

-- Location: LCCOMB_X96_Y26_N4
\HEX1_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~29_combout\ = (\U2|temp_val\(3) & (\HEX1_inst|decOut_n~24_combout\)) # (!\U2|temp_val\(3) & ((\HEX1_inst|decOut_n~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~24_combout\,
	datac => \U2|temp_val\(3),
	datad => \HEX1_inst|decOut_n~21_combout\,
	combout => \HEX1_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X96_Y26_N14
\HEX1_inst|decOut_n~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~43_combout\ = (\HEX1_inst|decOut_n~42_combout\ & ((\HEX1_inst|decOut_n~29_combout\) # ((\HEX1_inst|decOut_n~22_combout\) # (!\U2|temp_val\(2))))) # (!\HEX1_inst|decOut_n~42_combout\ & (\HEX1_inst|decOut_n~29_combout\ & 
-- (\U2|temp_val\(2) & \HEX1_inst|decOut_n~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~42_combout\,
	datab => \HEX1_inst|decOut_n~29_combout\,
	datac => \U2|temp_val\(2),
	datad => \HEX1_inst|decOut_n~22_combout\,
	combout => \HEX1_inst|decOut_n~43_combout\);

-- Location: LCCOMB_X99_Y26_N30
\HEX1_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~37_combout\ = (\bin_to_bcd_temp|bcd_tens[2]~0_combout\ & (((!\bin_to_bcd_temp|bcd_tens[3]~1_combout\)))) # (!\bin_to_bcd_temp|bcd_tens[2]~0_combout\ & ((\bin_to_bcd_temp|bcd_tens[1]~2_combout\) # 
-- ((!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & !\bin_to_bcd_temp|bcd_tens[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_tens[0]~3_combout\,
	datac => \bin_to_bcd_temp|bcd_tens[3]~1_combout\,
	datad => \bin_to_bcd_temp|bcd_tens[2]~0_combout\,
	combout => \HEX1_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X99_Y26_N4
\HEX1_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~38_combout\ = (\bin_to_bcd_temp|bcd_tens[1]~2_combout\ & (\bin_to_bcd_temp|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & !\bin_to_bcd_temp|bcd_tens[3]~1_combout\))))) # (!\bin_to_bcd_temp|bcd_tens[1]~2_combout\ 
-- & ((\bin_to_bcd_temp|bcd_tens[3]~1_combout\) # ((!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & \bin_to_bcd_temp|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_tens[0]~3_combout\,
	datac => \bin_to_bcd_temp|bcd_tens[3]~1_combout\,
	datad => \bin_to_bcd_temp|bcd_tens[2]~0_combout\,
	combout => \HEX1_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X94_Y23_N10
\HEX1_inst|decOut_n~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~14_combout\ = (\U2|temp_val\(4) & ((\U2|temp_val\(3) & ((!\U2|temp_val\(2)))) # (!\U2|temp_val\(3) & ((\U2|temp_val\(1)) # (\U2|temp_val\(2)))))) # (!\U2|temp_val\(4) & (((!\U2|temp_val\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~14_combout\);

-- Location: LCCOMB_X94_Y23_N16
\HEX1_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~15_combout\ = (\U2|temp_val\(4)) # ((\U2|temp_val\(3)) # ((\U2|temp_val\(1) & \U2|temp_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X94_Y23_N20
\HEX1_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~4_combout\ = (\U2|temp_val\(4) & ((\U2|temp_val\(3) & (\U2|temp_val\(1) & \U2|temp_val\(2))) # (!\U2|temp_val\(3) & ((!\U2|temp_val\(2)))))) # (!\U2|temp_val\(4) & (\U2|temp_val\(3) & ((\U2|temp_val\(1)) # (\U2|temp_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X94_Y23_N24
\HEX1_inst|decOut_n~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~11_combout\ = (\U2|temp_val\(1)) # ((\U2|temp_val\(4)) # ((\U2|temp_val\(3)) # (\U2|temp_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~11_combout\);

-- Location: LCCOMB_X94_Y23_N4
\HEX1_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~34_combout\ = (\U2|temp_val\(6) & (((\U2|temp_val\(5))))) # (!\U2|temp_val\(6) & ((\U2|temp_val\(5) & (\HEX1_inst|decOut_n~4_combout\)) # (!\U2|temp_val\(5) & ((\HEX1_inst|decOut_n~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(6),
	datab => \HEX1_inst|decOut_n~4_combout\,
	datac => \U2|temp_val\(5),
	datad => \HEX1_inst|decOut_n~11_combout\,
	combout => \HEX1_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X94_Y23_N30
\HEX1_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~35_combout\ = (\HEX1_inst|decOut_n~34_combout\ & (((\HEX1_inst|decOut_n~15_combout\) # (!\U2|temp_val\(6))))) # (!\HEX1_inst|decOut_n~34_combout\ & (\HEX1_inst|decOut_n~14_combout\ & ((\U2|temp_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~14_combout\,
	datab => \HEX1_inst|decOut_n~15_combout\,
	datac => \HEX1_inst|decOut_n~34_combout\,
	datad => \U2|temp_val\(6),
	combout => \HEX1_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X94_Y23_N26
\HEX1_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~5_combout\ = ((!\U2|temp_val\(2)) # (!\U2|temp_val\(3))) # (!\U2|temp_val\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X94_Y23_N12
\HEX1_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~32_combout\ = (\U2|temp_val\(5) & ((\HEX1_inst|decOut_n~5_combout\) # ((\U2|temp_val\(6))))) # (!\U2|temp_val\(5) & (((\HEX1_inst|decOut_n~4_combout\ & !\U2|temp_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~5_combout\,
	datab => \HEX1_inst|decOut_n~4_combout\,
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(6),
	combout => \HEX1_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X94_Y23_N28
\HEX1_inst|decOut_n~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~7_combout\ = (\U2|temp_val\(1) & ((\U2|temp_val\(3)) # ((!\U2|temp_val\(4) & \U2|temp_val\(2))))) # (!\U2|temp_val\(1) & (\U2|temp_val\(3) & ((\U2|temp_val\(2)) # (!\U2|temp_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~7_combout\);

-- Location: LCCOMB_X94_Y23_N22
\HEX1_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~8_combout\ = (\U2|temp_val\(4) & (((!\U2|temp_val\(3))))) # (!\U2|temp_val\(4) & ((\U2|temp_val\(3) & (\U2|temp_val\(1) & \U2|temp_val\(2))) # (!\U2|temp_val\(3) & ((!\U2|temp_val\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(1),
	datab => \U2|temp_val\(4),
	datac => \U2|temp_val\(3),
	datad => \U2|temp_val\(2),
	combout => \HEX1_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X94_Y23_N18
\HEX1_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~33_combout\ = (\HEX1_inst|decOut_n~32_combout\ & (((\HEX1_inst|decOut_n~8_combout\) # (!\U2|temp_val\(6))))) # (!\HEX1_inst|decOut_n~32_combout\ & (\HEX1_inst|decOut_n~7_combout\ & ((\U2|temp_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~32_combout\,
	datab => \HEX1_inst|decOut_n~7_combout\,
	datac => \HEX1_inst|decOut_n~8_combout\,
	datad => \U2|temp_val\(6),
	combout => \HEX1_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X94_Y23_N6
\HEX1_inst|decOut_n~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~41_combout\ = (\U2|temp_val\(7) & (\HEX1_inst|decOut_n~35_combout\)) # (!\U2|temp_val\(7) & ((\HEX1_inst|decOut_n~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX1_inst|decOut_n~35_combout\,
	datac => \U2|temp_val\(7),
	datad => \HEX1_inst|decOut_n~33_combout\,
	combout => \HEX1_inst|decOut_n~41_combout\);

-- Location: LCCOMB_X99_Y26_N26
\HEX1_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~39_combout\ = (\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & ((\bin_to_bcd_temp|bcd_tens[2]~0_combout\ & ((!\bin_to_bcd_temp|bcd_tens[3]~1_combout\))) # (!\bin_to_bcd_temp|bcd_tens[2]~0_combout\ & 
-- (\bin_to_bcd_temp|bcd_tens[1]~2_combout\)))) # (!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & (\bin_to_bcd_temp|bcd_tens[1]~2_combout\ & (\bin_to_bcd_temp|bcd_tens[3]~1_combout\ $ (\bin_to_bcd_temp|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_tens[0]~3_combout\,
	datac => \bin_to_bcd_temp|bcd_tens[3]~1_combout\,
	datad => \bin_to_bcd_temp|bcd_tens[2]~0_combout\,
	combout => \HEX1_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X99_Y26_N0
\HEX1_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~40_combout\ = (\bin_to_bcd_temp|bcd_tens[1]~2_combout\ & ((\bin_to_bcd_temp|bcd_tens[3]~1_combout\ $ (!\bin_to_bcd_temp|bcd_tens[2]~0_combout\)))) # (!\bin_to_bcd_temp|bcd_tens[1]~2_combout\ & ((\bin_to_bcd_temp|bcd_tens[3]~1_combout\) 
-- # ((!\bin_to_bcd_temp|bcd_tens[0]~3_combout\ & \bin_to_bcd_temp|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_temp|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_temp|bcd_tens[0]~3_combout\,
	datac => \bin_to_bcd_temp|bcd_tens[3]~1_combout\,
	datad => \bin_to_bcd_temp|bcd_tens[2]~0_combout\,
	combout => \HEX1_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X96_Y17_N28
\bin_to_bcd_td|bcd~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~11_combout\ = (\U2|td_val\(6) & ((\U2|td_val\(5) & (!\U2|td_val\(7) & !\U2|td_val\(4))) # (!\U2|td_val\(5) & (\U2|td_val\(7) & \U2|td_val\(4))))) # (!\U2|td_val\(6) & (\U2|td_val\(4) $ (((!\U2|td_val\(5) & \U2|td_val\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \bin_to_bcd_td|bcd~11_combout\);

-- Location: LCCOMB_X96_Y17_N30
\bin_to_bcd_td|bcd~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~12_combout\ = (\U2|td_val\(5) & (!\U2|td_val\(7) & ((\U2|td_val\(4)) # (!\U2|td_val\(6))))) # (!\U2|td_val\(5) & (\U2|td_val\(7) & ((\U2|td_val\(6)) # (!\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \bin_to_bcd_td|bcd~12_combout\);

-- Location: LCCOMB_X96_Y17_N6
\bin_to_bcd_td|bcd~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~10_combout\ = (\U2|td_val\(6) & (!\U2|td_val\(4) & (\U2|td_val\(5) $ (!\U2|td_val\(7))))) # (!\U2|td_val\(6) & (!\U2|td_val\(5) & (\U2|td_val\(7) & \U2|td_val\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \bin_to_bcd_td|bcd~10_combout\);

-- Location: LCCOMB_X96_Y17_N26
\bin_to_bcd_td|bcd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~1_combout\ = (\U2|td_val\(3) & (((!\bin_to_bcd_td|bcd~12_combout\ & !\bin_to_bcd_td|bcd~10_combout\)))) # (!\U2|td_val\(3) & ((\bin_to_bcd_td|bcd~10_combout\) # ((\bin_to_bcd_td|bcd~11_combout\ & \bin_to_bcd_td|bcd~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \bin_to_bcd_td|bcd~11_combout\,
	datac => \bin_to_bcd_td|bcd~12_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \bin_to_bcd_td|bcd~1_combout\);

-- Location: LCCOMB_X96_Y17_N16
\bin_to_bcd_td|bcd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~2_combout\ = (\U2|td_val\(3) & (\bin_to_bcd_td|bcd~11_combout\)) # (!\U2|td_val\(3) & ((\bin_to_bcd_td|bcd~11_combout\ & (!\bin_to_bcd_td|bcd~12_combout\ & !\bin_to_bcd_td|bcd~10_combout\)) # (!\bin_to_bcd_td|bcd~11_combout\ & 
-- ((\bin_to_bcd_td|bcd~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \bin_to_bcd_td|bcd~11_combout\,
	datac => \bin_to_bcd_td|bcd~12_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \bin_to_bcd_td|bcd~2_combout\);

-- Location: LCCOMB_X96_Y17_N0
\bin_to_bcd_td|bcd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~0_combout\ = (\bin_to_bcd_td|bcd~12_combout\ & (!\U2|td_val\(3) & (!\bin_to_bcd_td|bcd~11_combout\))) # (!\bin_to_bcd_td|bcd~12_combout\ & (\bin_to_bcd_td|bcd~10_combout\ & ((\U2|td_val\(3)) # (\bin_to_bcd_td|bcd~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \bin_to_bcd_td|bcd~11_combout\,
	datac => \bin_to_bcd_td|bcd~12_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \bin_to_bcd_td|bcd~0_combout\);

-- Location: LCCOMB_X100_Y17_N26
\bin_to_bcd_td|bcd~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~4_combout\ = (\bin_to_bcd_td|bcd~2_combout\ & (!\U2|td_val\(2) & ((\bin_to_bcd_td|bcd~1_combout\) # (\bin_to_bcd_td|bcd~0_combout\)))) # (!\bin_to_bcd_td|bcd~2_combout\ & ((\U2|td_val\(2) $ (\bin_to_bcd_td|bcd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(2),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \bin_to_bcd_td|bcd~4_combout\);

-- Location: LCCOMB_X100_Y17_N8
\bin_to_bcd_td|bcd~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~5_combout\ = (\bin_to_bcd_td|bcd~1_combout\ & ((\U2|td_val\(2)) # ((!\bin_to_bcd_td|bcd~2_combout\ & !\bin_to_bcd_td|bcd~0_combout\)))) # (!\bin_to_bcd_td|bcd~1_combout\ & (((!\U2|td_val\(2) & \bin_to_bcd_td|bcd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(2),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \bin_to_bcd_td|bcd~5_combout\);

-- Location: LCCOMB_X100_Y17_N28
\bin_to_bcd_td|bcd~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~3_combout\ = (\bin_to_bcd_td|bcd~2_combout\ & (!\bin_to_bcd_td|bcd~1_combout\ & (!\U2|td_val\(2)))) # (!\bin_to_bcd_td|bcd~2_combout\ & (\bin_to_bcd_td|bcd~0_combout\ & ((\bin_to_bcd_td|bcd~1_combout\) # (\U2|td_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(2),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \bin_to_bcd_td|bcd~3_combout\);

-- Location: LCCOMB_X103_Y17_N22
\bin_to_bcd_td|bcd_ones[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_ones[2]~1_combout\ = (\bin_to_bcd_td|bcd~4_combout\ & ((\U2|td_val\(1)) # ((!\bin_to_bcd_td|bcd~5_combout\ & !\bin_to_bcd_td|bcd~3_combout\)))) # (!\bin_to_bcd_td|bcd~4_combout\ & (((!\U2|td_val\(1) & \bin_to_bcd_td|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~4_combout\,
	datab => \bin_to_bcd_td|bcd~5_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~3_combout\,
	combout => \bin_to_bcd_td|bcd_ones[2]~1_combout\);

-- Location: LCCOMB_X103_Y17_N16
\bin_to_bcd_td|bcd_ones[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_ones[3]~0_combout\ = (\bin_to_bcd_td|bcd~5_combout\ & (!\bin_to_bcd_td|bcd~4_combout\ & (!\U2|td_val\(1)))) # (!\bin_to_bcd_td|bcd~5_combout\ & (\bin_to_bcd_td|bcd~3_combout\ & ((\bin_to_bcd_td|bcd~4_combout\) # (\U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~4_combout\,
	datab => \bin_to_bcd_td|bcd~5_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~3_combout\,
	combout => \bin_to_bcd_td|bcd_ones[3]~0_combout\);

-- Location: LCCOMB_X103_Y17_N28
\bin_to_bcd_td|bcd_ones[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_ones[1]~2_combout\ = (\bin_to_bcd_td|bcd~5_combout\ & (!\U2|td_val\(1) & ((\bin_to_bcd_td|bcd~4_combout\) # (\bin_to_bcd_td|bcd~3_combout\)))) # (!\bin_to_bcd_td|bcd~5_combout\ & ((\U2|td_val\(1) $ (\bin_to_bcd_td|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~4_combout\,
	datab => \bin_to_bcd_td|bcd~5_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~3_combout\,
	combout => \bin_to_bcd_td|bcd_ones[1]~2_combout\);

-- Location: LCCOMB_X103_Y17_N14
\HEX2_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~23_combout\ = (\bin_to_bcd_td|bcd_ones[1]~2_combout\ & (((\bin_to_bcd_td|bcd_ones[3]~0_combout\)))) # (!\bin_to_bcd_td|bcd_ones[1]~2_combout\ & (\bin_to_bcd_td|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_td|bcd_ones[3]~0_combout\ & 
-- \U2|td_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X100_Y17_N22
\HEX2_inst|decOut_n~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~25_combout\ = (\U2|td_val\(0) & (((\U2|td_val\(1) & \bin_to_bcd_td|bcd~0_combout\)))) # (!\U2|td_val\(0) & (\bin_to_bcd_td|bcd~2_combout\ & (!\U2|td_val\(1) & !\bin_to_bcd_td|bcd~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \HEX2_inst|decOut_n~25_combout\);

-- Location: LCCOMB_X103_Y17_N12
\HEX2_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~24_combout\ = (\bin_to_bcd_td|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_td|bcd_ones[3]~0_combout\ & (\U2|td_val\(0) & \bin_to_bcd_td|bcd_ones[1]~2_combout\))) # (!\bin_to_bcd_td|bcd_ones[2]~1_combout\ & 
-- (\bin_to_bcd_td|bcd_ones[3]~0_combout\ & ((!\bin_to_bcd_td|bcd_ones[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X100_Y17_N16
\HEX2_inst|decOut_n~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~26_combout\ = (\HEX2_inst|decOut_n~25_combout\) # ((!\bin_to_bcd_td|bcd~0_combout\ & (\bin_to_bcd_td|bcd~2_combout\ & !\HEX2_inst|decOut_n~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~0_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \HEX2_inst|decOut_n~25_combout\,
	datad => \HEX2_inst|decOut_n~24_combout\,
	combout => \HEX2_inst|decOut_n~26_combout\);

-- Location: LCCOMB_X100_Y17_N20
\HEX2_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~37_combout\ = (!\bin_to_bcd_td|bcd~2_combout\ & ((\bin_to_bcd_td|bcd~0_combout\ & ((!\HEX2_inst|decOut_n~24_combout\) # (!\U2|td_val\(1)))) # (!\bin_to_bcd_td|bcd~0_combout\ & (\U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~0_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(1),
	datad => \HEX2_inst|decOut_n~24_combout\,
	combout => \HEX2_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X100_Y17_N6
\HEX2_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~38_combout\ = (!\bin_to_bcd_td|bcd~2_combout\ & ((\U2|td_val\(0) & (!\U2|td_val\(1) & !\HEX2_inst|decOut_n~37_combout\)) # (!\U2|td_val\(0) & ((\HEX2_inst|decOut_n~37_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(1),
	datad => \HEX2_inst|decOut_n~37_combout\,
	combout => \HEX2_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X100_Y17_N14
\HEX2_inst|decOut_n~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~27_combout\ = (\bin_to_bcd_td|bcd~1_combout\ & (((\U2|td_val\(2))))) # (!\bin_to_bcd_td|bcd~1_combout\ & ((\U2|td_val\(2) & ((\HEX2_inst|decOut_n~38_combout\))) # (!\U2|td_val\(2) & (\HEX2_inst|decOut_n~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \HEX2_inst|decOut_n~26_combout\,
	datac => \U2|td_val\(2),
	datad => \HEX2_inst|decOut_n~38_combout\,
	combout => \HEX2_inst|decOut_n~27_combout\);

-- Location: LCCOMB_X100_Y17_N4
\HEX2_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~39_combout\ = (\U2|td_val\(0) & ((\bin_to_bcd_td|bcd~2_combout\ $ (\HEX2_inst|decOut_n~24_combout\)) # (!\U2|td_val\(1)))) # (!\U2|td_val\(0) & (\U2|td_val\(1) $ (((!\bin_to_bcd_td|bcd~2_combout\ & !\HEX2_inst|decOut_n~24_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101011001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(1),
	datad => \HEX2_inst|decOut_n~24_combout\,
	combout => \HEX2_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X100_Y17_N30
\HEX2_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~40_combout\ = (\bin_to_bcd_td|bcd~0_combout\ & ((\HEX2_inst|decOut_n~39_combout\) # ((!\bin_to_bcd_td|bcd~2_combout\ & !\HEX2_inst|decOut_n~24_combout\)))) # (!\bin_to_bcd_td|bcd~0_combout\ & (\HEX2_inst|decOut_n~39_combout\ & 
-- ((\bin_to_bcd_td|bcd~2_combout\) # (!\HEX2_inst|decOut_n~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~0_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \HEX2_inst|decOut_n~39_combout\,
	datad => \HEX2_inst|decOut_n~24_combout\,
	combout => \HEX2_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X96_Y17_N18
\HEX2_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~29_combout\ = (\bin_to_bcd_td|bcd~12_combout\ & (\U2|td_val\(3) $ ((\bin_to_bcd_td|bcd~11_combout\)))) # (!\bin_to_bcd_td|bcd~12_combout\ & (((!\bin_to_bcd_td|bcd~11_combout\ & !\bin_to_bcd_td|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \bin_to_bcd_td|bcd~11_combout\,
	datac => \bin_to_bcd_td|bcd~12_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \HEX2_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X100_Y17_N24
\HEX2_inst|decOut_n~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~28_combout\ = (\U2|td_val\(0) & (!\bin_to_bcd_td|bcd~2_combout\ & (\U2|td_val\(1) $ (\bin_to_bcd_td|bcd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \HEX2_inst|decOut_n~28_combout\);

-- Location: LCCOMB_X100_Y17_N10
\HEX2_inst|decOut_n~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~30_combout\ = (\HEX2_inst|decOut_n~28_combout\) # ((!\HEX2_inst|decOut_n~24_combout\ & (!\HEX2_inst|decOut_n~29_combout\ & !\U2|td_val\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX2_inst|decOut_n~24_combout\,
	datab => \HEX2_inst|decOut_n~29_combout\,
	datac => \U2|td_val\(1),
	datad => \HEX2_inst|decOut_n~28_combout\,
	combout => \HEX2_inst|decOut_n~30_combout\);

-- Location: LCCOMB_X100_Y17_N12
\HEX2_inst|decOut_n~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~31_combout\ = (\bin_to_bcd_td|bcd~1_combout\ & ((\HEX2_inst|decOut_n~27_combout\ & ((\HEX2_inst|decOut_n~30_combout\))) # (!\HEX2_inst|decOut_n~27_combout\ & (\HEX2_inst|decOut_n~40_combout\)))) # (!\bin_to_bcd_td|bcd~1_combout\ & 
-- (\HEX2_inst|decOut_n~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \HEX2_inst|decOut_n~27_combout\,
	datac => \HEX2_inst|decOut_n~40_combout\,
	datad => \HEX2_inst|decOut_n~30_combout\,
	combout => \HEX2_inst|decOut_n~31_combout\);

-- Location: LCCOMB_X103_Y17_N6
\HEX2_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~32_combout\ = (\bin_to_bcd_td|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_td|bcd_ones[3]~0_combout\)) # (!\bin_to_bcd_td|bcd_ones[2]~1_combout\ & (((!\bin_to_bcd_td|bcd_ones[3]~0_combout\ & \U2|td_val\(0))) # 
-- (!\bin_to_bcd_td|bcd_ones[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X103_Y17_N4
\HEX2_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~33_combout\ = (\bin_to_bcd_td|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_td|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_td|bcd_ones[2]~1_combout\ & \U2|td_val\(0))))) # (!\bin_to_bcd_td|bcd_ones[1]~2_combout\ & 
-- (\bin_to_bcd_td|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_td|bcd_ones[3]~0_combout\ & \U2|td_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X96_Y18_N6
\HEX2_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~15_combout\ = (\U2|td_val\(5) & (!\U2|td_val\(6) & (\U2|td_val\(4) & !\U2|td_val\(7)))) # (!\U2|td_val\(5) & (\U2|td_val\(7) & (\U2|td_val\(6) $ (!\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX2_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X96_Y18_N14
\HEX2_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~8_combout\ = (\U2|td_val\(5) & (\U2|td_val\(7) & (\U2|td_val\(6) $ (!\U2|td_val\(4))))) # (!\U2|td_val\(5) & (!\U2|td_val\(7) & (\U2|td_val\(6) $ (!\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX2_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X96_Y18_N8
\HEX2_inst|decOut_n~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~9_combout\ = (\U2|td_val\(5) & (!\U2|td_val\(7) & (\U2|td_val\(6) $ (!\U2|td_val\(4))))) # (!\U2|td_val\(5) & (\U2|td_val\(6) & (!\U2|td_val\(4) & \U2|td_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX2_inst|decOut_n~9_combout\);

-- Location: LCCOMB_X96_Y18_N28
\HEX2_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~21_combout\ = (\U2|td_val\(2) & (\U2|td_val\(3))) # (!\U2|td_val\(2) & ((\U2|td_val\(3) & ((\bin_to_bcd_td|bcd~10_combout\))) # (!\U2|td_val\(3) & (\HEX2_inst|decOut_n~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(3),
	datac => \HEX2_inst|decOut_n~9_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \HEX2_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X96_Y18_N2
\HEX2_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~22_combout\ = (\U2|td_val\(2) & ((\HEX2_inst|decOut_n~21_combout\ & ((\HEX2_inst|decOut_n~8_combout\))) # (!\HEX2_inst|decOut_n~21_combout\ & (\HEX2_inst|decOut_n~15_combout\)))) # (!\U2|td_val\(2) & 
-- (((\HEX2_inst|decOut_n~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX2_inst|decOut_n~15_combout\,
	datab => \HEX2_inst|decOut_n~8_combout\,
	datac => \U2|td_val\(2),
	datad => \HEX2_inst|decOut_n~21_combout\,
	combout => \HEX2_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X96_Y20_N24
\HEX2_inst|decOut_n~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~6_combout\ = (\U2|td_val\(6) & (!\U2|td_val\(7) & (!\U2|td_val\(4) & \U2|td_val\(5)))) # (!\U2|td_val\(6) & (\U2|td_val\(4) & (\U2|td_val\(7) $ (!\U2|td_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \U2|td_val\(7),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(5),
	combout => \HEX2_inst|decOut_n~6_combout\);

-- Location: LCCOMB_X96_Y20_N2
\HEX2_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~19_combout\ = (\U2|td_val\(3) & (((\U2|td_val\(2)) # (\HEX2_inst|decOut_n~6_combout\)))) # (!\U2|td_val\(3) & (\bin_to_bcd_td|bcd~10_combout\ & (!\U2|td_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~10_combout\,
	datab => \U2|td_val\(3),
	datac => \U2|td_val\(2),
	datad => \HEX2_inst|decOut_n~6_combout\,
	combout => \HEX2_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X96_Y18_N30
\HEX2_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~20_combout\ = (\U2|td_val\(2) & ((\HEX2_inst|decOut_n~19_combout\ & ((\HEX2_inst|decOut_n~9_combout\))) # (!\HEX2_inst|decOut_n~19_combout\ & (\HEX2_inst|decOut_n~8_combout\)))) # (!\U2|td_val\(2) & 
-- (((\HEX2_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \HEX2_inst|decOut_n~8_combout\,
	datac => \HEX2_inst|decOut_n~9_combout\,
	datad => \HEX2_inst|decOut_n~19_combout\,
	combout => \HEX2_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X96_Y18_N12
\HEX2_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~36_combout\ = (\U2|td_val\(0)) # ((\U2|td_val\(1) & (\HEX2_inst|decOut_n~22_combout\)) # (!\U2|td_val\(1) & ((\HEX2_inst|decOut_n~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(1),
	datab => \HEX2_inst|decOut_n~22_combout\,
	datac => \HEX2_inst|decOut_n~20_combout\,
	datad => \U2|td_val\(0),
	combout => \HEX2_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X103_Y17_N18
\HEX2_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~34_combout\ = (\bin_to_bcd_td|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_td|bcd_ones[3]~0_combout\ & ((!\bin_to_bcd_td|bcd_ones[1]~2_combout\) # (!\U2|td_val\(0))))) # (!\bin_to_bcd_td|bcd_ones[2]~1_combout\ & 
-- (!\bin_to_bcd_td|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_td|bcd_ones[3]~0_combout\) # (!\U2|td_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X103_Y17_N24
\HEX2_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~35_combout\ = (\bin_to_bcd_td|bcd_ones[2]~1_combout\ & ((\bin_to_bcd_td|bcd_ones[3]~0_combout\) # ((\U2|td_val\(0) & \bin_to_bcd_td|bcd_ones[1]~2_combout\)))) # (!\bin_to_bcd_td|bcd_ones[2]~1_combout\ & 
-- (\bin_to_bcd_td|bcd_ones[3]~0_combout\ $ (((!\bin_to_bcd_td|bcd_ones[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_ones[2]~1_combout\,
	datab => \bin_to_bcd_td|bcd_ones[3]~0_combout\,
	datac => \U2|td_val\(0),
	datad => \bin_to_bcd_td|bcd_ones[1]~2_combout\,
	combout => \HEX2_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X96_Y17_N12
\bin_to_bcd_td|bcd~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~14_combout\ = \bin_to_bcd_td|bcd~10_combout\ $ ((((!\U2|td_val\(3) & !\bin_to_bcd_td|bcd~11_combout\)) # (!\bin_to_bcd_td|bcd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(3),
	datab => \bin_to_bcd_td|bcd~11_combout\,
	datac => \bin_to_bcd_td|bcd~12_combout\,
	datad => \bin_to_bcd_td|bcd~10_combout\,
	combout => \bin_to_bcd_td|bcd~14_combout\);

-- Location: LCCOMB_X96_Y17_N24
\bin_to_bcd_td|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|LessThan0~1_combout\ = (\U2|td_val\(7) & ((\U2|td_val\(5)) # (\U2|td_val\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	combout => \bin_to_bcd_td|LessThan0~1_combout\);

-- Location: LCCOMB_X96_Y17_N22
\bin_to_bcd_td|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|LessThan0~0_combout\ = (\U2|td_val\(6)) # (\U2|td_val\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(5),
	combout => \bin_to_bcd_td|LessThan0~0_combout\);

-- Location: LCCOMB_X96_Y17_N10
\bin_to_bcd_td|bcd~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~8_combout\ = (\U2|td_val\(5) & (\U2|td_val\(6) & (\U2|td_val\(7) & \U2|td_val\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \bin_to_bcd_td|bcd~8_combout\);

-- Location: LCCOMB_X96_Y17_N20
\bin_to_bcd_td|bcd~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~9_combout\ = (\bin_to_bcd_td|bcd~8_combout\) # ((!\bin_to_bcd_td|bcd~14_combout\ & ((!\bin_to_bcd_td|LessThan0~0_combout\) # (!\bin_to_bcd_td|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~14_combout\,
	datab => \bin_to_bcd_td|LessThan0~1_combout\,
	datac => \bin_to_bcd_td|LessThan0~0_combout\,
	datad => \bin_to_bcd_td|bcd~8_combout\,
	combout => \bin_to_bcd_td|bcd~9_combout\);

-- Location: LCCOMB_X96_Y17_N14
\bin_to_bcd_td|bcd~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~13_combout\ = (\U2|td_val\(5) & (((\U2|td_val\(7) & !\U2|td_val\(4))) # (!\U2|td_val\(6)))) # (!\U2|td_val\(5) & ((\U2|td_val\(6) & ((\U2|td_val\(7)) # (!\U2|td_val\(4)))) # (!\U2|td_val\(6) & (!\U2|td_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \bin_to_bcd_td|bcd~13_combout\);

-- Location: LCCOMB_X96_Y17_N4
\bin_to_bcd_td|bcd~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~7_combout\ = (!\bin_to_bcd_td|bcd~13_combout\ & (((!\bin_to_bcd_td|LessThan0~1_combout\) # (!\bin_to_bcd_td|LessThan0~0_combout\)) # (!\bin_to_bcd_td|bcd~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~14_combout\,
	datab => \bin_to_bcd_td|bcd~13_combout\,
	datac => \bin_to_bcd_td|LessThan0~0_combout\,
	datad => \bin_to_bcd_td|LessThan0~1_combout\,
	combout => \bin_to_bcd_td|bcd~7_combout\);

-- Location: LCCOMB_X96_Y17_N8
\bin_to_bcd_td|bcd~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~6_combout\ = (\bin_to_bcd_td|bcd~14_combout\ & (\bin_to_bcd_td|bcd~13_combout\ & \bin_to_bcd_td|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~14_combout\,
	datac => \bin_to_bcd_td|bcd~13_combout\,
	datad => \bin_to_bcd_td|LessThan0~1_combout\,
	combout => \bin_to_bcd_td|bcd~6_combout\);

-- Location: LCCOMB_X100_Y17_N18
\bin_to_bcd_td|bcd~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd~15_combout\ = \bin_to_bcd_td|bcd~0_combout\ $ ((((!\bin_to_bcd_td|bcd~1_combout\ & !\U2|td_val\(2))) # (!\bin_to_bcd_td|bcd~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~1_combout\,
	datab => \bin_to_bcd_td|bcd~2_combout\,
	datac => \U2|td_val\(2),
	datad => \bin_to_bcd_td|bcd~0_combout\,
	combout => \bin_to_bcd_td|bcd~15_combout\);

-- Location: LCCOMB_X103_Y13_N12
\bin_to_bcd_td|bcd_tens[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_tens[1]~2_combout\ = (\bin_to_bcd_td|bcd~7_combout\ & (((!\bin_to_bcd_td|bcd~9_combout\ & !\bin_to_bcd_td|bcd~6_combout\)) # (!\bin_to_bcd_td|bcd~15_combout\))) # (!\bin_to_bcd_td|bcd~7_combout\ & ((\bin_to_bcd_td|bcd~6_combout\ $ 
-- (\bin_to_bcd_td|bcd~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~9_combout\,
	datab => \bin_to_bcd_td|bcd~7_combout\,
	datac => \bin_to_bcd_td|bcd~6_combout\,
	datad => \bin_to_bcd_td|bcd~15_combout\,
	combout => \bin_to_bcd_td|bcd_tens[1]~2_combout\);

-- Location: LCCOMB_X103_Y13_N18
\bin_to_bcd_td|bcd_tens[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_tens[3]~1_combout\ = (\bin_to_bcd_td|bcd~15_combout\ & (!\bin_to_bcd_td|bcd~9_combout\ & (\bin_to_bcd_td|bcd~7_combout\))) # (!\bin_to_bcd_td|bcd~15_combout\ & (((\bin_to_bcd_td|bcd~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~9_combout\,
	datab => \bin_to_bcd_td|bcd~7_combout\,
	datac => \bin_to_bcd_td|bcd~6_combout\,
	datad => \bin_to_bcd_td|bcd~15_combout\,
	combout => \bin_to_bcd_td|bcd_tens[3]~1_combout\);

-- Location: LCCOMB_X103_Y17_N10
\bin_to_bcd_td|bcd_tens[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_tens[0]~3_combout\ = \bin_to_bcd_td|bcd~3_combout\ $ ((((!\bin_to_bcd_td|bcd~4_combout\ & !\U2|td_val\(1))) # (!\bin_to_bcd_td|bcd~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~4_combout\,
	datab => \bin_to_bcd_td|bcd~5_combout\,
	datac => \U2|td_val\(1),
	datad => \bin_to_bcd_td|bcd~3_combout\,
	combout => \bin_to_bcd_td|bcd_tens[0]~3_combout\);

-- Location: LCCOMB_X103_Y13_N28
\bin_to_bcd_td|bcd_tens[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_td|bcd_tens[2]~0_combout\ = (\bin_to_bcd_td|bcd~9_combout\ & (((!\bin_to_bcd_td|bcd~7_combout\ & !\bin_to_bcd_td|bcd~6_combout\)) # (!\bin_to_bcd_td|bcd~15_combout\))) # (!\bin_to_bcd_td|bcd~9_combout\ & (((\bin_to_bcd_td|bcd~6_combout\ & 
-- \bin_to_bcd_td|bcd~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd~9_combout\,
	datab => \bin_to_bcd_td|bcd~7_combout\,
	datac => \bin_to_bcd_td|bcd~6_combout\,
	datad => \bin_to_bcd_td|bcd~15_combout\,
	combout => \bin_to_bcd_td|bcd_tens[2]~0_combout\);

-- Location: LCCOMB_X103_Y13_N10
\HEX3_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~36_combout\ = (\bin_to_bcd_td|bcd_tens[1]~2_combout\ & (\bin_to_bcd_td|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_td|bcd_tens[3]~1_combout\ & !\bin_to_bcd_td|bcd_tens[0]~3_combout\))))) # (!\bin_to_bcd_td|bcd_tens[1]~2_combout\ & 
-- (\bin_to_bcd_td|bcd_tens[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_td|bcd_tens[3]~1_combout\,
	datac => \bin_to_bcd_td|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_td|bcd_tens[2]~0_combout\,
	combout => \HEX3_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X96_Y18_N22
\HEX3_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~23_combout\ = (\U2|td_val\(5) & (!\U2|td_val\(6) & (\U2|td_val\(4) $ (\U2|td_val\(7))))) # (!\U2|td_val\(5) & (\U2|td_val\(6) & (!\U2|td_val\(4) & !\U2|td_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX3_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X96_Y18_N4
\HEX3_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~24_combout\ = (\U2|td_val\(4) & ((\U2|td_val\(5) & (\U2|td_val\(6) $ (!\U2|td_val\(7)))) # (!\U2|td_val\(5) & (!\U2|td_val\(6) & \U2|td_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX3_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X96_Y18_N10
\HEX3_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~22_combout\ = (\U2|td_val\(3) & ((\HEX3_inst|decOut_n~24_combout\))) # (!\U2|td_val\(3) & (\HEX3_inst|decOut_n~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX3_inst|decOut_n~23_combout\,
	datab => \HEX3_inst|decOut_n~24_combout\,
	datac => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X96_Y18_N18
\HEX3_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~21_combout\ = (!\U2|td_val\(6) & ((\U2|td_val\(5) & (\U2|td_val\(4) $ (\U2|td_val\(7)))) # (!\U2|td_val\(5) & (\U2|td_val\(4) & \U2|td_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX3_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X96_Y18_N0
\HEX3_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~29_combout\ = (\U2|td_val\(3) & (\HEX3_inst|decOut_n~24_combout\)) # (!\U2|td_val\(3) & ((\HEX3_inst|decOut_n~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \HEX3_inst|decOut_n~24_combout\,
	datac => \U2|td_val\(3),
	datad => \HEX3_inst|decOut_n~21_combout\,
	combout => \HEX3_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X96_Y18_N24
\HEX3_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~20_combout\ = (!\U2|td_val\(4) & ((\U2|td_val\(5) & (!\U2|td_val\(6) & \U2|td_val\(7))) # (!\U2|td_val\(5) & (\U2|td_val\(6) & !\U2|td_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(4),
	datad => \U2|td_val\(7),
	combout => \HEX3_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X96_Y18_N20
\HEX3_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~19_combout\ = (\U2|td_val\(3) & ((\HEX3_inst|decOut_n~21_combout\))) # (!\U2|td_val\(3) & (\HEX3_inst|decOut_n~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \HEX3_inst|decOut_n~20_combout\,
	datac => \U2|td_val\(3),
	datad => \HEX3_inst|decOut_n~21_combout\,
	combout => \HEX3_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X96_Y18_N16
\HEX3_inst|decOut_n~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~42_combout\ = (\U2|td_val\(1) & ((\U2|td_val\(2) $ (\HEX3_inst|decOut_n~22_combout\)))) # (!\U2|td_val\(1) & ((\U2|td_val\(2) & ((\HEX3_inst|decOut_n~22_combout\))) # (!\U2|td_val\(2) & (\HEX3_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(1),
	datab => \HEX3_inst|decOut_n~19_combout\,
	datac => \U2|td_val\(2),
	datad => \HEX3_inst|decOut_n~22_combout\,
	combout => \HEX3_inst|decOut_n~42_combout\);

-- Location: LCCOMB_X96_Y18_N26
\HEX3_inst|decOut_n~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~43_combout\ = (\HEX3_inst|decOut_n~22_combout\ & ((\HEX3_inst|decOut_n~42_combout\) # ((\HEX3_inst|decOut_n~29_combout\ & \U2|td_val\(2))))) # (!\HEX3_inst|decOut_n~22_combout\ & (\HEX3_inst|decOut_n~42_combout\ & 
-- ((\HEX3_inst|decOut_n~29_combout\) # (!\U2|td_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX3_inst|decOut_n~22_combout\,
	datab => \HEX3_inst|decOut_n~29_combout\,
	datac => \U2|td_val\(2),
	datad => \HEX3_inst|decOut_n~42_combout\,
	combout => \HEX3_inst|decOut_n~43_combout\);

-- Location: LCCOMB_X103_Y13_N16
\HEX3_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~37_combout\ = (\bin_to_bcd_td|bcd_tens[2]~0_combout\ & (((!\bin_to_bcd_td|bcd_tens[3]~1_combout\)))) # (!\bin_to_bcd_td|bcd_tens[2]~0_combout\ & ((\bin_to_bcd_td|bcd_tens[1]~2_combout\) # ((!\bin_to_bcd_td|bcd_tens[3]~1_combout\ & 
-- !\bin_to_bcd_td|bcd_tens[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_td|bcd_tens[3]~1_combout\,
	datac => \bin_to_bcd_td|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_td|bcd_tens[2]~0_combout\,
	combout => \HEX3_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X103_Y13_N2
\HEX3_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~38_combout\ = (\bin_to_bcd_td|bcd_tens[1]~2_combout\ & (\bin_to_bcd_td|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_td|bcd_tens[3]~1_combout\ & !\bin_to_bcd_td|bcd_tens[0]~3_combout\))))) # (!\bin_to_bcd_td|bcd_tens[1]~2_combout\ & 
-- ((\bin_to_bcd_td|bcd_tens[3]~1_combout\) # ((!\bin_to_bcd_td|bcd_tens[0]~3_combout\ & \bin_to_bcd_td|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110101000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_td|bcd_tens[3]~1_combout\,
	datac => \bin_to_bcd_td|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_td|bcd_tens[2]~0_combout\,
	combout => \HEX3_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X96_Y20_N4
\HEX3_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~4_combout\ = (\U2|td_val\(2) & (\U2|td_val\(3) & ((\U2|td_val\(1)) # (!\U2|td_val\(4))))) # (!\U2|td_val\(2) & ((\U2|td_val\(4) & ((!\U2|td_val\(3)))) # (!\U2|td_val\(4) & (\U2|td_val\(1) & \U2|td_val\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X96_Y20_N28
\HEX3_inst|decOut_n~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~11_combout\ = (\U2|td_val\(2)) # ((\U2|td_val\(4)) # ((\U2|td_val\(1)) # (\U2|td_val\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~11_combout\);

-- Location: LCCOMB_X96_Y20_N14
\HEX3_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~34_combout\ = (\U2|td_val\(6) & (\U2|td_val\(5))) # (!\U2|td_val\(6) & ((\U2|td_val\(5) & (\HEX3_inst|decOut_n~4_combout\)) # (!\U2|td_val\(5) & ((\HEX3_inst|decOut_n~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \U2|td_val\(5),
	datac => \HEX3_inst|decOut_n~4_combout\,
	datad => \HEX3_inst|decOut_n~11_combout\,
	combout => \HEX3_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X96_Y20_N26
\HEX3_inst|decOut_n~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~14_combout\ = (\U2|td_val\(2) & (((!\U2|td_val\(3))))) # (!\U2|td_val\(2) & ((\U2|td_val\(4) & ((\U2|td_val\(1)) # (\U2|td_val\(3)))) # (!\U2|td_val\(4) & ((!\U2|td_val\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~14_combout\);

-- Location: LCCOMB_X96_Y20_N0
\HEX3_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~15_combout\ = (\U2|td_val\(4)) # ((\U2|td_val\(3)) # ((\U2|td_val\(2) & \U2|td_val\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X96_Y20_N12
\HEX3_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~35_combout\ = (\U2|td_val\(6) & ((\HEX3_inst|decOut_n~34_combout\ & ((\HEX3_inst|decOut_n~15_combout\))) # (!\HEX3_inst|decOut_n~34_combout\ & (\HEX3_inst|decOut_n~14_combout\)))) # (!\U2|td_val\(6) & (\HEX3_inst|decOut_n~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \HEX3_inst|decOut_n~34_combout\,
	datac => \HEX3_inst|decOut_n~14_combout\,
	datad => \HEX3_inst|decOut_n~15_combout\,
	combout => \HEX3_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X96_Y20_N16
\HEX3_inst|decOut_n~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~7_combout\ = (\U2|td_val\(2) & ((\U2|td_val\(3)) # ((!\U2|td_val\(4) & \U2|td_val\(1))))) # (!\U2|td_val\(2) & (\U2|td_val\(3) & ((\U2|td_val\(1)) # (!\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~7_combout\);

-- Location: LCCOMB_X96_Y20_N22
\HEX3_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~8_combout\ = (\U2|td_val\(2) & ((\U2|td_val\(4) & ((!\U2|td_val\(3)))) # (!\U2|td_val\(4) & (\U2|td_val\(1) & \U2|td_val\(3))))) # (!\U2|td_val\(2) & (((!\U2|td_val\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(4),
	datac => \U2|td_val\(1),
	datad => \U2|td_val\(3),
	combout => \HEX3_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X96_Y20_N30
\HEX3_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~5_combout\ = ((!\U2|td_val\(4)) # (!\U2|td_val\(3))) # (!\U2|td_val\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(2),
	datab => \U2|td_val\(3),
	datac => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X96_Y20_N10
\HEX3_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~32_combout\ = (\U2|td_val\(6) & (((\U2|td_val\(5))))) # (!\U2|td_val\(6) & ((\U2|td_val\(5) & ((\HEX3_inst|decOut_n~5_combout\))) # (!\U2|td_val\(5) & (\HEX3_inst|decOut_n~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \HEX3_inst|decOut_n~4_combout\,
	datac => \HEX3_inst|decOut_n~5_combout\,
	datad => \U2|td_val\(5),
	combout => \HEX3_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X96_Y20_N20
\HEX3_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~33_combout\ = (\U2|td_val\(6) & ((\HEX3_inst|decOut_n~32_combout\ & ((\HEX3_inst|decOut_n~8_combout\))) # (!\HEX3_inst|decOut_n~32_combout\ & (\HEX3_inst|decOut_n~7_combout\)))) # (!\U2|td_val\(6) & 
-- (((\HEX3_inst|decOut_n~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(6),
	datab => \HEX3_inst|decOut_n~7_combout\,
	datac => \HEX3_inst|decOut_n~8_combout\,
	datad => \HEX3_inst|decOut_n~32_combout\,
	combout => \HEX3_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X96_Y20_N18
\HEX3_inst|decOut_n~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~41_combout\ = (\U2|td_val\(7) & (\HEX3_inst|decOut_n~35_combout\)) # (!\U2|td_val\(7) & ((\HEX3_inst|decOut_n~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX3_inst|decOut_n~35_combout\,
	datac => \U2|td_val\(7),
	datad => \HEX3_inst|decOut_n~33_combout\,
	combout => \HEX3_inst|decOut_n~41_combout\);

-- Location: LCCOMB_X103_Y13_N0
\HEX3_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~39_combout\ = (\bin_to_bcd_td|bcd_tens[0]~3_combout\ & ((\bin_to_bcd_td|bcd_tens[2]~0_combout\ & ((!\bin_to_bcd_td|bcd_tens[3]~1_combout\))) # (!\bin_to_bcd_td|bcd_tens[2]~0_combout\ & (\bin_to_bcd_td|bcd_tens[1]~2_combout\)))) # 
-- (!\bin_to_bcd_td|bcd_tens[0]~3_combout\ & (\bin_to_bcd_td|bcd_tens[1]~2_combout\ & (\bin_to_bcd_td|bcd_tens[3]~1_combout\ $ (\bin_to_bcd_td|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_td|bcd_tens[3]~1_combout\,
	datac => \bin_to_bcd_td|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_td|bcd_tens[2]~0_combout\,
	combout => \HEX3_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X103_Y13_N30
\HEX3_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~40_combout\ = (\bin_to_bcd_td|bcd_tens[1]~2_combout\ & (\bin_to_bcd_td|bcd_tens[3]~1_combout\ $ (((!\bin_to_bcd_td|bcd_tens[2]~0_combout\))))) # (!\bin_to_bcd_td|bcd_tens[1]~2_combout\ & ((\bin_to_bcd_td|bcd_tens[3]~1_combout\) # 
-- ((!\bin_to_bcd_td|bcd_tens[0]~3_combout\ & \bin_to_bcd_td|bcd_tens[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_td|bcd_tens[1]~2_combout\,
	datab => \bin_to_bcd_td|bcd_tens[3]~1_combout\,
	datac => \bin_to_bcd_td|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_td|bcd_tens[2]~0_combout\,
	combout => \HEX3_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X88_Y15_N26
\bin_to_bcd_tf|bcd~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~12_combout\ = (\U2|tf_val\(7) & (!\U2|tf_val\(5) & ((\U2|tf_val\(6)) # (!\U2|tf_val\(4))))) # (!\U2|tf_val\(7) & (\U2|tf_val\(5) & ((\U2|tf_val\(4)) # (!\U2|tf_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \bin_to_bcd_tf|bcd~12_combout\);

-- Location: LCCOMB_X87_Y15_N30
\bin_to_bcd_tf|bcd~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~11_combout\ = (\U2|tf_val\(4) & (\U2|tf_val\(6) $ (((\U2|tf_val\(5)) # (!\U2|tf_val\(7)))))) # (!\U2|tf_val\(4) & ((\U2|tf_val\(5) & (!\U2|tf_val\(7) & \U2|tf_val\(6))) # (!\U2|tf_val\(5) & (\U2|tf_val\(7) & !\U2|tf_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \bin_to_bcd_tf|bcd~11_combout\);

-- Location: LCCOMB_X87_Y15_N12
\bin_to_bcd_tf|bcd~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~10_combout\ = (\U2|tf_val\(4) & (!\U2|tf_val\(5) & (\U2|tf_val\(7) & !\U2|tf_val\(6)))) # (!\U2|tf_val\(4) & (\U2|tf_val\(6) & (\U2|tf_val\(5) $ (!\U2|tf_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \bin_to_bcd_tf|bcd~10_combout\);

-- Location: LCCOMB_X87_Y15_N18
\bin_to_bcd_tf|bcd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~1_combout\ = (\U2|tf_val\(3) & (!\bin_to_bcd_tf|bcd~12_combout\ & ((!\bin_to_bcd_tf|bcd~10_combout\)))) # (!\U2|tf_val\(3) & ((\bin_to_bcd_tf|bcd~10_combout\) # ((\bin_to_bcd_tf|bcd~12_combout\ & \bin_to_bcd_tf|bcd~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \bin_to_bcd_tf|bcd~12_combout\,
	datac => \bin_to_bcd_tf|bcd~11_combout\,
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \bin_to_bcd_tf|bcd~1_combout\);

-- Location: LCCOMB_X87_Y15_N4
\bin_to_bcd_tf|bcd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~0_combout\ = (\bin_to_bcd_tf|bcd~12_combout\ & (!\U2|tf_val\(3) & (!\bin_to_bcd_tf|bcd~11_combout\))) # (!\bin_to_bcd_tf|bcd~12_combout\ & (\bin_to_bcd_tf|bcd~10_combout\ & ((\U2|tf_val\(3)) # (\bin_to_bcd_tf|bcd~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \bin_to_bcd_tf|bcd~12_combout\,
	datac => \bin_to_bcd_tf|bcd~11_combout\,
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \bin_to_bcd_tf|bcd~0_combout\);

-- Location: LCCOMB_X87_Y15_N24
\bin_to_bcd_tf|bcd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~2_combout\ = (\U2|tf_val\(3) & (((\bin_to_bcd_tf|bcd~11_combout\)))) # (!\U2|tf_val\(3) & ((\bin_to_bcd_tf|bcd~11_combout\ & (!\bin_to_bcd_tf|bcd~12_combout\ & !\bin_to_bcd_tf|bcd~10_combout\)) # (!\bin_to_bcd_tf|bcd~11_combout\ & 
-- ((\bin_to_bcd_tf|bcd~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \bin_to_bcd_tf|bcd~12_combout\,
	datac => \bin_to_bcd_tf|bcd~11_combout\,
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \bin_to_bcd_tf|bcd~2_combout\);

-- Location: LCCOMB_X87_Y11_N10
\bin_to_bcd_tf|bcd~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~4_combout\ = (\U2|tf_val\(2) & (((!\bin_to_bcd_tf|bcd~0_combout\ & !\bin_to_bcd_tf|bcd~2_combout\)))) # (!\U2|tf_val\(2) & ((\bin_to_bcd_tf|bcd~0_combout\) # ((\bin_to_bcd_tf|bcd~1_combout\ & \bin_to_bcd_tf|bcd~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \bin_to_bcd_tf|bcd~1_combout\,
	datac => \bin_to_bcd_tf|bcd~0_combout\,
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \bin_to_bcd_tf|bcd~4_combout\);

-- Location: LCCOMB_X87_Y11_N0
\bin_to_bcd_tf|bcd~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~5_combout\ = (\U2|tf_val\(2) & (\bin_to_bcd_tf|bcd~1_combout\)) # (!\U2|tf_val\(2) & ((\bin_to_bcd_tf|bcd~1_combout\ & (!\bin_to_bcd_tf|bcd~0_combout\ & !\bin_to_bcd_tf|bcd~2_combout\)) # (!\bin_to_bcd_tf|bcd~1_combout\ & 
-- (\bin_to_bcd_tf|bcd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \bin_to_bcd_tf|bcd~1_combout\,
	datac => \bin_to_bcd_tf|bcd~0_combout\,
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \bin_to_bcd_tf|bcd~5_combout\);

-- Location: LCCOMB_X87_Y11_N20
\bin_to_bcd_tf|bcd~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~3_combout\ = (\bin_to_bcd_tf|bcd~2_combout\ & (!\U2|tf_val\(2) & (!\bin_to_bcd_tf|bcd~1_combout\))) # (!\bin_to_bcd_tf|bcd~2_combout\ & (\bin_to_bcd_tf|bcd~0_combout\ & ((\U2|tf_val\(2)) # (\bin_to_bcd_tf|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \bin_to_bcd_tf|bcd~1_combout\,
	datac => \bin_to_bcd_tf|bcd~0_combout\,
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \bin_to_bcd_tf|bcd~3_combout\);

-- Location: LCCOMB_X87_Y11_N2
\bin_to_bcd_tf|bcd_ones[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_ones[3]~0_combout\ = (\bin_to_bcd_tf|bcd~5_combout\ & (!\bin_to_bcd_tf|bcd~4_combout\ & (!\U2|tf_val\(1)))) # (!\bin_to_bcd_tf|bcd~5_combout\ & (\bin_to_bcd_tf|bcd~3_combout\ & ((\bin_to_bcd_tf|bcd~4_combout\) # (\U2|tf_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~4_combout\,
	datab => \bin_to_bcd_tf|bcd~5_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~3_combout\,
	combout => \bin_to_bcd_tf|bcd_ones[3]~0_combout\);

-- Location: LCCOMB_X87_Y11_N24
\bin_to_bcd_tf|bcd_ones[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_ones[2]~1_combout\ = (\bin_to_bcd_tf|bcd~4_combout\ & ((\U2|tf_val\(1)) # ((!\bin_to_bcd_tf|bcd~5_combout\ & !\bin_to_bcd_tf|bcd~3_combout\)))) # (!\bin_to_bcd_tf|bcd~4_combout\ & (((!\U2|tf_val\(1) & \bin_to_bcd_tf|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~4_combout\,
	datab => \bin_to_bcd_tf|bcd~5_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~3_combout\,
	combout => \bin_to_bcd_tf|bcd_ones[2]~1_combout\);

-- Location: LCCOMB_X87_Y11_N30
\bin_to_bcd_tf|bcd_ones[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_ones[1]~2_combout\ = (\bin_to_bcd_tf|bcd~5_combout\ & (!\U2|tf_val\(1) & ((\bin_to_bcd_tf|bcd~4_combout\) # (\bin_to_bcd_tf|bcd~3_combout\)))) # (!\bin_to_bcd_tf|bcd~5_combout\ & ((\U2|tf_val\(1) $ (\bin_to_bcd_tf|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~4_combout\,
	datab => \bin_to_bcd_tf|bcd~5_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~3_combout\,
	combout => \bin_to_bcd_tf|bcd_ones[1]~2_combout\);

-- Location: LCCOMB_X86_Y11_N20
\HEX4_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~23_combout\ = (\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & (\bin_to_bcd_tf|bcd_ones[3]~0_combout\)) # (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & 
-- \U2|tf_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X86_Y11_N14
\HEX4_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~24_combout\ = (\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & (!\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\))) # (!\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & 
-- (\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & \U2|tf_val\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X86_Y11_N28
\HEX4_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~39_combout\ = (\U2|tf_val\(0) & ((\HEX4_inst|decOut_n~24_combout\ $ (\bin_to_bcd_tf|bcd~2_combout\)) # (!\U2|tf_val\(1)))) # (!\U2|tf_val\(0) & (\U2|tf_val\(1) $ (((!\HEX4_inst|decOut_n~24_combout\ & !\bin_to_bcd_tf|bcd~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101011001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(0),
	datab => \HEX4_inst|decOut_n~24_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \HEX4_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X86_Y11_N22
\HEX4_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~40_combout\ = (\bin_to_bcd_tf|bcd~0_combout\ & ((\HEX4_inst|decOut_n~39_combout\) # ((!\HEX4_inst|decOut_n~24_combout\ & !\bin_to_bcd_tf|bcd~2_combout\)))) # (!\bin_to_bcd_tf|bcd~0_combout\ & (\HEX4_inst|decOut_n~39_combout\ & 
-- ((\bin_to_bcd_tf|bcd~2_combout\) # (!\HEX4_inst|decOut_n~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~0_combout\,
	datab => \HEX4_inst|decOut_n~39_combout\,
	datac => \HEX4_inst|decOut_n~24_combout\,
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \HEX4_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X86_Y11_N30
\HEX4_inst|decOut_n~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~28_combout\ = (!\bin_to_bcd_tf|bcd~2_combout\ & (\U2|tf_val\(0) & (\bin_to_bcd_tf|bcd~0_combout\ $ (\U2|tf_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~0_combout\,
	datab => \bin_to_bcd_tf|bcd~2_combout\,
	datac => \U2|tf_val\(1),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~28_combout\);

-- Location: LCCOMB_X87_Y15_N26
\HEX4_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~29_combout\ = (\bin_to_bcd_tf|bcd~12_combout\ & (\U2|tf_val\(3) $ ((\bin_to_bcd_tf|bcd~11_combout\)))) # (!\bin_to_bcd_tf|bcd~12_combout\ & (((!\bin_to_bcd_tf|bcd~11_combout\ & !\bin_to_bcd_tf|bcd~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \bin_to_bcd_tf|bcd~12_combout\,
	datac => \bin_to_bcd_tf|bcd~11_combout\,
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \HEX4_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X86_Y11_N24
\HEX4_inst|decOut_n~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~30_combout\ = (\HEX4_inst|decOut_n~28_combout\) # ((!\HEX4_inst|decOut_n~24_combout\ & (!\U2|tf_val\(1) & !\HEX4_inst|decOut_n~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX4_inst|decOut_n~28_combout\,
	datab => \HEX4_inst|decOut_n~24_combout\,
	datac => \U2|tf_val\(1),
	datad => \HEX4_inst|decOut_n~29_combout\,
	combout => \HEX4_inst|decOut_n~30_combout\);

-- Location: LCCOMB_X86_Y11_N12
\HEX4_inst|decOut_n~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~25_combout\ = (\bin_to_bcd_tf|bcd~0_combout\ & (((\U2|tf_val\(1) & \U2|tf_val\(0))))) # (!\bin_to_bcd_tf|bcd~0_combout\ & (\bin_to_bcd_tf|bcd~2_combout\ & (!\U2|tf_val\(1) & !\U2|tf_val\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~0_combout\,
	datab => \bin_to_bcd_tf|bcd~2_combout\,
	datac => \U2|tf_val\(1),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~25_combout\);

-- Location: LCCOMB_X86_Y11_N10
\HEX4_inst|decOut_n~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~26_combout\ = (\HEX4_inst|decOut_n~25_combout\) # ((\bin_to_bcd_tf|bcd~2_combout\ & (!\HEX4_inst|decOut_n~24_combout\ & !\bin_to_bcd_tf|bcd~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX4_inst|decOut_n~25_combout\,
	datab => \bin_to_bcd_tf|bcd~2_combout\,
	datac => \HEX4_inst|decOut_n~24_combout\,
	datad => \bin_to_bcd_tf|bcd~0_combout\,
	combout => \HEX4_inst|decOut_n~26_combout\);

-- Location: LCCOMB_X86_Y11_N8
\HEX4_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~37_combout\ = (!\bin_to_bcd_tf|bcd~2_combout\ & ((\bin_to_bcd_tf|bcd~0_combout\ & ((!\U2|tf_val\(1)) # (!\HEX4_inst|decOut_n~24_combout\))) # (!\bin_to_bcd_tf|bcd~0_combout\ & ((\U2|tf_val\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~0_combout\,
	datab => \HEX4_inst|decOut_n~24_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \HEX4_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X86_Y11_N26
\HEX4_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~38_combout\ = (!\bin_to_bcd_tf|bcd~2_combout\ & ((\U2|tf_val\(0) & (!\HEX4_inst|decOut_n~37_combout\ & !\U2|tf_val\(1))) # (!\U2|tf_val\(0) & (\HEX4_inst|decOut_n~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(0),
	datab => \HEX4_inst|decOut_n~37_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \HEX4_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X86_Y11_N4
\HEX4_inst|decOut_n~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~27_combout\ = (\U2|tf_val\(2) & (((\HEX4_inst|decOut_n~38_combout\) # (\bin_to_bcd_tf|bcd~1_combout\)))) # (!\U2|tf_val\(2) & (\HEX4_inst|decOut_n~26_combout\ & ((!\bin_to_bcd_tf|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX4_inst|decOut_n~26_combout\,
	datab => \U2|tf_val\(2),
	datac => \HEX4_inst|decOut_n~38_combout\,
	datad => \bin_to_bcd_tf|bcd~1_combout\,
	combout => \HEX4_inst|decOut_n~27_combout\);

-- Location: LCCOMB_X86_Y11_N2
\HEX4_inst|decOut_n~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~31_combout\ = (\HEX4_inst|decOut_n~27_combout\ & (((\HEX4_inst|decOut_n~30_combout\) # (!\bin_to_bcd_tf|bcd~1_combout\)))) # (!\HEX4_inst|decOut_n~27_combout\ & (\HEX4_inst|decOut_n~40_combout\ & ((\bin_to_bcd_tf|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX4_inst|decOut_n~40_combout\,
	datab => \HEX4_inst|decOut_n~30_combout\,
	datac => \HEX4_inst|decOut_n~27_combout\,
	datad => \bin_to_bcd_tf|bcd~1_combout\,
	combout => \HEX4_inst|decOut_n~31_combout\);

-- Location: LCCOMB_X86_Y11_N16
\HEX4_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~32_combout\ = (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_tf|bcd_ones[3]~0_combout\)) # (!\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & (((!\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & \U2|tf_val\(0))) # 
-- (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X86_Y11_N6
\HEX4_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~33_combout\ = (\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_tf|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & \U2|tf_val\(0))))) # (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & 
-- (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & \U2|tf_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X87_Y15_N22
\HEX4_inst|decOut_n~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~9_combout\ = (\U2|tf_val\(5) & (!\U2|tf_val\(7) & (\U2|tf_val\(4) $ (!\U2|tf_val\(6))))) # (!\U2|tf_val\(5) & (!\U2|tf_val\(4) & (\U2|tf_val\(7) & \U2|tf_val\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \HEX4_inst|decOut_n~9_combout\);

-- Location: LCCOMB_X87_Y15_N16
\HEX4_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~21_combout\ = (\U2|tf_val\(3) & ((\bin_to_bcd_tf|bcd~10_combout\) # ((\U2|tf_val\(2))))) # (!\U2|tf_val\(3) & (((\HEX4_inst|decOut_n~9_combout\ & !\U2|tf_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~10_combout\,
	datab => \U2|tf_val\(3),
	datac => \HEX4_inst|decOut_n~9_combout\,
	datad => \U2|tf_val\(2),
	combout => \HEX4_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X87_Y15_N8
\HEX4_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~8_combout\ = (\U2|tf_val\(4) & (\U2|tf_val\(6) & (\U2|tf_val\(5) $ (!\U2|tf_val\(7))))) # (!\U2|tf_val\(4) & (!\U2|tf_val\(6) & (\U2|tf_val\(5) $ (!\U2|tf_val\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \HEX4_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X87_Y15_N28
\HEX4_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~15_combout\ = (\U2|tf_val\(5) & (\U2|tf_val\(4) & (!\U2|tf_val\(7) & !\U2|tf_val\(6)))) # (!\U2|tf_val\(5) & (\U2|tf_val\(7) & (\U2|tf_val\(4) $ (!\U2|tf_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \HEX4_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X87_Y15_N10
\HEX4_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~22_combout\ = (\U2|tf_val\(2) & ((\HEX4_inst|decOut_n~21_combout\ & (\HEX4_inst|decOut_n~8_combout\)) # (!\HEX4_inst|decOut_n~21_combout\ & ((\HEX4_inst|decOut_n~15_combout\))))) # (!\U2|tf_val\(2) & (\HEX4_inst|decOut_n~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \HEX4_inst|decOut_n~21_combout\,
	datac => \HEX4_inst|decOut_n~8_combout\,
	datad => \HEX4_inst|decOut_n~15_combout\,
	combout => \HEX4_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X87_Y15_N14
\HEX4_inst|decOut_n~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~6_combout\ = (\U2|tf_val\(4) & (!\U2|tf_val\(6) & (\U2|tf_val\(5) $ (!\U2|tf_val\(7))))) # (!\U2|tf_val\(4) & (\U2|tf_val\(5) & (!\U2|tf_val\(7) & \U2|tf_val\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(5),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(6),
	combout => \HEX4_inst|decOut_n~6_combout\);

-- Location: LCCOMB_X87_Y15_N0
\HEX4_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~19_combout\ = (\U2|tf_val\(2) & (((\U2|tf_val\(3))))) # (!\U2|tf_val\(2) & ((\U2|tf_val\(3) & (\HEX4_inst|decOut_n~6_combout\)) # (!\U2|tf_val\(3) & ((\bin_to_bcd_tf|bcd~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \HEX4_inst|decOut_n~6_combout\,
	datac => \U2|tf_val\(3),
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \HEX4_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X87_Y15_N2
\HEX4_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~20_combout\ = (\U2|tf_val\(2) & ((\HEX4_inst|decOut_n~19_combout\ & ((\HEX4_inst|decOut_n~9_combout\))) # (!\HEX4_inst|decOut_n~19_combout\ & (\HEX4_inst|decOut_n~8_combout\)))) # (!\U2|tf_val\(2) & 
-- (((\HEX4_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \HEX4_inst|decOut_n~8_combout\,
	datac => \HEX4_inst|decOut_n~9_combout\,
	datad => \HEX4_inst|decOut_n~19_combout\,
	combout => \HEX4_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X87_Y15_N6
\HEX4_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~36_combout\ = (\U2|tf_val\(0)) # ((\U2|tf_val\(1) & (\HEX4_inst|decOut_n~22_combout\)) # (!\U2|tf_val\(1) & ((\HEX4_inst|decOut_n~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX4_inst|decOut_n~22_combout\,
	datab => \HEX4_inst|decOut_n~20_combout\,
	datac => \U2|tf_val\(0),
	datad => \U2|tf_val\(1),
	combout => \HEX4_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X86_Y11_N0
\HEX4_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~34_combout\ = (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_tf|bcd_ones[3]~0_combout\ & ((!\U2|tf_val\(0)) # (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\)))) # (!\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & 
-- (!\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_tf|bcd_ones[3]~0_combout\) # (!\U2|tf_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X86_Y11_N18
\HEX4_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~35_combout\ = (\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & ((\bin_to_bcd_tf|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_tf|bcd_ones[1]~2_combout\ & \U2|tf_val\(0))))) # (!\bin_to_bcd_tf|bcd_ones[2]~1_combout\ & 
-- (\bin_to_bcd_tf|bcd_ones[3]~0_combout\ $ ((!\bin_to_bcd_tf|bcd_ones[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_ones[3]~0_combout\,
	datab => \bin_to_bcd_tf|bcd_ones[2]~1_combout\,
	datac => \bin_to_bcd_tf|bcd_ones[1]~2_combout\,
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X88_Y15_N6
\bin_to_bcd_tf|bcd~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~13_combout\ = (\U2|tf_val\(6) & ((\U2|tf_val\(7) & ((!\U2|tf_val\(5)) # (!\U2|tf_val\(4)))) # (!\U2|tf_val\(7) & (!\U2|tf_val\(4) & !\U2|tf_val\(5))))) # (!\U2|tf_val\(6) & (((\U2|tf_val\(5))) # (!\U2|tf_val\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110110011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \bin_to_bcd_tf|bcd~13_combout\);

-- Location: LCCOMB_X88_Y15_N20
\bin_to_bcd_tf|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|LessThan0~1_combout\ = (\U2|tf_val\(7) & ((\U2|tf_val\(6)) # (\U2|tf_val\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(5),
	combout => \bin_to_bcd_tf|LessThan0~1_combout\);

-- Location: LCCOMB_X87_Y15_N20
\bin_to_bcd_tf|bcd~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~14_combout\ = \bin_to_bcd_tf|bcd~10_combout\ $ ((((!\U2|tf_val\(3) & !\bin_to_bcd_tf|bcd~11_combout\)) # (!\bin_to_bcd_tf|bcd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \bin_to_bcd_tf|bcd~12_combout\,
	datac => \bin_to_bcd_tf|bcd~11_combout\,
	datad => \bin_to_bcd_tf|bcd~10_combout\,
	combout => \bin_to_bcd_tf|bcd~14_combout\);

-- Location: LCCOMB_X88_Y15_N4
\bin_to_bcd_tf|bcd~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~6_combout\ = (\bin_to_bcd_tf|bcd~13_combout\ & (\bin_to_bcd_tf|LessThan0~1_combout\ & \bin_to_bcd_tf|bcd~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~13_combout\,
	datab => \bin_to_bcd_tf|LessThan0~1_combout\,
	datad => \bin_to_bcd_tf|bcd~14_combout\,
	combout => \bin_to_bcd_tf|bcd~6_combout\);

-- Location: LCCOMB_X88_Y15_N30
\bin_to_bcd_tf|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|LessThan0~0_combout\ = (\U2|tf_val\(6)) # (\U2|tf_val\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \bin_to_bcd_tf|LessThan0~0_combout\);

-- Location: LCCOMB_X88_Y15_N28
\bin_to_bcd_tf|bcd~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~7_combout\ = (!\bin_to_bcd_tf|bcd~13_combout\ & (((!\bin_to_bcd_tf|bcd~14_combout\) # (!\bin_to_bcd_tf|LessThan0~0_combout\)) # (!\bin_to_bcd_tf|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~13_combout\,
	datab => \bin_to_bcd_tf|LessThan0~1_combout\,
	datac => \bin_to_bcd_tf|LessThan0~0_combout\,
	datad => \bin_to_bcd_tf|bcd~14_combout\,
	combout => \bin_to_bcd_tf|bcd~7_combout\);

-- Location: LCCOMB_X87_Y11_N8
\bin_to_bcd_tf|bcd~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~15_combout\ = \bin_to_bcd_tf|bcd~0_combout\ $ ((((!\U2|tf_val\(2) & !\bin_to_bcd_tf|bcd~1_combout\)) # (!\bin_to_bcd_tf|bcd~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \bin_to_bcd_tf|bcd~1_combout\,
	datac => \bin_to_bcd_tf|bcd~0_combout\,
	datad => \bin_to_bcd_tf|bcd~2_combout\,
	combout => \bin_to_bcd_tf|bcd~15_combout\);

-- Location: LCCOMB_X88_Y15_N10
\bin_to_bcd_tf|bcd~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~8_combout\ = (\U2|tf_val\(6) & (\U2|tf_val\(7) & (\U2|tf_val\(4) & \U2|tf_val\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \bin_to_bcd_tf|bcd~8_combout\);

-- Location: LCCOMB_X88_Y15_N16
\bin_to_bcd_tf|bcd~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd~9_combout\ = (\bin_to_bcd_tf|bcd~8_combout\) # ((!\bin_to_bcd_tf|bcd~14_combout\ & ((!\bin_to_bcd_tf|LessThan0~0_combout\) # (!\bin_to_bcd_tf|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~8_combout\,
	datab => \bin_to_bcd_tf|LessThan0~1_combout\,
	datac => \bin_to_bcd_tf|LessThan0~0_combout\,
	datad => \bin_to_bcd_tf|bcd~14_combout\,
	combout => \bin_to_bcd_tf|bcd~9_combout\);

-- Location: LCCOMB_X87_Y11_N26
\bin_to_bcd_tf|bcd_tens[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_tens[3]~1_combout\ = (\bin_to_bcd_tf|bcd~15_combout\ & (((\bin_to_bcd_tf|bcd~7_combout\ & !\bin_to_bcd_tf|bcd~9_combout\)))) # (!\bin_to_bcd_tf|bcd~15_combout\ & (\bin_to_bcd_tf|bcd~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~6_combout\,
	datab => \bin_to_bcd_tf|bcd~7_combout\,
	datac => \bin_to_bcd_tf|bcd~15_combout\,
	datad => \bin_to_bcd_tf|bcd~9_combout\,
	combout => \bin_to_bcd_tf|bcd_tens[3]~1_combout\);

-- Location: LCCOMB_X87_Y11_N4
\bin_to_bcd_tf|bcd_tens[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_tens[2]~0_combout\ = (\bin_to_bcd_tf|bcd~6_combout\ & ((\bin_to_bcd_tf|bcd~15_combout\ $ (\bin_to_bcd_tf|bcd~9_combout\)))) # (!\bin_to_bcd_tf|bcd~6_combout\ & (\bin_to_bcd_tf|bcd~9_combout\ & ((!\bin_to_bcd_tf|bcd~15_combout\) # 
-- (!\bin_to_bcd_tf|bcd~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~6_combout\,
	datab => \bin_to_bcd_tf|bcd~7_combout\,
	datac => \bin_to_bcd_tf|bcd~15_combout\,
	datad => \bin_to_bcd_tf|bcd~9_combout\,
	combout => \bin_to_bcd_tf|bcd_tens[2]~0_combout\);

-- Location: LCCOMB_X87_Y11_N22
\bin_to_bcd_tf|bcd_tens[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_tens[0]~3_combout\ = \bin_to_bcd_tf|bcd~3_combout\ $ ((((!\bin_to_bcd_tf|bcd~4_combout\ & !\U2|tf_val\(1))) # (!\bin_to_bcd_tf|bcd~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~4_combout\,
	datab => \bin_to_bcd_tf|bcd~5_combout\,
	datac => \U2|tf_val\(1),
	datad => \bin_to_bcd_tf|bcd~3_combout\,
	combout => \bin_to_bcd_tf|bcd_tens[0]~3_combout\);

-- Location: LCCOMB_X87_Y11_N28
\bin_to_bcd_tf|bcd_tens[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_tf|bcd_tens[1]~2_combout\ = (\bin_to_bcd_tf|bcd~6_combout\ & (((!\bin_to_bcd_tf|bcd~15_combout\)))) # (!\bin_to_bcd_tf|bcd~6_combout\ & ((\bin_to_bcd_tf|bcd~7_combout\ & ((!\bin_to_bcd_tf|bcd~9_combout\) # (!\bin_to_bcd_tf|bcd~15_combout\))) # 
-- (!\bin_to_bcd_tf|bcd~7_combout\ & (\bin_to_bcd_tf|bcd~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd~6_combout\,
	datab => \bin_to_bcd_tf|bcd~7_combout\,
	datac => \bin_to_bcd_tf|bcd~15_combout\,
	datad => \bin_to_bcd_tf|bcd~9_combout\,
	combout => \bin_to_bcd_tf|bcd_tens[1]~2_combout\);

-- Location: LCCOMB_X87_Y11_N18
\HEX5_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~36_combout\ = (\bin_to_bcd_tf|bcd_tens[1]~2_combout\ & (\bin_to_bcd_tf|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_tf|bcd_tens[3]~1_combout\ & !\bin_to_bcd_tf|bcd_tens[0]~3_combout\))))) # (!\bin_to_bcd_tf|bcd_tens[1]~2_combout\ & 
-- (\bin_to_bcd_tf|bcd_tens[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_tens[3]~1_combout\,
	datab => \bin_to_bcd_tf|bcd_tens[2]~0_combout\,
	datac => \bin_to_bcd_tf|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_tf|bcd_tens[1]~2_combout\,
	combout => \HEX5_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X88_Y15_N22
\HEX5_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~23_combout\ = (\U2|tf_val\(6) & (!\U2|tf_val\(7) & (!\U2|tf_val\(4) & !\U2|tf_val\(5)))) # (!\U2|tf_val\(6) & (\U2|tf_val\(5) & (\U2|tf_val\(7) $ (\U2|tf_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X88_Y15_N12
\HEX5_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~24_combout\ = (\U2|tf_val\(4) & ((\U2|tf_val\(6) & (\U2|tf_val\(7) & \U2|tf_val\(5))) # (!\U2|tf_val\(6) & (\U2|tf_val\(7) $ (\U2|tf_val\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X88_Y15_N14
\HEX5_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~22_combout\ = (\U2|tf_val\(3) & ((\HEX5_inst|decOut_n~24_combout\))) # (!\U2|tf_val\(3) & (\HEX5_inst|decOut_n~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datac => \HEX5_inst|decOut_n~23_combout\,
	datad => \HEX5_inst|decOut_n~24_combout\,
	combout => \HEX5_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X88_Y15_N0
\HEX5_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~21_combout\ = (!\U2|tf_val\(6) & ((\U2|tf_val\(7) & (\U2|tf_val\(4) $ (\U2|tf_val\(5)))) # (!\U2|tf_val\(7) & (\U2|tf_val\(4) & \U2|tf_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X88_Y15_N8
\HEX5_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~29_combout\ = (\U2|tf_val\(3) & (\HEX5_inst|decOut_n~24_combout\)) # (!\U2|tf_val\(3) & ((\HEX5_inst|decOut_n~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX5_inst|decOut_n~24_combout\,
	datac => \U2|tf_val\(3),
	datad => \HEX5_inst|decOut_n~21_combout\,
	combout => \HEX5_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X88_Y16_N24
\HEX5_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~20_combout\ = (!\U2|tf_val\(4) & ((\U2|tf_val\(7) & (\U2|tf_val\(5) & !\U2|tf_val\(6))) # (!\U2|tf_val\(7) & (!\U2|tf_val\(5) & \U2|tf_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(7),
	datab => \U2|tf_val\(4),
	datac => \U2|tf_val\(5),
	datad => \U2|tf_val\(6),
	combout => \HEX5_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X88_Y16_N2
\HEX5_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~19_combout\ = (\U2|tf_val\(3) & (\HEX5_inst|decOut_n~21_combout\)) # (!\U2|tf_val\(3) & ((\HEX5_inst|decOut_n~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \HEX5_inst|decOut_n~21_combout\,
	datac => \U2|tf_val\(3),
	datad => \HEX5_inst|decOut_n~20_combout\,
	combout => \HEX5_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X88_Y16_N20
\HEX5_inst|decOut_n~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~42_combout\ = (\U2|tf_val\(1) & (\HEX5_inst|decOut_n~22_combout\ $ (((\U2|tf_val\(2)))))) # (!\U2|tf_val\(1) & ((\U2|tf_val\(2) & (\HEX5_inst|decOut_n~22_combout\)) # (!\U2|tf_val\(2) & ((\HEX5_inst|decOut_n~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX5_inst|decOut_n~22_combout\,
	datab => \HEX5_inst|decOut_n~19_combout\,
	datac => \U2|tf_val\(1),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~42_combout\);

-- Location: LCCOMB_X88_Y16_N14
\HEX5_inst|decOut_n~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~43_combout\ = (\HEX5_inst|decOut_n~22_combout\ & ((\HEX5_inst|decOut_n~42_combout\) # ((\U2|tf_val\(2) & \HEX5_inst|decOut_n~29_combout\)))) # (!\HEX5_inst|decOut_n~22_combout\ & (\HEX5_inst|decOut_n~42_combout\ & 
-- ((\HEX5_inst|decOut_n~29_combout\) # (!\U2|tf_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX5_inst|decOut_n~22_combout\,
	datab => \U2|tf_val\(2),
	datac => \HEX5_inst|decOut_n~29_combout\,
	datad => \HEX5_inst|decOut_n~42_combout\,
	combout => \HEX5_inst|decOut_n~43_combout\);

-- Location: LCCOMB_X87_Y11_N12
\HEX5_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~37_combout\ = (\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & (!\bin_to_bcd_tf|bcd_tens[3]~1_combout\)) # (!\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & ((\bin_to_bcd_tf|bcd_tens[1]~2_combout\) # ((!\bin_to_bcd_tf|bcd_tens[3]~1_combout\ & 
-- !\bin_to_bcd_tf|bcd_tens[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_tens[3]~1_combout\,
	datab => \bin_to_bcd_tf|bcd_tens[2]~0_combout\,
	datac => \bin_to_bcd_tf|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_tf|bcd_tens[1]~2_combout\,
	combout => \HEX5_inst|decOut_n~37_combout\);

-- Location: LCCOMB_X87_Y11_N6
\HEX5_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~38_combout\ = (\bin_to_bcd_tf|bcd_tens[1]~2_combout\ & (\bin_to_bcd_tf|bcd_tens[2]~0_combout\ $ (((!\bin_to_bcd_tf|bcd_tens[3]~1_combout\ & !\bin_to_bcd_tf|bcd_tens[0]~3_combout\))))) # (!\bin_to_bcd_tf|bcd_tens[1]~2_combout\ & 
-- ((\bin_to_bcd_tf|bcd_tens[3]~1_combout\) # ((\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & !\bin_to_bcd_tf|bcd_tens[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_tens[3]~1_combout\,
	datab => \bin_to_bcd_tf|bcd_tens[2]~0_combout\,
	datac => \bin_to_bcd_tf|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_tf|bcd_tens[1]~2_combout\,
	combout => \HEX5_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X88_Y16_N22
\HEX5_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~5_combout\ = ((!\U2|tf_val\(2)) # (!\U2|tf_val\(4))) # (!\U2|tf_val\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X88_Y16_N12
\HEX5_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~4_combout\ = (\U2|tf_val\(3) & ((\U2|tf_val\(1) & ((\U2|tf_val\(2)) # (!\U2|tf_val\(4)))) # (!\U2|tf_val\(1) & (!\U2|tf_val\(4) & \U2|tf_val\(2))))) # (!\U2|tf_val\(3) & (((\U2|tf_val\(4) & !\U2|tf_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X88_Y16_N0
\HEX5_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~32_combout\ = (\U2|tf_val\(6) & (\U2|tf_val\(5))) # (!\U2|tf_val\(6) & ((\U2|tf_val\(5) & (\HEX5_inst|decOut_n~5_combout\)) # (!\U2|tf_val\(5) & ((\HEX5_inst|decOut_n~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \U2|tf_val\(5),
	datac => \HEX5_inst|decOut_n~5_combout\,
	datad => \HEX5_inst|decOut_n~4_combout\,
	combout => \HEX5_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X88_Y16_N26
\HEX5_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~8_combout\ = (\U2|tf_val\(3) & (\U2|tf_val\(1) & (!\U2|tf_val\(4) & \U2|tf_val\(2)))) # (!\U2|tf_val\(3) & (((\U2|tf_val\(4)) # (!\U2|tf_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X88_Y16_N28
\HEX5_inst|decOut_n~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~7_combout\ = (\U2|tf_val\(3) & ((\U2|tf_val\(1)) # ((\U2|tf_val\(2)) # (!\U2|tf_val\(4))))) # (!\U2|tf_val\(3) & (\U2|tf_val\(1) & (!\U2|tf_val\(4) & \U2|tf_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~7_combout\);

-- Location: LCCOMB_X88_Y16_N30
\HEX5_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~33_combout\ = (\U2|tf_val\(6) & ((\HEX5_inst|decOut_n~32_combout\ & (\HEX5_inst|decOut_n~8_combout\)) # (!\HEX5_inst|decOut_n~32_combout\ & ((\HEX5_inst|decOut_n~7_combout\))))) # (!\U2|tf_val\(6) & (\HEX5_inst|decOut_n~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \HEX5_inst|decOut_n~32_combout\,
	datac => \HEX5_inst|decOut_n~8_combout\,
	datad => \HEX5_inst|decOut_n~7_combout\,
	combout => \HEX5_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X88_Y16_N4
\HEX5_inst|decOut_n~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~11_combout\ = (\U2|tf_val\(3)) # ((\U2|tf_val\(1)) # ((\U2|tf_val\(4)) # (\U2|tf_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~11_combout\);

-- Location: LCCOMB_X88_Y16_N16
\HEX5_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~34_combout\ = (\U2|tf_val\(6) & (((\U2|tf_val\(5))))) # (!\U2|tf_val\(6) & ((\U2|tf_val\(5) & ((\HEX5_inst|decOut_n~4_combout\))) # (!\U2|tf_val\(5) & (\HEX5_inst|decOut_n~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \HEX5_inst|decOut_n~11_combout\,
	datac => \U2|tf_val\(5),
	datad => \HEX5_inst|decOut_n~4_combout\,
	combout => \HEX5_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X88_Y16_N8
\HEX5_inst|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~15_combout\ = (\U2|tf_val\(3)) # ((\U2|tf_val\(4)) # ((\U2|tf_val\(1) & \U2|tf_val\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~15_combout\);

-- Location: LCCOMB_X88_Y16_N18
\HEX5_inst|decOut_n~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~14_combout\ = (\U2|tf_val\(3) & (((\U2|tf_val\(4) & !\U2|tf_val\(2))))) # (!\U2|tf_val\(3) & ((\U2|tf_val\(1)) # ((\U2|tf_val\(2)) # (!\U2|tf_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(3),
	datab => \U2|tf_val\(1),
	datac => \U2|tf_val\(4),
	datad => \U2|tf_val\(2),
	combout => \HEX5_inst|decOut_n~14_combout\);

-- Location: LCCOMB_X88_Y16_N6
\HEX5_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~35_combout\ = (\U2|tf_val\(6) & ((\HEX5_inst|decOut_n~34_combout\ & (\HEX5_inst|decOut_n~15_combout\)) # (!\HEX5_inst|decOut_n~34_combout\ & ((\HEX5_inst|decOut_n~14_combout\))))) # (!\U2|tf_val\(6) & (\HEX5_inst|decOut_n~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(6),
	datab => \HEX5_inst|decOut_n~34_combout\,
	datac => \HEX5_inst|decOut_n~15_combout\,
	datad => \HEX5_inst|decOut_n~14_combout\,
	combout => \HEX5_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X88_Y16_N10
\HEX5_inst|decOut_n~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~41_combout\ = (\U2|tf_val\(7) & ((\HEX5_inst|decOut_n~35_combout\))) # (!\U2|tf_val\(7) & (\HEX5_inst|decOut_n~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(7),
	datac => \HEX5_inst|decOut_n~33_combout\,
	datad => \HEX5_inst|decOut_n~35_combout\,
	combout => \HEX5_inst|decOut_n~41_combout\);

-- Location: LCCOMB_X87_Y11_N16
\HEX5_inst|decOut_n~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~39_combout\ = (\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & (!\bin_to_bcd_tf|bcd_tens[3]~1_combout\ & ((\bin_to_bcd_tf|bcd_tens[0]~3_combout\) # (\bin_to_bcd_tf|bcd_tens[1]~2_combout\)))) # (!\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & 
-- (\bin_to_bcd_tf|bcd_tens[1]~2_combout\ & ((\bin_to_bcd_tf|bcd_tens[3]~1_combout\) # (\bin_to_bcd_tf|bcd_tens[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_tens[3]~1_combout\,
	datab => \bin_to_bcd_tf|bcd_tens[2]~0_combout\,
	datac => \bin_to_bcd_tf|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_tf|bcd_tens[1]~2_combout\,
	combout => \HEX5_inst|decOut_n~39_combout\);

-- Location: LCCOMB_X87_Y11_N14
\HEX5_inst|decOut_n~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~40_combout\ = (\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & ((\bin_to_bcd_tf|bcd_tens[3]~1_combout\) # ((!\bin_to_bcd_tf|bcd_tens[0]~3_combout\ & !\bin_to_bcd_tf|bcd_tens[1]~2_combout\)))) # (!\bin_to_bcd_tf|bcd_tens[2]~0_combout\ & 
-- (\bin_to_bcd_tf|bcd_tens[3]~1_combout\ $ (((\bin_to_bcd_tf|bcd_tens[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_tf|bcd_tens[3]~1_combout\,
	datab => \bin_to_bcd_tf|bcd_tens[2]~0_combout\,
	datac => \bin_to_bcd_tf|bcd_tens[0]~3_combout\,
	datad => \bin_to_bcd_tf|bcd_tens[1]~2_combout\,
	combout => \HEX5_inst|decOut_n~40_combout\);

-- Location: LCCOMB_X87_Y22_N0
\U1|current_temp[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[0]~32_combout\ = \U1|current_temp\(0) $ (VCC)
-- \U1|current_temp[0]~33\ = CARRY(\U1|current_temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(0),
	datad => VCC,
	combout => \U1|current_temp[0]~32_combout\,
	cout => \U1|current_temp[0]~33\);

-- Location: FF_X87_Y20_N1
\U1|target_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(7),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(7));

-- Location: FF_X87_Y20_N13
\U1|target_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(6),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(6));

-- Location: FF_X87_Y20_N11
\U1|target_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(5),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(5));

-- Location: FF_X87_Y20_N9
\U1|target_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(4),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(4));

-- Location: FF_X87_Y20_N7
\U1|target_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(3),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(3));

-- Location: FF_X87_Y20_N5
\U1|target_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(2),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(2));

-- Location: FF_X87_Y20_N3
\U1|target_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(1),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(1));

-- Location: LCCOMB_X86_Y22_N16
\U1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~0_combout\ = \U1|target_temp\(1) $ (VCC)
-- \U1|Add0~1\ = CARRY(\U1|target_temp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(1),
	datad => VCC,
	combout => \U1|Add0~0_combout\,
	cout => \U1|Add0~1\);

-- Location: LCCOMB_X86_Y22_N18
\U1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~2_combout\ = (\U1|target_temp\(2) & (!\U1|Add0~1\)) # (!\U1|target_temp\(2) & ((\U1|Add0~1\) # (GND)))
-- \U1|Add0~3\ = CARRY((!\U1|Add0~1\) # (!\U1|target_temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(2),
	datad => VCC,
	cin => \U1|Add0~1\,
	combout => \U1|Add0~2_combout\,
	cout => \U1|Add0~3\);

-- Location: LCCOMB_X86_Y22_N20
\U1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~4_combout\ = (\U1|target_temp\(3) & (\U1|Add0~3\ $ (GND))) # (!\U1|target_temp\(3) & (!\U1|Add0~3\ & VCC))
-- \U1|Add0~5\ = CARRY((\U1|target_temp\(3) & !\U1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(3),
	datad => VCC,
	cin => \U1|Add0~3\,
	combout => \U1|Add0~4_combout\,
	cout => \U1|Add0~5\);

-- Location: LCCOMB_X86_Y22_N22
\U1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~6_combout\ = (\U1|target_temp\(4) & (!\U1|Add0~5\)) # (!\U1|target_temp\(4) & ((\U1|Add0~5\) # (GND)))
-- \U1|Add0~7\ = CARRY((!\U1|Add0~5\) # (!\U1|target_temp\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(4),
	datad => VCC,
	cin => \U1|Add0~5\,
	combout => \U1|Add0~6_combout\,
	cout => \U1|Add0~7\);

-- Location: LCCOMB_X86_Y22_N24
\U1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~8_combout\ = (\U1|target_temp\(5) & (\U1|Add0~7\ $ (GND))) # (!\U1|target_temp\(5) & (!\U1|Add0~7\ & VCC))
-- \U1|Add0~9\ = CARRY((\U1|target_temp\(5) & !\U1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(5),
	datad => VCC,
	cin => \U1|Add0~7\,
	combout => \U1|Add0~8_combout\,
	cout => \U1|Add0~9\);

-- Location: LCCOMB_X86_Y22_N26
\U1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~10_combout\ = (\U1|target_temp\(6) & (!\U1|Add0~9\)) # (!\U1|target_temp\(6) & ((\U1|Add0~9\) # (GND)))
-- \U1|Add0~11\ = CARRY((!\U1|Add0~9\) # (!\U1|target_temp\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(6),
	datad => VCC,
	cin => \U1|Add0~9\,
	combout => \U1|Add0~10_combout\,
	cout => \U1|Add0~11\);

-- Location: LCCOMB_X86_Y22_N28
\U1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~12_combout\ = (\U1|target_temp\(7) & (\U1|Add0~11\ $ (GND))) # (!\U1|target_temp\(7) & (!\U1|Add0~11\ & VCC))
-- \U1|Add0~13\ = CARRY((\U1|target_temp\(7) & !\U1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(7),
	datad => VCC,
	cin => \U1|Add0~11\,
	combout => \U1|Add0~12_combout\,
	cout => \U1|Add0~13\);

-- Location: LCCOMB_X86_Y22_N30
\U1|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~14_combout\ = \U1|Add0~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U1|Add0~13\,
	combout => \U1|Add0~14_combout\);

-- Location: LCCOMB_X87_Y20_N0
\U1|target_temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|target_temp[0]~0_combout\ = !\U2|temp_val\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|temp_val\(0),
	combout => \U1|target_temp[0]~0_combout\);

-- Location: FF_X86_Y20_N29
\U1|target_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|target_temp[0]~0_combout\,
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|target_temp\(0));

-- Location: LCCOMB_X85_Y22_N0
\U1|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~1_cout\ = CARRY((!\U1|target_temp\(0) & !\U1|current_temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(0),
	datab => \U1|current_temp\(0),
	datad => VCC,
	cout => \U1|LessThan0~1_cout\);

-- Location: LCCOMB_X85_Y22_N2
\U1|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~3_cout\ = CARRY((\U1|current_temp\(1) & ((!\U1|LessThan0~1_cout\) # (!\U1|Add0~0_combout\))) # (!\U1|current_temp\(1) & (!\U1|Add0~0_combout\ & !\U1|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \U1|Add0~0_combout\,
	datad => VCC,
	cin => \U1|LessThan0~1_cout\,
	cout => \U1|LessThan0~3_cout\);

-- Location: LCCOMB_X85_Y22_N4
\U1|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~5_cout\ = CARRY((\U1|current_temp\(2) & ((\U1|Add0~2_combout\) # (!\U1|LessThan0~3_cout\))) # (!\U1|current_temp\(2) & (\U1|Add0~2_combout\ & !\U1|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|Add0~2_combout\,
	datad => VCC,
	cin => \U1|LessThan0~3_cout\,
	cout => \U1|LessThan0~5_cout\);

-- Location: LCCOMB_X85_Y22_N6
\U1|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~7_cout\ = CARRY((\U1|Add0~4_combout\ & (\U1|current_temp\(3) & !\U1|LessThan0~5_cout\)) # (!\U1|Add0~4_combout\ & ((\U1|current_temp\(3)) # (!\U1|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~4_combout\,
	datab => \U1|current_temp\(3),
	datad => VCC,
	cin => \U1|LessThan0~5_cout\,
	cout => \U1|LessThan0~7_cout\);

-- Location: LCCOMB_X85_Y22_N8
\U1|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~9_cout\ = CARRY((\U1|current_temp\(4) & ((\U1|Add0~6_combout\) # (!\U1|LessThan0~7_cout\))) # (!\U1|current_temp\(4) & (\U1|Add0~6_combout\ & !\U1|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(4),
	datab => \U1|Add0~6_combout\,
	datad => VCC,
	cin => \U1|LessThan0~7_cout\,
	cout => \U1|LessThan0~9_cout\);

-- Location: LCCOMB_X85_Y22_N10
\U1|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~11_cout\ = CARRY((\U1|Add0~8_combout\ & (\U1|current_temp\(5) & !\U1|LessThan0~9_cout\)) # (!\U1|Add0~8_combout\ & ((\U1|current_temp\(5)) # (!\U1|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~8_combout\,
	datab => \U1|current_temp\(5),
	datad => VCC,
	cin => \U1|LessThan0~9_cout\,
	cout => \U1|LessThan0~11_cout\);

-- Location: LCCOMB_X85_Y22_N12
\U1|LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~13_cout\ = CARRY((\U1|current_temp\(6) & (\U1|Add0~10_combout\ & !\U1|LessThan0~11_cout\)) # (!\U1|current_temp\(6) & ((\U1|Add0~10_combout\) # (!\U1|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|Add0~10_combout\,
	datad => VCC,
	cin => \U1|LessThan0~11_cout\,
	cout => \U1|LessThan0~13_cout\);

-- Location: LCCOMB_X85_Y22_N14
\U1|LessThan0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~15_cout\ = CARRY((\U1|current_temp\(7) & ((!\U1|LessThan0~13_cout\) # (!\U1|Add0~12_combout\))) # (!\U1|current_temp\(7) & (!\U1|Add0~12_combout\ & !\U1|LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(7),
	datab => \U1|Add0~12_combout\,
	datad => VCC,
	cin => \U1|LessThan0~13_cout\,
	cout => \U1|LessThan0~15_cout\);

-- Location: LCCOMB_X85_Y22_N16
\U1|LessThan0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~17_cout\ = CARRY((\U1|Add0~14_combout\ & ((!\U1|LessThan0~15_cout\) # (!\U1|current_temp\(8)))) # (!\U1|Add0~14_combout\ & (!\U1|current_temp\(8) & !\U1|LessThan0~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~14_combout\,
	datab => \U1|current_temp\(8),
	datad => VCC,
	cin => \U1|LessThan0~15_cout\,
	cout => \U1|LessThan0~17_cout\);

-- Location: LCCOMB_X85_Y22_N18
\U1|LessThan0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~19_cout\ = CARRY((\U1|current_temp\(9)) # (!\U1|LessThan0~17_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(9),
	datad => VCC,
	cin => \U1|LessThan0~17_cout\,
	cout => \U1|LessThan0~19_cout\);

-- Location: LCCOMB_X85_Y22_N20
\U1|LessThan0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~21_cout\ = CARRY((!\U1|current_temp\(10) & !\U1|LessThan0~19_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(10),
	datad => VCC,
	cin => \U1|LessThan0~19_cout\,
	cout => \U1|LessThan0~21_cout\);

-- Location: LCCOMB_X85_Y22_N22
\U1|LessThan0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~23_cout\ = CARRY((\U1|current_temp\(11)) # (!\U1|LessThan0~21_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(11),
	datad => VCC,
	cin => \U1|LessThan0~21_cout\,
	cout => \U1|LessThan0~23_cout\);

-- Location: LCCOMB_X85_Y22_N24
\U1|LessThan0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~25_cout\ = CARRY((!\U1|current_temp\(12) & !\U1|LessThan0~23_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(12),
	datad => VCC,
	cin => \U1|LessThan0~23_cout\,
	cout => \U1|LessThan0~25_cout\);

-- Location: LCCOMB_X85_Y22_N26
\U1|LessThan0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~27_cout\ = CARRY((\U1|current_temp\(13)) # (!\U1|LessThan0~25_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(13),
	datad => VCC,
	cin => \U1|LessThan0~25_cout\,
	cout => \U1|LessThan0~27_cout\);

-- Location: LCCOMB_X85_Y22_N28
\U1|LessThan0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~29_cout\ = CARRY((!\U1|current_temp\(14) & !\U1|LessThan0~27_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(14),
	datad => VCC,
	cin => \U1|LessThan0~27_cout\,
	cout => \U1|LessThan0~29_cout\);

-- Location: LCCOMB_X85_Y22_N30
\U1|LessThan0~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~31_cout\ = CARRY((\U1|current_temp\(15)) # (!\U1|LessThan0~29_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(15),
	datad => VCC,
	cin => \U1|LessThan0~29_cout\,
	cout => \U1|LessThan0~31_cout\);

-- Location: LCCOMB_X85_Y21_N0
\U1|LessThan0~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~33_cout\ = CARRY((!\U1|current_temp\(16) & !\U1|LessThan0~31_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(16),
	datad => VCC,
	cin => \U1|LessThan0~31_cout\,
	cout => \U1|LessThan0~33_cout\);

-- Location: LCCOMB_X85_Y21_N2
\U1|LessThan0~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~35_cout\ = CARRY((\U1|current_temp\(17)) # (!\U1|LessThan0~33_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(17),
	datad => VCC,
	cin => \U1|LessThan0~33_cout\,
	cout => \U1|LessThan0~35_cout\);

-- Location: LCCOMB_X85_Y21_N4
\U1|LessThan0~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~37_cout\ = CARRY((!\U1|current_temp\(18) & !\U1|LessThan0~35_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(18),
	datad => VCC,
	cin => \U1|LessThan0~35_cout\,
	cout => \U1|LessThan0~37_cout\);

-- Location: LCCOMB_X85_Y21_N6
\U1|LessThan0~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~39_cout\ = CARRY((\U1|current_temp\(19)) # (!\U1|LessThan0~37_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(19),
	datad => VCC,
	cin => \U1|LessThan0~37_cout\,
	cout => \U1|LessThan0~39_cout\);

-- Location: LCCOMB_X85_Y21_N8
\U1|LessThan0~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~41_cout\ = CARRY((!\U1|current_temp\(20) & !\U1|LessThan0~39_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(20),
	datad => VCC,
	cin => \U1|LessThan0~39_cout\,
	cout => \U1|LessThan0~41_cout\);

-- Location: LCCOMB_X85_Y21_N10
\U1|LessThan0~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~43_cout\ = CARRY((\U1|current_temp\(21)) # (!\U1|LessThan0~41_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(21),
	datad => VCC,
	cin => \U1|LessThan0~41_cout\,
	cout => \U1|LessThan0~43_cout\);

-- Location: LCCOMB_X85_Y21_N12
\U1|LessThan0~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~45_cout\ = CARRY((!\U1|current_temp\(22) & !\U1|LessThan0~43_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(22),
	datad => VCC,
	cin => \U1|LessThan0~43_cout\,
	cout => \U1|LessThan0~45_cout\);

-- Location: LCCOMB_X85_Y21_N14
\U1|LessThan0~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~47_cout\ = CARRY((\U1|current_temp\(23)) # (!\U1|LessThan0~45_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(23),
	datad => VCC,
	cin => \U1|LessThan0~45_cout\,
	cout => \U1|LessThan0~47_cout\);

-- Location: LCCOMB_X85_Y21_N16
\U1|LessThan0~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~49_cout\ = CARRY((!\U1|current_temp\(24) & !\U1|LessThan0~47_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(24),
	datad => VCC,
	cin => \U1|LessThan0~47_cout\,
	cout => \U1|LessThan0~49_cout\);

-- Location: LCCOMB_X85_Y21_N18
\U1|LessThan0~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~51_cout\ = CARRY((\U1|current_temp\(25)) # (!\U1|LessThan0~49_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(25),
	datad => VCC,
	cin => \U1|LessThan0~49_cout\,
	cout => \U1|LessThan0~51_cout\);

-- Location: LCCOMB_X85_Y21_N20
\U1|LessThan0~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~53_cout\ = CARRY((!\U1|current_temp\(26) & !\U1|LessThan0~51_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(26),
	datad => VCC,
	cin => \U1|LessThan0~51_cout\,
	cout => \U1|LessThan0~53_cout\);

-- Location: LCCOMB_X85_Y21_N22
\U1|LessThan0~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~55_cout\ = CARRY((\U1|current_temp\(27)) # (!\U1|LessThan0~53_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(27),
	datad => VCC,
	cin => \U1|LessThan0~53_cout\,
	cout => \U1|LessThan0~55_cout\);

-- Location: LCCOMB_X85_Y21_N24
\U1|LessThan0~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~57_cout\ = CARRY((!\U1|current_temp\(28) & !\U1|LessThan0~55_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(28),
	datad => VCC,
	cin => \U1|LessThan0~55_cout\,
	cout => \U1|LessThan0~57_cout\);

-- Location: LCCOMB_X85_Y21_N26
\U1|LessThan0~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~59_cout\ = CARRY((\U1|current_temp\(29)) # (!\U1|LessThan0~57_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(29),
	datad => VCC,
	cin => \U1|LessThan0~57_cout\,
	cout => \U1|LessThan0~59_cout\);

-- Location: LCCOMB_X85_Y21_N28
\U1|LessThan0~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~61_cout\ = CARRY((!\U1|current_temp\(30) & !\U1|LessThan0~59_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(30),
	datad => VCC,
	cin => \U1|LessThan0~59_cout\,
	cout => \U1|LessThan0~61_cout\);

-- Location: LCCOMB_X85_Y21_N30
\U1|LessThan0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan0~62_combout\ = (\U3|tf\(31) & ((\U1|LessThan0~61_cout\) # (\U1|current_temp\(31)))) # (!\U3|tf\(31) & (\U1|LessThan0~61_cout\ & \U1|current_temp\(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|tf\(31),
	datad => \U1|current_temp\(31),
	cin => \U1|LessThan0~61_cout\,
	combout => \U1|LessThan0~62_combout\);

-- Location: LCCOMB_X86_Y21_N30
\U1|current_temp~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp~48_combout\ = (\U1|heating~q\ & ((\U1|LessThan0~62_combout\))) # (!\U1|heating~q\ & (\U1|LessThan1~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|LessThan1~62_combout\,
	datab => \U1|heating~q\,
	datad => \U1|LessThan0~62_combout\,
	combout => \U1|current_temp~48_combout\);

-- Location: FF_X87_Y22_N1
\U1|current_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[0]~32_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(0));

-- Location: LCCOMB_X87_Y22_N2
\U1|current_temp[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[1]~34_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(1) & (!\U1|current_temp[0]~33\)) # (!\U1|current_temp\(1) & ((\U1|current_temp[0]~33\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(1) & (\U1|current_temp[0]~33\ & VCC)) # 
-- (!\U1|current_temp\(1) & (!\U1|current_temp[0]~33\))))
-- \U1|current_temp[1]~35\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[0]~33\) # (!\U1|current_temp\(1)))) # (!\U1|heating~q\ & (!\U1|current_temp\(1) & !\U1|current_temp[0]~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(1),
	datad => VCC,
	cin => \U1|current_temp[0]~33\,
	combout => \U1|current_temp[1]~34_combout\,
	cout => \U1|current_temp[1]~35\);

-- Location: FF_X87_Y22_N3
\U1|current_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[1]~34_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(1));

-- Location: LCCOMB_X87_Y22_N4
\U1|current_temp[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[2]~36_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(2) & (\U1|current_temp[1]~35\ & VCC)) # (!\U1|current_temp\(2) & (!\U1|current_temp[1]~35\)))) # (!\U1|heating~q\ & ((\U1|current_temp\(2) & (!\U1|current_temp[1]~35\)) # 
-- (!\U1|current_temp\(2) & ((\U1|current_temp[1]~35\) # (GND)))))
-- \U1|current_temp[2]~37\ = CARRY((\U1|heating~q\ & (!\U1|current_temp\(2) & !\U1|current_temp[1]~35\)) # (!\U1|heating~q\ & ((!\U1|current_temp[1]~35\) # (!\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(2),
	datad => VCC,
	cin => \U1|current_temp[1]~35\,
	combout => \U1|current_temp[2]~36_combout\,
	cout => \U1|current_temp[2]~37\);

-- Location: FF_X87_Y22_N5
\U1|current_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[2]~36_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(2));

-- Location: LCCOMB_X87_Y22_N6
\U1|current_temp[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[3]~38_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(3) & (!\U1|current_temp[2]~37\)) # (!\U1|current_temp\(3) & ((\U1|current_temp[2]~37\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(3) & (\U1|current_temp[2]~37\ & VCC)) # 
-- (!\U1|current_temp\(3) & (!\U1|current_temp[2]~37\))))
-- \U1|current_temp[3]~39\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[2]~37\) # (!\U1|current_temp\(3)))) # (!\U1|heating~q\ & (!\U1|current_temp\(3) & !\U1|current_temp[2]~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(3),
	datad => VCC,
	cin => \U1|current_temp[2]~37\,
	combout => \U1|current_temp[3]~38_combout\,
	cout => \U1|current_temp[3]~39\);

-- Location: FF_X87_Y22_N7
\U1|current_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[3]~38_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(3));

-- Location: LCCOMB_X87_Y22_N8
\U1|current_temp[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[4]~40_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(4) & (\U1|current_temp[3]~39\ & VCC)) # (!\U1|current_temp\(4) & (!\U1|current_temp[3]~39\)))) # (!\U1|heating~q\ & ((\U1|current_temp\(4) & (!\U1|current_temp[3]~39\)) # 
-- (!\U1|current_temp\(4) & ((\U1|current_temp[3]~39\) # (GND)))))
-- \U1|current_temp[4]~41\ = CARRY((\U1|heating~q\ & (!\U1|current_temp\(4) & !\U1|current_temp[3]~39\)) # (!\U1|heating~q\ & ((!\U1|current_temp[3]~39\) # (!\U1|current_temp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(4),
	datad => VCC,
	cin => \U1|current_temp[3]~39\,
	combout => \U1|current_temp[4]~40_combout\,
	cout => \U1|current_temp[4]~41\);

-- Location: FF_X87_Y22_N9
\U1|current_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[4]~40_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(4));

-- Location: LCCOMB_X87_Y22_N10
\U1|current_temp[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[5]~42_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(5) & (!\U1|current_temp[4]~41\)) # (!\U1|current_temp\(5) & ((\U1|current_temp[4]~41\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(5) & (\U1|current_temp[4]~41\ & VCC)) # 
-- (!\U1|current_temp\(5) & (!\U1|current_temp[4]~41\))))
-- \U1|current_temp[5]~43\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[4]~41\) # (!\U1|current_temp\(5)))) # (!\U1|heating~q\ & (!\U1|current_temp\(5) & !\U1|current_temp[4]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(5),
	datad => VCC,
	cin => \U1|current_temp[4]~41\,
	combout => \U1|current_temp[5]~42_combout\,
	cout => \U1|current_temp[5]~43\);

-- Location: FF_X87_Y22_N11
\U1|current_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[5]~42_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(5));

-- Location: LCCOMB_X87_Y22_N12
\U1|current_temp[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[6]~44_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(6) $ (\U1|current_temp[5]~43\)))) # (GND)
-- \U1|current_temp[6]~45\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(6) & !\U1|current_temp[5]~43\)) # (!\U1|heating~q\ & ((\U1|current_temp\(6)) # (!\U1|current_temp[5]~43\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(6),
	datad => VCC,
	cin => \U1|current_temp[5]~43\,
	combout => \U1|current_temp[6]~44_combout\,
	cout => \U1|current_temp[6]~45\);

-- Location: LCCOMB_X87_Y22_N14
\U1|current_temp[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[7]~46_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(7) & (!\U1|current_temp[6]~45\)) # (!\U1|current_temp\(7) & ((\U1|current_temp[6]~45\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(7) & (\U1|current_temp[6]~45\ & VCC)) # 
-- (!\U1|current_temp\(7) & (!\U1|current_temp[6]~45\))))
-- \U1|current_temp[7]~47\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[6]~45\) # (!\U1|current_temp\(7)))) # (!\U1|heating~q\ & (!\U1|current_temp\(7) & !\U1|current_temp[6]~45\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(7),
	datad => VCC,
	cin => \U1|current_temp[6]~45\,
	combout => \U1|current_temp[7]~46_combout\,
	cout => \U1|current_temp[7]~47\);

-- Location: FF_X87_Y22_N15
\U1|current_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[7]~46_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(7));

-- Location: LCCOMB_X87_Y22_N16
\U1|current_temp[8]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[8]~49_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(8) $ (\U1|current_temp[7]~47\)))) # (GND)
-- \U1|current_temp[8]~50\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(8) & !\U1|current_temp[7]~47\)) # (!\U1|heating~q\ & ((\U1|current_temp\(8)) # (!\U1|current_temp[7]~47\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(8),
	datad => VCC,
	cin => \U1|current_temp[7]~47\,
	combout => \U1|current_temp[8]~49_combout\,
	cout => \U1|current_temp[8]~50\);

-- Location: FF_X87_Y22_N17
\U1|current_temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[8]~49_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(8));

-- Location: LCCOMB_X87_Y22_N18
\U1|current_temp[9]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[9]~51_combout\ = (\U1|current_temp\(9) & ((\U1|heating~q\ & (!\U1|current_temp[8]~50\)) # (!\U1|heating~q\ & (\U1|current_temp[8]~50\ & VCC)))) # (!\U1|current_temp\(9) & ((\U1|heating~q\ & ((\U1|current_temp[8]~50\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[8]~50\))))
-- \U1|current_temp[9]~52\ = CARRY((\U1|current_temp\(9) & (\U1|heating~q\ & !\U1|current_temp[8]~50\)) # (!\U1|current_temp\(9) & ((\U1|heating~q\) # (!\U1|current_temp[8]~50\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(9),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[8]~50\,
	combout => \U1|current_temp[9]~51_combout\,
	cout => \U1|current_temp[9]~52\);

-- Location: FF_X87_Y22_N19
\U1|current_temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[9]~51_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(9));

-- Location: LCCOMB_X87_Y22_N20
\U1|current_temp[10]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[10]~53_combout\ = ((\U1|current_temp\(10) $ (\U1|heating~q\ $ (\U1|current_temp[9]~52\)))) # (GND)
-- \U1|current_temp[10]~54\ = CARRY((\U1|current_temp\(10) & ((!\U1|current_temp[9]~52\) # (!\U1|heating~q\))) # (!\U1|current_temp\(10) & (!\U1|heating~q\ & !\U1|current_temp[9]~52\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(10),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[9]~52\,
	combout => \U1|current_temp[10]~53_combout\,
	cout => \U1|current_temp[10]~54\);

-- Location: FF_X87_Y22_N21
\U1|current_temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[10]~53_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(10));

-- Location: LCCOMB_X87_Y22_N22
\U1|current_temp[11]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[11]~55_combout\ = (\U1|current_temp\(11) & ((\U1|heating~q\ & (!\U1|current_temp[10]~54\)) # (!\U1|heating~q\ & (\U1|current_temp[10]~54\ & VCC)))) # (!\U1|current_temp\(11) & ((\U1|heating~q\ & ((\U1|current_temp[10]~54\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[10]~54\))))
-- \U1|current_temp[11]~56\ = CARRY((\U1|current_temp\(11) & (\U1|heating~q\ & !\U1|current_temp[10]~54\)) # (!\U1|current_temp\(11) & ((\U1|heating~q\) # (!\U1|current_temp[10]~54\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(11),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[10]~54\,
	combout => \U1|current_temp[11]~55_combout\,
	cout => \U1|current_temp[11]~56\);

-- Location: FF_X87_Y22_N23
\U1|current_temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[11]~55_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(11));

-- Location: LCCOMB_X87_Y22_N24
\U1|current_temp[12]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[12]~57_combout\ = ((\U1|current_temp\(12) $ (\U1|heating~q\ $ (\U1|current_temp[11]~56\)))) # (GND)
-- \U1|current_temp[12]~58\ = CARRY((\U1|current_temp\(12) & ((!\U1|current_temp[11]~56\) # (!\U1|heating~q\))) # (!\U1|current_temp\(12) & (!\U1|heating~q\ & !\U1|current_temp[11]~56\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(12),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[11]~56\,
	combout => \U1|current_temp[12]~57_combout\,
	cout => \U1|current_temp[12]~58\);

-- Location: FF_X87_Y22_N25
\U1|current_temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[12]~57_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(12));

-- Location: LCCOMB_X87_Y22_N26
\U1|current_temp[13]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[13]~59_combout\ = (\U1|current_temp\(13) & ((\U1|heating~q\ & (!\U1|current_temp[12]~58\)) # (!\U1|heating~q\ & (\U1|current_temp[12]~58\ & VCC)))) # (!\U1|current_temp\(13) & ((\U1|heating~q\ & ((\U1|current_temp[12]~58\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[12]~58\))))
-- \U1|current_temp[13]~60\ = CARRY((\U1|current_temp\(13) & (\U1|heating~q\ & !\U1|current_temp[12]~58\)) # (!\U1|current_temp\(13) & ((\U1|heating~q\) # (!\U1|current_temp[12]~58\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(13),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[12]~58\,
	combout => \U1|current_temp[13]~59_combout\,
	cout => \U1|current_temp[13]~60\);

-- Location: FF_X87_Y22_N27
\U1|current_temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[13]~59_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(13));

-- Location: LCCOMB_X87_Y22_N28
\U1|current_temp[14]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[14]~61_combout\ = ((\U1|current_temp\(14) $ (\U1|heating~q\ $ (\U1|current_temp[13]~60\)))) # (GND)
-- \U1|current_temp[14]~62\ = CARRY((\U1|current_temp\(14) & ((!\U1|current_temp[13]~60\) # (!\U1|heating~q\))) # (!\U1|current_temp\(14) & (!\U1|heating~q\ & !\U1|current_temp[13]~60\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(14),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[13]~60\,
	combout => \U1|current_temp[14]~61_combout\,
	cout => \U1|current_temp[14]~62\);

-- Location: FF_X87_Y22_N29
\U1|current_temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[14]~61_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(14));

-- Location: LCCOMB_X87_Y22_N30
\U1|current_temp[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[15]~63_combout\ = (\U1|current_temp\(15) & ((\U1|heating~q\ & (!\U1|current_temp[14]~62\)) # (!\U1|heating~q\ & (\U1|current_temp[14]~62\ & VCC)))) # (!\U1|current_temp\(15) & ((\U1|heating~q\ & ((\U1|current_temp[14]~62\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[14]~62\))))
-- \U1|current_temp[15]~64\ = CARRY((\U1|current_temp\(15) & (\U1|heating~q\ & !\U1|current_temp[14]~62\)) # (!\U1|current_temp\(15) & ((\U1|heating~q\) # (!\U1|current_temp[14]~62\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(15),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[14]~62\,
	combout => \U1|current_temp[15]~63_combout\,
	cout => \U1|current_temp[15]~64\);

-- Location: FF_X87_Y22_N31
\U1|current_temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[15]~63_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(15));

-- Location: LCCOMB_X87_Y21_N0
\U1|current_temp[16]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[16]~65_combout\ = ((\U1|current_temp\(16) $ (\U1|heating~q\ $ (\U1|current_temp[15]~64\)))) # (GND)
-- \U1|current_temp[16]~66\ = CARRY((\U1|current_temp\(16) & ((!\U1|current_temp[15]~64\) # (!\U1|heating~q\))) # (!\U1|current_temp\(16) & (!\U1|heating~q\ & !\U1|current_temp[15]~64\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(16),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[15]~64\,
	combout => \U1|current_temp[16]~65_combout\,
	cout => \U1|current_temp[16]~66\);

-- Location: FF_X87_Y21_N1
\U1|current_temp[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[16]~65_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(16));

-- Location: LCCOMB_X87_Y21_N2
\U1|current_temp[17]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[17]~67_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(17) & (!\U1|current_temp[16]~66\)) # (!\U1|current_temp\(17) & ((\U1|current_temp[16]~66\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(17) & (\U1|current_temp[16]~66\ & 
-- VCC)) # (!\U1|current_temp\(17) & (!\U1|current_temp[16]~66\))))
-- \U1|current_temp[17]~68\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[16]~66\) # (!\U1|current_temp\(17)))) # (!\U1|heating~q\ & (!\U1|current_temp\(17) & !\U1|current_temp[16]~66\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(17),
	datad => VCC,
	cin => \U1|current_temp[16]~66\,
	combout => \U1|current_temp[17]~67_combout\,
	cout => \U1|current_temp[17]~68\);

-- Location: FF_X87_Y21_N3
\U1|current_temp[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[17]~67_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(17));

-- Location: LCCOMB_X87_Y21_N4
\U1|current_temp[18]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[18]~69_combout\ = ((\U1|current_temp\(18) $ (\U1|heating~q\ $ (\U1|current_temp[17]~68\)))) # (GND)
-- \U1|current_temp[18]~70\ = CARRY((\U1|current_temp\(18) & ((!\U1|current_temp[17]~68\) # (!\U1|heating~q\))) # (!\U1|current_temp\(18) & (!\U1|heating~q\ & !\U1|current_temp[17]~68\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(18),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[17]~68\,
	combout => \U1|current_temp[18]~69_combout\,
	cout => \U1|current_temp[18]~70\);

-- Location: FF_X87_Y21_N5
\U1|current_temp[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[18]~69_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(18));

-- Location: LCCOMB_X87_Y21_N6
\U1|current_temp[19]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[19]~71_combout\ = (\U1|current_temp\(19) & ((\U1|heating~q\ & (!\U1|current_temp[18]~70\)) # (!\U1|heating~q\ & (\U1|current_temp[18]~70\ & VCC)))) # (!\U1|current_temp\(19) & ((\U1|heating~q\ & ((\U1|current_temp[18]~70\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[18]~70\))))
-- \U1|current_temp[19]~72\ = CARRY((\U1|current_temp\(19) & (\U1|heating~q\ & !\U1|current_temp[18]~70\)) # (!\U1|current_temp\(19) & ((\U1|heating~q\) # (!\U1|current_temp[18]~70\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(19),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[18]~70\,
	combout => \U1|current_temp[19]~71_combout\,
	cout => \U1|current_temp[19]~72\);

-- Location: FF_X87_Y21_N7
\U1|current_temp[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[19]~71_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(19));

-- Location: LCCOMB_X87_Y21_N8
\U1|current_temp[20]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[20]~73_combout\ = ((\U1|current_temp\(20) $ (\U1|heating~q\ $ (\U1|current_temp[19]~72\)))) # (GND)
-- \U1|current_temp[20]~74\ = CARRY((\U1|current_temp\(20) & ((!\U1|current_temp[19]~72\) # (!\U1|heating~q\))) # (!\U1|current_temp\(20) & (!\U1|heating~q\ & !\U1|current_temp[19]~72\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(20),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[19]~72\,
	combout => \U1|current_temp[20]~73_combout\,
	cout => \U1|current_temp[20]~74\);

-- Location: FF_X87_Y21_N9
\U1|current_temp[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[20]~73_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(20));

-- Location: LCCOMB_X87_Y21_N10
\U1|current_temp[21]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[21]~75_combout\ = (\U1|current_temp\(21) & ((\U1|heating~q\ & (!\U1|current_temp[20]~74\)) # (!\U1|heating~q\ & (\U1|current_temp[20]~74\ & VCC)))) # (!\U1|current_temp\(21) & ((\U1|heating~q\ & ((\U1|current_temp[20]~74\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[20]~74\))))
-- \U1|current_temp[21]~76\ = CARRY((\U1|current_temp\(21) & (\U1|heating~q\ & !\U1|current_temp[20]~74\)) # (!\U1|current_temp\(21) & ((\U1|heating~q\) # (!\U1|current_temp[20]~74\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(21),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[20]~74\,
	combout => \U1|current_temp[21]~75_combout\,
	cout => \U1|current_temp[21]~76\);

-- Location: FF_X87_Y21_N11
\U1|current_temp[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[21]~75_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(21));

-- Location: LCCOMB_X87_Y21_N12
\U1|current_temp[22]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[22]~77_combout\ = ((\U1|current_temp\(22) $ (\U1|heating~q\ $ (\U1|current_temp[21]~76\)))) # (GND)
-- \U1|current_temp[22]~78\ = CARRY((\U1|current_temp\(22) & ((!\U1|current_temp[21]~76\) # (!\U1|heating~q\))) # (!\U1|current_temp\(22) & (!\U1|heating~q\ & !\U1|current_temp[21]~76\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(22),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[21]~76\,
	combout => \U1|current_temp[22]~77_combout\,
	cout => \U1|current_temp[22]~78\);

-- Location: FF_X87_Y21_N13
\U1|current_temp[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[22]~77_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(22));

-- Location: LCCOMB_X87_Y21_N14
\U1|current_temp[23]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[23]~79_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(23) & (!\U1|current_temp[22]~78\)) # (!\U1|current_temp\(23) & ((\U1|current_temp[22]~78\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(23) & (\U1|current_temp[22]~78\ & 
-- VCC)) # (!\U1|current_temp\(23) & (!\U1|current_temp[22]~78\))))
-- \U1|current_temp[23]~80\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[22]~78\) # (!\U1|current_temp\(23)))) # (!\U1|heating~q\ & (!\U1|current_temp\(23) & !\U1|current_temp[22]~78\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(23),
	datad => VCC,
	cin => \U1|current_temp[22]~78\,
	combout => \U1|current_temp[23]~79_combout\,
	cout => \U1|current_temp[23]~80\);

-- Location: FF_X87_Y21_N15
\U1|current_temp[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[23]~79_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(23));

-- Location: LCCOMB_X87_Y21_N16
\U1|current_temp[24]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[24]~81_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(24) $ (\U1|current_temp[23]~80\)))) # (GND)
-- \U1|current_temp[24]~82\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(24) & !\U1|current_temp[23]~80\)) # (!\U1|heating~q\ & ((\U1|current_temp\(24)) # (!\U1|current_temp[23]~80\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(24),
	datad => VCC,
	cin => \U1|current_temp[23]~80\,
	combout => \U1|current_temp[24]~81_combout\,
	cout => \U1|current_temp[24]~82\);

-- Location: FF_X87_Y21_N17
\U1|current_temp[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[24]~81_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(24));

-- Location: LCCOMB_X87_Y21_N18
\U1|current_temp[25]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[25]~83_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(25) & (!\U1|current_temp[24]~82\)) # (!\U1|current_temp\(25) & ((\U1|current_temp[24]~82\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(25) & (\U1|current_temp[24]~82\ & 
-- VCC)) # (!\U1|current_temp\(25) & (!\U1|current_temp[24]~82\))))
-- \U1|current_temp[25]~84\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[24]~82\) # (!\U1|current_temp\(25)))) # (!\U1|heating~q\ & (!\U1|current_temp\(25) & !\U1|current_temp[24]~82\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(25),
	datad => VCC,
	cin => \U1|current_temp[24]~82\,
	combout => \U1|current_temp[25]~83_combout\,
	cout => \U1|current_temp[25]~84\);

-- Location: FF_X87_Y21_N19
\U1|current_temp[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[25]~83_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(25));

-- Location: LCCOMB_X87_Y21_N20
\U1|current_temp[26]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[26]~85_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(26) $ (\U1|current_temp[25]~84\)))) # (GND)
-- \U1|current_temp[26]~86\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(26) & !\U1|current_temp[25]~84\)) # (!\U1|heating~q\ & ((\U1|current_temp\(26)) # (!\U1|current_temp[25]~84\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(26),
	datad => VCC,
	cin => \U1|current_temp[25]~84\,
	combout => \U1|current_temp[26]~85_combout\,
	cout => \U1|current_temp[26]~86\);

-- Location: FF_X87_Y21_N21
\U1|current_temp[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[26]~85_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(26));

-- Location: LCCOMB_X87_Y21_N22
\U1|current_temp[27]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[27]~87_combout\ = (\U1|current_temp\(27) & ((\U1|heating~q\ & (!\U1|current_temp[26]~86\)) # (!\U1|heating~q\ & (\U1|current_temp[26]~86\ & VCC)))) # (!\U1|current_temp\(27) & ((\U1|heating~q\ & ((\U1|current_temp[26]~86\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[26]~86\))))
-- \U1|current_temp[27]~88\ = CARRY((\U1|current_temp\(27) & (\U1|heating~q\ & !\U1|current_temp[26]~86\)) # (!\U1|current_temp\(27) & ((\U1|heating~q\) # (!\U1|current_temp[26]~86\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(27),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[26]~86\,
	combout => \U1|current_temp[27]~87_combout\,
	cout => \U1|current_temp[27]~88\);

-- Location: FF_X87_Y21_N23
\U1|current_temp[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[27]~87_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(27));

-- Location: LCCOMB_X87_Y21_N24
\U1|current_temp[28]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[28]~89_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(28) $ (\U1|current_temp[27]~88\)))) # (GND)
-- \U1|current_temp[28]~90\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(28) & !\U1|current_temp[27]~88\)) # (!\U1|heating~q\ & ((\U1|current_temp\(28)) # (!\U1|current_temp[27]~88\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(28),
	datad => VCC,
	cin => \U1|current_temp[27]~88\,
	combout => \U1|current_temp[28]~89_combout\,
	cout => \U1|current_temp[28]~90\);

-- Location: FF_X87_Y21_N25
\U1|current_temp[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[28]~89_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(28));

-- Location: LCCOMB_X87_Y21_N26
\U1|current_temp[29]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[29]~91_combout\ = (\U1|current_temp\(29) & ((\U1|heating~q\ & (!\U1|current_temp[28]~90\)) # (!\U1|heating~q\ & (\U1|current_temp[28]~90\ & VCC)))) # (!\U1|current_temp\(29) & ((\U1|heating~q\ & ((\U1|current_temp[28]~90\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[28]~90\))))
-- \U1|current_temp[29]~92\ = CARRY((\U1|current_temp\(29) & (\U1|heating~q\ & !\U1|current_temp[28]~90\)) # (!\U1|current_temp\(29) & ((\U1|heating~q\) # (!\U1|current_temp[28]~90\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(29),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[28]~90\,
	combout => \U1|current_temp[29]~91_combout\,
	cout => \U1|current_temp[29]~92\);

-- Location: FF_X87_Y21_N27
\U1|current_temp[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[29]~91_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(29));

-- Location: LCCOMB_X87_Y21_N28
\U1|current_temp[30]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[30]~93_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(30) $ (\U1|current_temp[29]~92\)))) # (GND)
-- \U1|current_temp[30]~94\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(30) & !\U1|current_temp[29]~92\)) # (!\U1|heating~q\ & ((\U1|current_temp\(30)) # (!\U1|current_temp[29]~92\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(30),
	datad => VCC,
	cin => \U1|current_temp[29]~92\,
	combout => \U1|current_temp[30]~93_combout\,
	cout => \U1|current_temp[30]~94\);

-- Location: FF_X87_Y21_N29
\U1|current_temp[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[30]~93_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(30));

-- Location: LCCOMB_X87_Y21_N30
\U1|current_temp[31]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[31]~95_combout\ = \U1|current_temp\(31) $ (\U1|current_temp[30]~94\ $ (!\U1|heating~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(31),
	datad => \U1|heating~q\,
	cin => \U1|current_temp[30]~94\,
	combout => \U1|current_temp[31]~95_combout\);

-- Location: FF_X87_Y21_N31
\U1|current_temp[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[31]~95_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(31));

-- Location: LCCOMB_X87_Y20_N2
\U1|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~0_combout\ = \U1|target_temp\(1) $ (VCC)
-- \U1|Add2~1\ = CARRY(\U1|target_temp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(1),
	datad => VCC,
	combout => \U1|Add2~0_combout\,
	cout => \U1|Add2~1\);

-- Location: LCCOMB_X87_Y20_N4
\U1|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~2_combout\ = (\U1|target_temp\(2) & (\U1|Add2~1\ & VCC)) # (!\U1|target_temp\(2) & (!\U1|Add2~1\))
-- \U1|Add2~3\ = CARRY((!\U1|target_temp\(2) & !\U1|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(2),
	datad => VCC,
	cin => \U1|Add2~1\,
	combout => \U1|Add2~2_combout\,
	cout => \U1|Add2~3\);

-- Location: LCCOMB_X87_Y20_N6
\U1|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~4_combout\ = (\U1|target_temp\(3) & ((GND) # (!\U1|Add2~3\))) # (!\U1|target_temp\(3) & (\U1|Add2~3\ $ (GND)))
-- \U1|Add2~5\ = CARRY((\U1|target_temp\(3)) # (!\U1|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(3),
	datad => VCC,
	cin => \U1|Add2~3\,
	combout => \U1|Add2~4_combout\,
	cout => \U1|Add2~5\);

-- Location: LCCOMB_X87_Y20_N8
\U1|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~6_combout\ = (\U1|target_temp\(4) & (\U1|Add2~5\ & VCC)) # (!\U1|target_temp\(4) & (!\U1|Add2~5\))
-- \U1|Add2~7\ = CARRY((!\U1|target_temp\(4) & !\U1|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(4),
	datad => VCC,
	cin => \U1|Add2~5\,
	combout => \U1|Add2~6_combout\,
	cout => \U1|Add2~7\);

-- Location: LCCOMB_X87_Y20_N10
\U1|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~8_combout\ = (\U1|target_temp\(5) & ((GND) # (!\U1|Add2~7\))) # (!\U1|target_temp\(5) & (\U1|Add2~7\ $ (GND)))
-- \U1|Add2~9\ = CARRY((\U1|target_temp\(5)) # (!\U1|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(5),
	datad => VCC,
	cin => \U1|Add2~7\,
	combout => \U1|Add2~8_combout\,
	cout => \U1|Add2~9\);

-- Location: LCCOMB_X87_Y20_N12
\U1|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~10_combout\ = (\U1|target_temp\(6) & (\U1|Add2~9\ & VCC)) # (!\U1|target_temp\(6) & (!\U1|Add2~9\))
-- \U1|Add2~11\ = CARRY((!\U1|target_temp\(6) & !\U1|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(6),
	datad => VCC,
	cin => \U1|Add2~9\,
	combout => \U1|Add2~10_combout\,
	cout => \U1|Add2~11\);

-- Location: LCCOMB_X87_Y20_N14
\U1|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~12_combout\ = (\U1|target_temp\(7) & ((GND) # (!\U1|Add2~11\))) # (!\U1|target_temp\(7) & (\U1|Add2~11\ $ (GND)))
-- \U1|Add2~13\ = CARRY((\U1|target_temp\(7)) # (!\U1|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(7),
	datad => VCC,
	cin => \U1|Add2~11\,
	combout => \U1|Add2~12_combout\,
	cout => \U1|Add2~13\);

-- Location: LCCOMB_X87_Y20_N16
\U1|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~14_combout\ = !\U1|Add2~13\
-- \U1|Add2~15\ = CARRY(!\U1|Add2~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~13\,
	combout => \U1|Add2~14_combout\,
	cout => \U1|Add2~15\);

-- Location: LCCOMB_X87_Y20_N18
\U1|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~16_combout\ = \U1|Add2~15\ $ (GND)
-- \U1|Add2~17\ = CARRY(!\U1|Add2~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~15\,
	combout => \U1|Add2~16_combout\,
	cout => \U1|Add2~17\);

-- Location: LCCOMB_X87_Y20_N20
\U1|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~18_combout\ = !\U1|Add2~17\
-- \U1|Add2~19\ = CARRY(!\U1|Add2~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~17\,
	combout => \U1|Add2~18_combout\,
	cout => \U1|Add2~19\);

-- Location: LCCOMB_X87_Y20_N22
\U1|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~20_combout\ = \U1|Add2~19\ $ (GND)
-- \U1|Add2~21\ = CARRY(!\U1|Add2~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~19\,
	combout => \U1|Add2~20_combout\,
	cout => \U1|Add2~21\);

-- Location: LCCOMB_X87_Y20_N24
\U1|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~22_combout\ = !\U1|Add2~21\
-- \U1|Add2~23\ = CARRY(!\U1|Add2~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~21\,
	combout => \U1|Add2~22_combout\,
	cout => \U1|Add2~23\);

-- Location: LCCOMB_X87_Y20_N26
\U1|Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~24_combout\ = \U1|Add2~23\ $ (GND)
-- \U1|Add2~25\ = CARRY(!\U1|Add2~23\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~23\,
	combout => \U1|Add2~24_combout\,
	cout => \U1|Add2~25\);

-- Location: LCCOMB_X87_Y20_N28
\U1|Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~26_combout\ = !\U1|Add2~25\
-- \U1|Add2~27\ = CARRY(!\U1|Add2~25\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~25\,
	combout => \U1|Add2~26_combout\,
	cout => \U1|Add2~27\);

-- Location: LCCOMB_X87_Y20_N30
\U1|Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~28_combout\ = \U1|Add2~27\ $ (GND)
-- \U1|Add2~29\ = CARRY(!\U1|Add2~27\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~27\,
	combout => \U1|Add2~28_combout\,
	cout => \U1|Add2~29\);

-- Location: LCCOMB_X87_Y19_N0
\U1|Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~30_combout\ = !\U1|Add2~29\
-- \U1|Add2~31\ = CARRY(!\U1|Add2~29\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~29\,
	combout => \U1|Add2~30_combout\,
	cout => \U1|Add2~31\);

-- Location: LCCOMB_X87_Y19_N2
\U1|Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~32_combout\ = \U1|Add2~31\ $ (GND)
-- \U1|Add2~33\ = CARRY(!\U1|Add2~31\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~31\,
	combout => \U1|Add2~32_combout\,
	cout => \U1|Add2~33\);

-- Location: LCCOMB_X87_Y19_N4
\U1|Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~34_combout\ = !\U1|Add2~33\
-- \U1|Add2~35\ = CARRY(!\U1|Add2~33\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~33\,
	combout => \U1|Add2~34_combout\,
	cout => \U1|Add2~35\);

-- Location: LCCOMB_X87_Y19_N6
\U1|Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~36_combout\ = \U1|Add2~35\ $ (GND)
-- \U1|Add2~37\ = CARRY(!\U1|Add2~35\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~35\,
	combout => \U1|Add2~36_combout\,
	cout => \U1|Add2~37\);

-- Location: LCCOMB_X87_Y19_N8
\U1|Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~38_combout\ = !\U1|Add2~37\
-- \U1|Add2~39\ = CARRY(!\U1|Add2~37\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~37\,
	combout => \U1|Add2~38_combout\,
	cout => \U1|Add2~39\);

-- Location: LCCOMB_X87_Y19_N10
\U1|Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~40_combout\ = \U1|Add2~39\ $ (GND)
-- \U1|Add2~41\ = CARRY(!\U1|Add2~39\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~39\,
	combout => \U1|Add2~40_combout\,
	cout => \U1|Add2~41\);

-- Location: LCCOMB_X87_Y19_N12
\U1|Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~42_combout\ = !\U1|Add2~41\
-- \U1|Add2~43\ = CARRY(!\U1|Add2~41\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~41\,
	combout => \U1|Add2~42_combout\,
	cout => \U1|Add2~43\);

-- Location: LCCOMB_X87_Y19_N14
\U1|Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~44_combout\ = \U1|Add2~43\ $ (GND)
-- \U1|Add2~45\ = CARRY(!\U1|Add2~43\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~43\,
	combout => \U1|Add2~44_combout\,
	cout => \U1|Add2~45\);

-- Location: LCCOMB_X87_Y19_N16
\U1|Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~46_combout\ = !\U1|Add2~45\
-- \U1|Add2~47\ = CARRY(!\U1|Add2~45\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~45\,
	combout => \U1|Add2~46_combout\,
	cout => \U1|Add2~47\);

-- Location: LCCOMB_X87_Y19_N18
\U1|Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~48_combout\ = \U1|Add2~47\ $ (GND)
-- \U1|Add2~49\ = CARRY(!\U1|Add2~47\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~47\,
	combout => \U1|Add2~48_combout\,
	cout => \U1|Add2~49\);

-- Location: LCCOMB_X87_Y19_N20
\U1|Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~50_combout\ = !\U1|Add2~49\
-- \U1|Add2~51\ = CARRY(!\U1|Add2~49\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~49\,
	combout => \U1|Add2~50_combout\,
	cout => \U1|Add2~51\);

-- Location: LCCOMB_X87_Y19_N22
\U1|Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~52_combout\ = \U1|Add2~51\ $ (GND)
-- \U1|Add2~53\ = CARRY(!\U1|Add2~51\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~51\,
	combout => \U1|Add2~52_combout\,
	cout => \U1|Add2~53\);

-- Location: LCCOMB_X87_Y19_N24
\U1|Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~54_combout\ = !\U1|Add2~53\
-- \U1|Add2~55\ = CARRY(!\U1|Add2~53\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~53\,
	combout => \U1|Add2~54_combout\,
	cout => \U1|Add2~55\);

-- Location: LCCOMB_X87_Y19_N26
\U1|Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~56_combout\ = \U1|Add2~55\ $ (GND)
-- \U1|Add2~57\ = CARRY(!\U1|Add2~55\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~55\,
	combout => \U1|Add2~56_combout\,
	cout => \U1|Add2~57\);

-- Location: LCCOMB_X87_Y19_N28
\U1|Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~58_combout\ = !\U1|Add2~57\
-- \U1|Add2~59\ = CARRY(!\U1|Add2~57\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U1|Add2~57\,
	combout => \U1|Add2~58_combout\,
	cout => \U1|Add2~59\);

-- Location: LCCOMB_X87_Y19_N30
\U1|Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add2~60_combout\ = \U1|Add2~59\ $ (!\U3|tf\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U3|tf\(31),
	cin => \U1|Add2~59\,
	combout => \U1|Add2~60_combout\);

-- Location: LCCOMB_X86_Y20_N0
\U1|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~1_cout\ = CARRY((\U1|current_temp\(0) & \U1|target_temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|target_temp\(0),
	datad => VCC,
	cout => \U1|LessThan1~1_cout\);

-- Location: LCCOMB_X86_Y20_N2
\U1|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~3_cout\ = CARRY((\U1|current_temp\(1) & (\U1|Add2~0_combout\ & !\U1|LessThan1~1_cout\)) # (!\U1|current_temp\(1) & ((\U1|Add2~0_combout\) # (!\U1|LessThan1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \U1|Add2~0_combout\,
	datad => VCC,
	cin => \U1|LessThan1~1_cout\,
	cout => \U1|LessThan1~3_cout\);

-- Location: LCCOMB_X86_Y20_N4
\U1|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~5_cout\ = CARRY((\U1|Add2~2_combout\ & (!\U1|current_temp\(2) & !\U1|LessThan1~3_cout\)) # (!\U1|Add2~2_combout\ & ((!\U1|LessThan1~3_cout\) # (!\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~2_combout\,
	datab => \U1|current_temp\(2),
	datad => VCC,
	cin => \U1|LessThan1~3_cout\,
	cout => \U1|LessThan1~5_cout\);

-- Location: LCCOMB_X86_Y20_N6
\U1|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~7_cout\ = CARRY((\U1|Add2~4_combout\ & ((!\U1|LessThan1~5_cout\) # (!\U1|current_temp\(3)))) # (!\U1|Add2~4_combout\ & (!\U1|current_temp\(3) & !\U1|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~4_combout\,
	datab => \U1|current_temp\(3),
	datad => VCC,
	cin => \U1|LessThan1~5_cout\,
	cout => \U1|LessThan1~7_cout\);

-- Location: LCCOMB_X86_Y20_N8
\U1|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~9_cout\ = CARRY((\U1|current_temp\(4) & (!\U1|Add2~6_combout\ & !\U1|LessThan1~7_cout\)) # (!\U1|current_temp\(4) & ((!\U1|LessThan1~7_cout\) # (!\U1|Add2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(4),
	datab => \U1|Add2~6_combout\,
	datad => VCC,
	cin => \U1|LessThan1~7_cout\,
	cout => \U1|LessThan1~9_cout\);

-- Location: LCCOMB_X86_Y20_N10
\U1|LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~11_cout\ = CARRY((\U1|current_temp\(5) & (\U1|Add2~8_combout\ & !\U1|LessThan1~9_cout\)) # (!\U1|current_temp\(5) & ((\U1|Add2~8_combout\) # (!\U1|LessThan1~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(5),
	datab => \U1|Add2~8_combout\,
	datad => VCC,
	cin => \U1|LessThan1~9_cout\,
	cout => \U1|LessThan1~11_cout\);

-- Location: LCCOMB_X86_Y20_N12
\U1|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~13_cout\ = CARRY((\U1|current_temp\(6) & ((!\U1|LessThan1~11_cout\) # (!\U1|Add2~10_combout\))) # (!\U1|current_temp\(6) & (!\U1|Add2~10_combout\ & !\U1|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|Add2~10_combout\,
	datad => VCC,
	cin => \U1|LessThan1~11_cout\,
	cout => \U1|LessThan1~13_cout\);

-- Location: LCCOMB_X86_Y20_N14
\U1|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~15_cout\ = CARRY((\U1|current_temp\(7) & (\U1|Add2~12_combout\ & !\U1|LessThan1~13_cout\)) # (!\U1|current_temp\(7) & ((\U1|Add2~12_combout\) # (!\U1|LessThan1~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(7),
	datab => \U1|Add2~12_combout\,
	datad => VCC,
	cin => \U1|LessThan1~13_cout\,
	cout => \U1|LessThan1~15_cout\);

-- Location: LCCOMB_X86_Y20_N16
\U1|LessThan1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~17_cout\ = CARRY((\U1|current_temp\(8) & ((!\U1|LessThan1~15_cout\) # (!\U1|Add2~14_combout\))) # (!\U1|current_temp\(8) & (!\U1|Add2~14_combout\ & !\U1|LessThan1~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(8),
	datab => \U1|Add2~14_combout\,
	datad => VCC,
	cin => \U1|LessThan1~15_cout\,
	cout => \U1|LessThan1~17_cout\);

-- Location: LCCOMB_X86_Y20_N18
\U1|LessThan1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~19_cout\ = CARRY((\U1|current_temp\(9) & (\U1|Add2~16_combout\ & !\U1|LessThan1~17_cout\)) # (!\U1|current_temp\(9) & ((\U1|Add2~16_combout\) # (!\U1|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(9),
	datab => \U1|Add2~16_combout\,
	datad => VCC,
	cin => \U1|LessThan1~17_cout\,
	cout => \U1|LessThan1~19_cout\);

-- Location: LCCOMB_X86_Y20_N20
\U1|LessThan1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~21_cout\ = CARRY((\U1|Add2~18_combout\ & (\U1|current_temp\(10) & !\U1|LessThan1~19_cout\)) # (!\U1|Add2~18_combout\ & ((\U1|current_temp\(10)) # (!\U1|LessThan1~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~18_combout\,
	datab => \U1|current_temp\(10),
	datad => VCC,
	cin => \U1|LessThan1~19_cout\,
	cout => \U1|LessThan1~21_cout\);

-- Location: LCCOMB_X86_Y20_N22
\U1|LessThan1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~23_cout\ = CARRY((\U1|current_temp\(11) & (\U1|Add2~20_combout\ & !\U1|LessThan1~21_cout\)) # (!\U1|current_temp\(11) & ((\U1|Add2~20_combout\) # (!\U1|LessThan1~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(11),
	datab => \U1|Add2~20_combout\,
	datad => VCC,
	cin => \U1|LessThan1~21_cout\,
	cout => \U1|LessThan1~23_cout\);

-- Location: LCCOMB_X86_Y20_N24
\U1|LessThan1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~25_cout\ = CARRY((\U1|current_temp\(12) & ((!\U1|LessThan1~23_cout\) # (!\U1|Add2~22_combout\))) # (!\U1|current_temp\(12) & (!\U1|Add2~22_combout\ & !\U1|LessThan1~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(12),
	datab => \U1|Add2~22_combout\,
	datad => VCC,
	cin => \U1|LessThan1~23_cout\,
	cout => \U1|LessThan1~25_cout\);

-- Location: LCCOMB_X86_Y20_N26
\U1|LessThan1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~27_cout\ = CARRY((\U1|Add2~24_combout\ & ((!\U1|LessThan1~25_cout\) # (!\U1|current_temp\(13)))) # (!\U1|Add2~24_combout\ & (!\U1|current_temp\(13) & !\U1|LessThan1~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~24_combout\,
	datab => \U1|current_temp\(13),
	datad => VCC,
	cin => \U1|LessThan1~25_cout\,
	cout => \U1|LessThan1~27_cout\);

-- Location: LCCOMB_X86_Y20_N28
\U1|LessThan1~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~29_cout\ = CARRY((\U1|current_temp\(14) & ((!\U1|LessThan1~27_cout\) # (!\U1|Add2~26_combout\))) # (!\U1|current_temp\(14) & (!\U1|Add2~26_combout\ & !\U1|LessThan1~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(14),
	datab => \U1|Add2~26_combout\,
	datad => VCC,
	cin => \U1|LessThan1~27_cout\,
	cout => \U1|LessThan1~29_cout\);

-- Location: LCCOMB_X86_Y20_N30
\U1|LessThan1~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~31_cout\ = CARRY((\U1|Add2~28_combout\ & ((!\U1|LessThan1~29_cout\) # (!\U1|current_temp\(15)))) # (!\U1|Add2~28_combout\ & (!\U1|current_temp\(15) & !\U1|LessThan1~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~28_combout\,
	datab => \U1|current_temp\(15),
	datad => VCC,
	cin => \U1|LessThan1~29_cout\,
	cout => \U1|LessThan1~31_cout\);

-- Location: LCCOMB_X86_Y19_N0
\U1|LessThan1~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~33_cout\ = CARRY((\U1|current_temp\(16) & ((!\U1|LessThan1~31_cout\) # (!\U1|Add2~30_combout\))) # (!\U1|current_temp\(16) & (!\U1|Add2~30_combout\ & !\U1|LessThan1~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(16),
	datab => \U1|Add2~30_combout\,
	datad => VCC,
	cin => \U1|LessThan1~31_cout\,
	cout => \U1|LessThan1~33_cout\);

-- Location: LCCOMB_X86_Y19_N2
\U1|LessThan1~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~35_cout\ = CARRY((\U1|Add2~32_combout\ & ((!\U1|LessThan1~33_cout\) # (!\U1|current_temp\(17)))) # (!\U1|Add2~32_combout\ & (!\U1|current_temp\(17) & !\U1|LessThan1~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~32_combout\,
	datab => \U1|current_temp\(17),
	datad => VCC,
	cin => \U1|LessThan1~33_cout\,
	cout => \U1|LessThan1~35_cout\);

-- Location: LCCOMB_X86_Y19_N4
\U1|LessThan1~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~37_cout\ = CARRY((\U1|Add2~34_combout\ & (\U1|current_temp\(18) & !\U1|LessThan1~35_cout\)) # (!\U1|Add2~34_combout\ & ((\U1|current_temp\(18)) # (!\U1|LessThan1~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~34_combout\,
	datab => \U1|current_temp\(18),
	datad => VCC,
	cin => \U1|LessThan1~35_cout\,
	cout => \U1|LessThan1~37_cout\);

-- Location: LCCOMB_X86_Y19_N6
\U1|LessThan1~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~39_cout\ = CARRY((\U1|Add2~36_combout\ & ((!\U1|LessThan1~37_cout\) # (!\U1|current_temp\(19)))) # (!\U1|Add2~36_combout\ & (!\U1|current_temp\(19) & !\U1|LessThan1~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~36_combout\,
	datab => \U1|current_temp\(19),
	datad => VCC,
	cin => \U1|LessThan1~37_cout\,
	cout => \U1|LessThan1~39_cout\);

-- Location: LCCOMB_X86_Y19_N8
\U1|LessThan1~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~41_cout\ = CARRY((\U1|current_temp\(20) & ((!\U1|LessThan1~39_cout\) # (!\U1|Add2~38_combout\))) # (!\U1|current_temp\(20) & (!\U1|Add2~38_combout\ & !\U1|LessThan1~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(20),
	datab => \U1|Add2~38_combout\,
	datad => VCC,
	cin => \U1|LessThan1~39_cout\,
	cout => \U1|LessThan1~41_cout\);

-- Location: LCCOMB_X86_Y19_N10
\U1|LessThan1~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~43_cout\ = CARRY((\U1|current_temp\(21) & (\U1|Add2~40_combout\ & !\U1|LessThan1~41_cout\)) # (!\U1|current_temp\(21) & ((\U1|Add2~40_combout\) # (!\U1|LessThan1~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(21),
	datab => \U1|Add2~40_combout\,
	datad => VCC,
	cin => \U1|LessThan1~41_cout\,
	cout => \U1|LessThan1~43_cout\);

-- Location: LCCOMB_X86_Y19_N12
\U1|LessThan1~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~45_cout\ = CARRY((\U1|current_temp\(22) & ((!\U1|LessThan1~43_cout\) # (!\U1|Add2~42_combout\))) # (!\U1|current_temp\(22) & (!\U1|Add2~42_combout\ & !\U1|LessThan1~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(22),
	datab => \U1|Add2~42_combout\,
	datad => VCC,
	cin => \U1|LessThan1~43_cout\,
	cout => \U1|LessThan1~45_cout\);

-- Location: LCCOMB_X86_Y19_N14
\U1|LessThan1~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~47_cout\ = CARRY((\U1|current_temp\(23) & (\U1|Add2~44_combout\ & !\U1|LessThan1~45_cout\)) # (!\U1|current_temp\(23) & ((\U1|Add2~44_combout\) # (!\U1|LessThan1~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(23),
	datab => \U1|Add2~44_combout\,
	datad => VCC,
	cin => \U1|LessThan1~45_cout\,
	cout => \U1|LessThan1~47_cout\);

-- Location: LCCOMB_X86_Y19_N16
\U1|LessThan1~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~49_cout\ = CARRY((\U1|current_temp\(24) & ((!\U1|LessThan1~47_cout\) # (!\U1|Add2~46_combout\))) # (!\U1|current_temp\(24) & (!\U1|Add2~46_combout\ & !\U1|LessThan1~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(24),
	datab => \U1|Add2~46_combout\,
	datad => VCC,
	cin => \U1|LessThan1~47_cout\,
	cout => \U1|LessThan1~49_cout\);

-- Location: LCCOMB_X86_Y19_N18
\U1|LessThan1~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~51_cout\ = CARRY((\U1|current_temp\(25) & (\U1|Add2~48_combout\ & !\U1|LessThan1~49_cout\)) # (!\U1|current_temp\(25) & ((\U1|Add2~48_combout\) # (!\U1|LessThan1~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(25),
	datab => \U1|Add2~48_combout\,
	datad => VCC,
	cin => \U1|LessThan1~49_cout\,
	cout => \U1|LessThan1~51_cout\);

-- Location: LCCOMB_X86_Y19_N20
\U1|LessThan1~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~53_cout\ = CARRY((\U1|Add2~50_combout\ & (\U1|current_temp\(26) & !\U1|LessThan1~51_cout\)) # (!\U1|Add2~50_combout\ & ((\U1|current_temp\(26)) # (!\U1|LessThan1~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~50_combout\,
	datab => \U1|current_temp\(26),
	datad => VCC,
	cin => \U1|LessThan1~51_cout\,
	cout => \U1|LessThan1~53_cout\);

-- Location: LCCOMB_X86_Y19_N22
\U1|LessThan1~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~55_cout\ = CARRY((\U1|current_temp\(27) & (\U1|Add2~52_combout\ & !\U1|LessThan1~53_cout\)) # (!\U1|current_temp\(27) & ((\U1|Add2~52_combout\) # (!\U1|LessThan1~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(27),
	datab => \U1|Add2~52_combout\,
	datad => VCC,
	cin => \U1|LessThan1~53_cout\,
	cout => \U1|LessThan1~55_cout\);

-- Location: LCCOMB_X86_Y19_N24
\U1|LessThan1~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~57_cout\ = CARRY((\U1|current_temp\(28) & ((!\U1|LessThan1~55_cout\) # (!\U1|Add2~54_combout\))) # (!\U1|current_temp\(28) & (!\U1|Add2~54_combout\ & !\U1|LessThan1~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(28),
	datab => \U1|Add2~54_combout\,
	datad => VCC,
	cin => \U1|LessThan1~55_cout\,
	cout => \U1|LessThan1~57_cout\);

-- Location: LCCOMB_X86_Y19_N26
\U1|LessThan1~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~59_cout\ = CARRY((\U1|Add2~56_combout\ & ((!\U1|LessThan1~57_cout\) # (!\U1|current_temp\(29)))) # (!\U1|Add2~56_combout\ & (!\U1|current_temp\(29) & !\U1|LessThan1~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~56_combout\,
	datab => \U1|current_temp\(29),
	datad => VCC,
	cin => \U1|LessThan1~57_cout\,
	cout => \U1|LessThan1~59_cout\);

-- Location: LCCOMB_X86_Y19_N28
\U1|LessThan1~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~61_cout\ = CARRY((\U1|current_temp\(30) & ((!\U1|LessThan1~59_cout\) # (!\U1|Add2~58_combout\))) # (!\U1|current_temp\(30) & (!\U1|Add2~58_combout\ & !\U1|LessThan1~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(30),
	datab => \U1|Add2~58_combout\,
	datad => VCC,
	cin => \U1|LessThan1~59_cout\,
	cout => \U1|LessThan1~61_cout\);

-- Location: LCCOMB_X86_Y19_N30
\U1|LessThan1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan1~62_combout\ = (\U1|current_temp\(31) & (\U1|LessThan1~61_cout\ & \U1|Add2~60_combout\)) # (!\U1|current_temp\(31) & ((\U1|LessThan1~61_cout\) # (\U1|Add2~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(31),
	datad => \U1|Add2~60_combout\,
	cin => \U1|LessThan1~61_cout\,
	combout => \U1|LessThan1~62_combout\);

-- Location: LCCOMB_X86_Y21_N24
\U1|heating~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|heating~0_combout\ = (\U1|LessThan0~62_combout\ & ((\U1|heating~q\) # (!\U1|LessThan1~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|LessThan1~62_combout\,
	datac => \U1|heating~q\,
	datad => \U1|LessThan0~62_combout\,
	combout => \U1|heating~0_combout\);

-- Location: FF_X86_Y21_N25
\U1|heating\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|heating~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|heating~q\);

-- Location: FF_X87_Y22_N13
\U1|current_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[6]~44_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(6));

-- Location: LCCOMB_X81_Y18_N10
\bin_to_bcd_current_temp|bcd~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~8_combout\ = (\U1|current_temp\(6) & ((\U1|current_temp\(5) $ (\U1|current_temp\(7))) # (!\U1|current_temp\(4)))) # (!\U1|current_temp\(6) & ((\U1|current_temp\(5)) # ((\U1|current_temp\(4)) # (!\U1|current_temp\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \bin_to_bcd_current_temp|bcd~8_combout\);

-- Location: LCCOMB_X81_Y18_N20
\bin_to_bcd_current_temp|bcd~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~7_combout\ = (\U1|current_temp\(5) & (!\U1|current_temp\(7) & ((!\U1|current_temp\(4)) # (!\U1|current_temp\(6))))) # (!\U1|current_temp\(5) & (\U1|current_temp\(7) & ((\U1|current_temp\(6)) # (\U1|current_temp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \bin_to_bcd_current_temp|bcd~7_combout\);

-- Location: LCCOMB_X81_Y18_N22
\bin_to_bcd_current_temp|bcd~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~6_combout\ = (\U1|current_temp\(6) & ((\U1|current_temp\(5) & ((\U1|current_temp\(7)) # (!\U1|current_temp\(4)))) # (!\U1|current_temp\(5) & ((\U1|current_temp\(4)) # (!\U1|current_temp\(7)))))) # (!\U1|current_temp\(6) & 
-- (\U1|current_temp\(4) $ (((!\U1|current_temp\(5) & \U1|current_temp\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \bin_to_bcd_current_temp|bcd~6_combout\);

-- Location: LCCOMB_X81_Y18_N4
\bin_to_bcd_current_temp|bcd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~0_combout\ = (\bin_to_bcd_current_temp|bcd~7_combout\ & (((\bin_to_bcd_current_temp|bcd~6_combout\ & !\U1|current_temp\(3))))) # (!\bin_to_bcd_current_temp|bcd~7_combout\ & (!\bin_to_bcd_current_temp|bcd~8_combout\ & 
-- ((\U1|current_temp\(3)) # (!\bin_to_bcd_current_temp|bcd~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~8_combout\,
	datab => \bin_to_bcd_current_temp|bcd~7_combout\,
	datac => \bin_to_bcd_current_temp|bcd~6_combout\,
	datad => \U1|current_temp\(3),
	combout => \bin_to_bcd_current_temp|bcd~0_combout\);

-- Location: LCCOMB_X81_Y18_N2
\bin_to_bcd_current_temp|bcd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~1_combout\ = (\bin_to_bcd_current_temp|bcd~8_combout\ & (!\bin_to_bcd_current_temp|bcd~6_combout\ & ((\U1|current_temp\(3)) # (!\bin_to_bcd_current_temp|bcd~7_combout\)))) # (!\bin_to_bcd_current_temp|bcd~8_combout\ & 
-- ((\bin_to_bcd_current_temp|bcd~6_combout\ $ (\U1|current_temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~8_combout\,
	datab => \bin_to_bcd_current_temp|bcd~7_combout\,
	datac => \bin_to_bcd_current_temp|bcd~6_combout\,
	datad => \U1|current_temp\(3),
	combout => \bin_to_bcd_current_temp|bcd~1_combout\);

-- Location: LCCOMB_X81_Y18_N28
\bin_to_bcd_current_temp|bcd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~2_combout\ = (\bin_to_bcd_current_temp|bcd~8_combout\ & ((\bin_to_bcd_current_temp|bcd~7_combout\ & (!\bin_to_bcd_current_temp|bcd~6_combout\ & !\U1|current_temp\(3))) # (!\bin_to_bcd_current_temp|bcd~7_combout\ & 
-- ((\U1|current_temp\(3)))))) # (!\bin_to_bcd_current_temp|bcd~8_combout\ & (((!\U1|current_temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~8_combout\,
	datab => \bin_to_bcd_current_temp|bcd~7_combout\,
	datac => \bin_to_bcd_current_temp|bcd~6_combout\,
	datad => \U1|current_temp\(3),
	combout => \bin_to_bcd_current_temp|bcd~2_combout\);

-- Location: LCCOMB_X81_Y15_N6
\bin_to_bcd_current_temp|bcd~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~4_combout\ = (\bin_to_bcd_current_temp|bcd~0_combout\ & (((!\U1|current_temp\(2))))) # (!\bin_to_bcd_current_temp|bcd~0_combout\ & ((\bin_to_bcd_current_temp|bcd~1_combout\ & ((!\bin_to_bcd_current_temp|bcd~2_combout\) # 
-- (!\U1|current_temp\(2)))) # (!\bin_to_bcd_current_temp|bcd~1_combout\ & (\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~0_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \bin_to_bcd_current_temp|bcd~4_combout\);

-- Location: LCCOMB_X81_Y15_N28
\bin_to_bcd_current_temp|bcd~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~5_combout\ = (\bin_to_bcd_current_temp|bcd~0_combout\ & ((\U1|current_temp\(2) $ (\bin_to_bcd_current_temp|bcd~2_combout\)))) # (!\bin_to_bcd_current_temp|bcd~0_combout\ & (\bin_to_bcd_current_temp|bcd~2_combout\ & 
-- ((!\U1|current_temp\(2)) # (!\bin_to_bcd_current_temp|bcd~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~0_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \bin_to_bcd_current_temp|bcd~5_combout\);

-- Location: LCCOMB_X81_Y15_N8
\bin_to_bcd_current_temp|bcd~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd~3_combout\ = (\bin_to_bcd_current_temp|bcd~1_combout\ & (((\U1|current_temp\(2) & !\bin_to_bcd_current_temp|bcd~2_combout\)))) # (!\bin_to_bcd_current_temp|bcd~1_combout\ & (\bin_to_bcd_current_temp|bcd~0_combout\ & 
-- ((\bin_to_bcd_current_temp|bcd~2_combout\) # (!\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~0_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \bin_to_bcd_current_temp|bcd~3_combout\);

-- Location: LCCOMB_X81_Y11_N12
\bin_to_bcd_current_temp|bcd_ones[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ = (\bin_to_bcd_current_temp|bcd~5_combout\ & (!\U1|current_temp\(1) & ((\bin_to_bcd_current_temp|bcd~3_combout\) # (!\bin_to_bcd_current_temp|bcd~4_combout\)))) # (!\bin_to_bcd_current_temp|bcd~5_combout\ & 
-- ((\U1|current_temp\(1) $ (\bin_to_bcd_current_temp|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~4_combout\,
	datab => \bin_to_bcd_current_temp|bcd~5_combout\,
	datac => \U1|current_temp\(1),
	datad => \bin_to_bcd_current_temp|bcd~3_combout\,
	combout => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\);

-- Location: LCCOMB_X81_Y11_N18
\bin_to_bcd_current_temp|bcd_ones[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ = (\bin_to_bcd_current_temp|bcd~4_combout\ & (((!\U1|current_temp\(1) & \bin_to_bcd_current_temp|bcd~3_combout\)))) # (!\bin_to_bcd_current_temp|bcd~4_combout\ & ((\U1|current_temp\(1)) # 
-- ((!\bin_to_bcd_current_temp|bcd~5_combout\ & !\bin_to_bcd_current_temp|bcd~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~4_combout\,
	datab => \bin_to_bcd_current_temp|bcd~5_combout\,
	datac => \U1|current_temp\(1),
	datad => \bin_to_bcd_current_temp|bcd~3_combout\,
	combout => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\);

-- Location: LCCOMB_X81_Y11_N28
\bin_to_bcd_current_temp|bcd_ones[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\ = (\bin_to_bcd_current_temp|bcd~5_combout\ & (\bin_to_bcd_current_temp|bcd~4_combout\ & (!\U1|current_temp\(1)))) # (!\bin_to_bcd_current_temp|bcd~5_combout\ & (\bin_to_bcd_current_temp|bcd~3_combout\ & 
-- ((\U1|current_temp\(1)) # (!\bin_to_bcd_current_temp|bcd~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd~4_combout\,
	datab => \bin_to_bcd_current_temp|bcd~5_combout\,
	datac => \U1|current_temp\(1),
	datad => \bin_to_bcd_current_temp|bcd~3_combout\,
	combout => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\);

-- Location: LCCOMB_X81_Y11_N26
\HEX6_inst|decOut_n~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~23_combout\ = (\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (((\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)))) # (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ $ 
-- (((\U1|current_temp\(0) & !\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~23_combout\);

-- Location: LCCOMB_X81_Y11_N4
\HEX6_inst|decOut_n~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~24_combout\ = (\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & (\U1|current_temp\(0) & !\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\))) # 
-- (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (!\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & ((\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~24_combout\);

-- Location: LCCOMB_X81_Y15_N12
\HEX6_inst|decOut_n~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~26_combout\ = (\bin_to_bcd_current_temp|bcd~1_combout\ & (((\HEX6_inst|decOut_n~24_combout\ & !\bin_to_bcd_current_temp|bcd~0_combout\)) # (!\U1|current_temp\(2)))) # (!\bin_to_bcd_current_temp|bcd~1_combout\ & 
-- (((\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110010111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~24_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~0_combout\,
	combout => \HEX6_inst|decOut_n~26_combout\);

-- Location: LCCOMB_X81_Y15_N2
\HEX6_inst|decOut_n~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~27_combout\ = (\HEX6_inst|decOut_n~24_combout\ & ((\bin_to_bcd_current_temp|bcd~1_combout\) # ((\U1|current_temp\(2) & !\bin_to_bcd_current_temp|bcd~0_combout\)))) # (!\HEX6_inst|decOut_n~24_combout\ & 
-- (\bin_to_bcd_current_temp|bcd~1_combout\ & (\U1|current_temp\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~24_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~0_combout\,
	combout => \HEX6_inst|decOut_n~27_combout\);

-- Location: LCCOMB_X81_Y15_N22
\HEX6_inst|decOut_n~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~25_combout\ = (\bin_to_bcd_current_temp|bcd~1_combout\ & (\U1|current_temp\(2) & ((\HEX6_inst|decOut_n~24_combout\) # (\bin_to_bcd_current_temp|bcd~0_combout\)))) # (!\bin_to_bcd_current_temp|bcd~1_combout\ & 
-- (((\bin_to_bcd_current_temp|bcd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~24_combout\,
	datab => \bin_to_bcd_current_temp|bcd~1_combout\,
	datac => \U1|current_temp\(2),
	datad => \bin_to_bcd_current_temp|bcd~0_combout\,
	combout => \HEX6_inst|decOut_n~25_combout\);

-- Location: LCCOMB_X81_Y15_N24
\HEX6_inst|decOut_n~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~28_combout\ = (\HEX6_inst|decOut_n~26_combout\ & (!\HEX6_inst|decOut_n~27_combout\ & ((\HEX6_inst|decOut_n~25_combout\) # (\bin_to_bcd_current_temp|bcd~2_combout\)))) # (!\HEX6_inst|decOut_n~26_combout\ & 
-- (\HEX6_inst|decOut_n~27_combout\ $ (((\bin_to_bcd_current_temp|bcd~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~26_combout\,
	datab => \HEX6_inst|decOut_n~27_combout\,
	datac => \HEX6_inst|decOut_n~25_combout\,
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \HEX6_inst|decOut_n~28_combout\);

-- Location: LCCOMB_X81_Y15_N26
\HEX6_inst|decOut_n~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~29_combout\ = (\HEX6_inst|decOut_n~25_combout\ & ((\HEX6_inst|decOut_n~26_combout\ & (\HEX6_inst|decOut_n~27_combout\ & !\bin_to_bcd_current_temp|bcd~2_combout\)) # (!\HEX6_inst|decOut_n~26_combout\ & 
-- (!\HEX6_inst|decOut_n~27_combout\)))) # (!\HEX6_inst|decOut_n~25_combout\ & (\bin_to_bcd_current_temp|bcd~2_combout\ & (\HEX6_inst|decOut_n~26_combout\ $ (\HEX6_inst|decOut_n~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~26_combout\,
	datab => \HEX6_inst|decOut_n~27_combout\,
	datac => \HEX6_inst|decOut_n~25_combout\,
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \HEX6_inst|decOut_n~29_combout\);

-- Location: LCCOMB_X81_Y15_N20
\HEX6_inst|decOut_n~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~30_combout\ = (\HEX6_inst|decOut_n~27_combout\ & (((!\HEX6_inst|decOut_n~25_combout\)))) # (!\HEX6_inst|decOut_n~27_combout\ & (\HEX6_inst|decOut_n~26_combout\ & (\HEX6_inst|decOut_n~25_combout\ $ 
-- (!\bin_to_bcd_current_temp|bcd~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~26_combout\,
	datab => \HEX6_inst|decOut_n~27_combout\,
	datac => \HEX6_inst|decOut_n~25_combout\,
	datad => \bin_to_bcd_current_temp|bcd~2_combout\,
	combout => \HEX6_inst|decOut_n~30_combout\);

-- Location: LCCOMB_X81_Y15_N16
\HEX6_inst|decOut_n~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~32_combout\ = (\HEX6_inst|decOut_n~29_combout\ & ((\HEX6_inst|decOut_n~28_combout\ & ((!\HEX6_inst|decOut_n~30_combout\))) # (!\HEX6_inst|decOut_n~28_combout\ & (\U1|current_temp\(1))))) # (!\HEX6_inst|decOut_n~29_combout\ & 
-- ((\HEX6_inst|decOut_n~30_combout\) # ((!\U1|current_temp\(1) & \HEX6_inst|decOut_n~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \HEX6_inst|decOut_n~28_combout\,
	datac => \HEX6_inst|decOut_n~29_combout\,
	datad => \HEX6_inst|decOut_n~30_combout\,
	combout => \HEX6_inst|decOut_n~32_combout\);

-- Location: LCCOMB_X81_Y15_N10
\HEX6_inst|decOut_n~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~31_combout\ = (\HEX6_inst|decOut_n~29_combout\ & (\U1|current_temp\(1) $ (((!\HEX6_inst|decOut_n~30_combout\))))) # (!\HEX6_inst|decOut_n~29_combout\ & ((\HEX6_inst|decOut_n~28_combout\ & ((\HEX6_inst|decOut_n~30_combout\))) # 
-- (!\HEX6_inst|decOut_n~28_combout\ & (\U1|current_temp\(1) & !\HEX6_inst|decOut_n~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \HEX6_inst|decOut_n~28_combout\,
	datac => \HEX6_inst|decOut_n~29_combout\,
	datad => \HEX6_inst|decOut_n~30_combout\,
	combout => \HEX6_inst|decOut_n~31_combout\);

-- Location: LCCOMB_X81_Y15_N18
\HEX6_inst|decOut_n~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~33_combout\ = \HEX6_inst|decOut_n~31_combout\ $ (((!\HEX6_inst|decOut_n~32_combout\ & \U1|current_temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \HEX6_inst|decOut_n~32_combout\,
	datac => \U1|current_temp\(0),
	datad => \HEX6_inst|decOut_n~31_combout\,
	combout => \HEX6_inst|decOut_n~33_combout\);

-- Location: LCCOMB_X81_Y11_N14
\HEX6_inst|decOut_n~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~34_combout\ = (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & (((!\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)))) # (!\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & (((\U1|current_temp\(0) & 
-- !\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)) # (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~34_combout\);

-- Location: LCCOMB_X81_Y11_N8
\HEX6_inst|decOut_n~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~35_combout\ = (\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & \U1|current_temp\(0))))) # 
-- (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ $ (((\U1|current_temp\(0) & !\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~35_combout\);

-- Location: LCCOMB_X81_Y18_N0
\HEX6_inst|decOut_n~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~8_combout\ = (\U1|current_temp\(6) & (\U1|current_temp\(4) & (\U1|current_temp\(5) $ (!\U1|current_temp\(7))))) # (!\U1|current_temp\(6) & (!\U1|current_temp\(5) & (!\U1|current_temp\(4) & \U1|current_temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \HEX6_inst|decOut_n~8_combout\);

-- Location: LCCOMB_X81_Y18_N30
\HEX6_inst|decOut_n~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~9_combout\ = (\U1|current_temp\(6) & (\U1|current_temp\(5) & (\U1|current_temp\(4) & !\U1|current_temp\(7)))) # (!\U1|current_temp\(6) & (!\U1|current_temp\(4) & (\U1|current_temp\(5) $ (!\U1|current_temp\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \HEX6_inst|decOut_n~9_combout\);

-- Location: LCCOMB_X81_Y18_N8
\HEX6_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~5_combout\ = (\U1|current_temp\(6) & (!\U1|current_temp\(4) & (\U1|current_temp\(5) $ (!\U1|current_temp\(7))))) # (!\U1|current_temp\(6) & (\U1|current_temp\(4) & (\U1|current_temp\(5) $ (!\U1|current_temp\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \HEX6_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X81_Y18_N6
\HEX6_inst|decOut_n~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~6_combout\ = (\U1|current_temp\(5) & (!\U1|current_temp\(7) & (\U1|current_temp\(6) $ (\U1|current_temp\(4))))) # (!\U1|current_temp\(5) & (\U1|current_temp\(6) & (\U1|current_temp\(4) & \U1|current_temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \HEX6_inst|decOut_n~6_combout\);

-- Location: LCCOMB_X81_Y18_N12
\HEX6_inst|decOut_n~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~19_combout\ = (\U1|current_temp\(2) & (\U1|current_temp\(3))) # (!\U1|current_temp\(2) & ((\U1|current_temp\(3) & ((\HEX6_inst|decOut_n~6_combout\))) # (!\U1|current_temp\(3) & (\HEX6_inst|decOut_n~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|current_temp\(3),
	datac => \HEX6_inst|decOut_n~5_combout\,
	datad => \HEX6_inst|decOut_n~6_combout\,
	combout => \HEX6_inst|decOut_n~19_combout\);

-- Location: LCCOMB_X81_Y18_N14
\HEX6_inst|decOut_n~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~20_combout\ = (\U1|current_temp\(2) & ((\HEX6_inst|decOut_n~19_combout\ & ((\HEX6_inst|decOut_n~9_combout\))) # (!\HEX6_inst|decOut_n~19_combout\ & (\HEX6_inst|decOut_n~8_combout\)))) # (!\U1|current_temp\(2) & 
-- (((\HEX6_inst|decOut_n~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \HEX6_inst|decOut_n~8_combout\,
	datac => \HEX6_inst|decOut_n~9_combout\,
	datad => \HEX6_inst|decOut_n~19_combout\,
	combout => \HEX6_inst|decOut_n~20_combout\);

-- Location: LCCOMB_X81_Y18_N16
\HEX6_inst|decOut_n~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~12_combout\ = (\U1|current_temp\(5) & (!\U1|current_temp\(6) & (!\U1|current_temp\(4) & !\U1|current_temp\(7)))) # (!\U1|current_temp\(5) & (\U1|current_temp\(7) & (\U1|current_temp\(6) $ (\U1|current_temp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|current_temp\(5),
	datac => \U1|current_temp\(4),
	datad => \U1|current_temp\(7),
	combout => \HEX6_inst|decOut_n~12_combout\);

-- Location: LCCOMB_X81_Y18_N24
\HEX6_inst|decOut_n~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~21_combout\ = (\U1|current_temp\(2) & (\U1|current_temp\(3))) # (!\U1|current_temp\(2) & ((\U1|current_temp\(3) & (\HEX6_inst|decOut_n~5_combout\)) # (!\U1|current_temp\(3) & ((\HEX6_inst|decOut_n~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|current_temp\(3),
	datac => \HEX6_inst|decOut_n~5_combout\,
	datad => \HEX6_inst|decOut_n~12_combout\,
	combout => \HEX6_inst|decOut_n~21_combout\);

-- Location: LCCOMB_X81_Y18_N18
\HEX6_inst|decOut_n~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~22_combout\ = (\U1|current_temp\(2) & ((\HEX6_inst|decOut_n~21_combout\ & ((\HEX6_inst|decOut_n~8_combout\))) # (!\HEX6_inst|decOut_n~21_combout\ & (\HEX6_inst|decOut_n~6_combout\)))) # (!\U1|current_temp\(2) & 
-- (((\HEX6_inst|decOut_n~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \HEX6_inst|decOut_n~6_combout\,
	datab => \HEX6_inst|decOut_n~8_combout\,
	datac => \U1|current_temp\(2),
	datad => \HEX6_inst|decOut_n~21_combout\,
	combout => \HEX6_inst|decOut_n~22_combout\);

-- Location: LCCOMB_X81_Y18_N26
\HEX6_inst|decOut_n~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~38_combout\ = (\U1|current_temp\(0)) # ((\U1|current_temp\(1) & ((\HEX6_inst|decOut_n~22_combout\))) # (!\U1|current_temp\(1) & (\HEX6_inst|decOut_n~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \HEX6_inst|decOut_n~20_combout\,
	datac => \U1|current_temp\(0),
	datad => \HEX6_inst|decOut_n~22_combout\,
	combout => \HEX6_inst|decOut_n~38_combout\);

-- Location: LCCOMB_X81_Y11_N6
\HEX6_inst|decOut_n~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~36_combout\ = (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\ & ((!\U1|current_temp\(0)) # (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\)))) # 
-- (!\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\) # (!\U1|current_temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~36_combout\);

-- Location: LCCOMB_X81_Y11_N20
\HEX6_inst|decOut_n~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~37_combout\ = (\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & ((\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\) # ((\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ & \U1|current_temp\(0))))) # 
-- (!\bin_to_bcd_current_temp|bcd_ones[1]~2_combout\ & (\bin_to_bcd_current_temp|bcd_ones[2]~1_combout\ $ (((!\bin_to_bcd_current_temp|bcd_ones[3]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin_to_bcd_current_temp|bcd_ones[1]~2_combout\,
	datab => \bin_to_bcd_current_temp|bcd_ones[2]~1_combout\,
	datac => \U1|current_temp\(0),
	datad => \bin_to_bcd_current_temp|bcd_ones[3]~0_combout\,
	combout => \HEX6_inst|decOut_n~37_combout\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;
END structure;


