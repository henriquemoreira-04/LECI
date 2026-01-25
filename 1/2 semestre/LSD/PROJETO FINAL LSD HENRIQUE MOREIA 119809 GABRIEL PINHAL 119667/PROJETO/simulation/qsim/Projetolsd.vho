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

-- DATE "05/27/2024 22:47:36"

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
	LEDR : OUT std_logic_vector(0 DOWNTO 0);
	LEDG : OUT std_logic_vector(2 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0)
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
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL \keys_debouncer|start_stop_out~combout\ : std_logic;
SIGNAL \U3|led_alert~0_combout\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \keys_debouncer|reset_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|reset_out~combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \keys_debouncer|time_adjust_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|time_adjust_reg[1]~feeder_combout\ : std_logic;
SIGNAL \keys_debouncer|time_adjust_out~combout\ : std_logic;
SIGNAL \U2|tf_val[0]~8_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \U2|temp_val~10_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \U2|process_0~2_combout\ : std_logic;
SIGNAL \U2|tf_val[0]~9\ : std_logic;
SIGNAL \U2|tf_val[1]~10_combout\ : std_logic;
SIGNAL \U2|tf_val[1]~11\ : std_logic;
SIGNAL \U2|tf_val[2]~12_combout\ : std_logic;
SIGNAL \U3|tf[2]~feeder_combout\ : std_logic;
SIGNAL \U3|timer[0]~32_combout\ : std_logic;
SIGNAL \U3|Selector0~2_combout\ : std_logic;
SIGNAL \U3|Selector1~0_combout\ : std_logic;
SIGNAL \U3|state.COOKING~q\ : std_logic;
SIGNAL \U3|timer[3]~41\ : std_logic;
SIGNAL \U3|timer[4]~42_combout\ : std_logic;
SIGNAL \U3|timer[4]~43\ : std_logic;
SIGNAL \U3|timer[5]~44_combout\ : std_logic;
SIGNAL \U3|timer[5]~45\ : std_logic;
SIGNAL \U3|timer[6]~46_combout\ : std_logic;
SIGNAL \U3|timer[6]~47\ : std_logic;
SIGNAL \U3|timer[7]~48_combout\ : std_logic;
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
SIGNAL \U3|tf[31]~feeder_combout\ : std_logic;
SIGNAL \U3|LessThan1~24_combout\ : std_logic;
SIGNAL \U3|LessThan1~5_combout\ : std_logic;
SIGNAL \U3|LessThan1~6_combout\ : std_logic;
SIGNAL \U3|LessThan1~0_combout\ : std_logic;
SIGNAL \U3|LessThan1~3_combout\ : std_logic;
SIGNAL \U3|LessThan1~2_combout\ : std_logic;
SIGNAL \U3|LessThan1~1_combout\ : std_logic;
SIGNAL \U3|LessThan1~4_combout\ : std_logic;
SIGNAL \U3|LessThan1~7_combout\ : std_logic;
SIGNAL \U2|td_val[0]~8_combout\ : std_logic;
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
SIGNAL \U3|td[0]~0_combout\ : std_logic;
SIGNAL \U3|LessThan1~9_cout\ : std_logic;
SIGNAL \U3|LessThan1~11_cout\ : std_logic;
SIGNAL \U3|LessThan1~13_cout\ : std_logic;
SIGNAL \U3|LessThan1~15_cout\ : std_logic;
SIGNAL \U3|LessThan1~17_cout\ : std_logic;
SIGNAL \U3|LessThan1~19_cout\ : std_logic;
SIGNAL \U3|LessThan1~21_cout\ : std_logic;
SIGNAL \U3|LessThan1~22_combout\ : std_logic;
SIGNAL \U3|timer[22]~36_combout\ : std_logic;
SIGNAL \U3|timer[22]~37_combout\ : std_logic;
SIGNAL \U3|timer[0]~33\ : std_logic;
SIGNAL \U3|timer[1]~34_combout\ : std_logic;
SIGNAL \U3|timer[1]~35\ : std_logic;
SIGNAL \U3|timer[2]~38_combout\ : std_logic;
SIGNAL \U3|timer[2]~39\ : std_logic;
SIGNAL \U3|timer[3]~40_combout\ : std_logic;
SIGNAL \U2|tf_val[2]~13\ : std_logic;
SIGNAL \U2|tf_val[3]~14_combout\ : std_logic;
SIGNAL \U3|Equal0~1_combout\ : std_logic;
SIGNAL \U2|tf_val[3]~15\ : std_logic;
SIGNAL \U2|tf_val[4]~16_combout\ : std_logic;
SIGNAL \U2|tf_val[4]~17\ : std_logic;
SIGNAL \U2|tf_val[5]~18_combout\ : std_logic;
SIGNAL \U2|tf_val[5]~19\ : std_logic;
SIGNAL \U2|tf_val[6]~20_combout\ : std_logic;
SIGNAL \U2|tf_val[6]~21\ : std_logic;
SIGNAL \U2|tf_val[7]~22_combout\ : std_logic;
SIGNAL \U3|tf[7]~feeder_combout\ : std_logic;
SIGNAL \U3|Equal0~3_combout\ : std_logic;
SIGNAL \U3|tf[5]~feeder_combout\ : std_logic;
SIGNAL \U3|Equal0~2_combout\ : std_logic;
SIGNAL \U3|tf[0]~0_combout\ : std_logic;
SIGNAL \U3|Equal0~0_combout\ : std_logic;
SIGNAL \U3|Equal0~4_combout\ : std_logic;
SIGNAL \U3|process_0~0_combout\ : std_logic;
SIGNAL \U3|state.IDLE~0_combout\ : std_logic;
SIGNAL \U3|state.IDLE~1_combout\ : std_logic;
SIGNAL \U3|state.IDLE~q\ : std_logic;
SIGNAL \U3|Selector0~0_combout\ : std_logic;
SIGNAL \U3|Selector0~1_combout\ : std_logic;
SIGNAL \U3|Selector2~0_combout\ : std_logic;
SIGNAL \U3|state.DONE~q\ : std_logic;
SIGNAL \U3|led_alert~q\ : std_logic;
SIGNAL \U1|current_temp[0]~32_combout\ : std_logic;
SIGNAL \U2|temp_val[0]~8_combout\ : std_logic;
SIGNAL \U2|process_0~0_combout\ : std_logic;
SIGNAL \U2|temp_val[0]~9\ : std_logic;
SIGNAL \U2|temp_val[1]~11_combout\ : std_logic;
SIGNAL \U2|temp_val[1]~12\ : std_logic;
SIGNAL \U2|temp_val[2]~13_combout\ : std_logic;
SIGNAL \U2|temp_val[2]~14\ : std_logic;
SIGNAL \U2|temp_val[3]~15_combout\ : std_logic;
SIGNAL \U2|temp_val[3]~16\ : std_logic;
SIGNAL \U2|temp_val[4]~17_combout\ : std_logic;
SIGNAL \U2|temp_val[4]~18\ : std_logic;
SIGNAL \U2|temp_val[5]~19_combout\ : std_logic;
SIGNAL \U2|temp_val[5]~20\ : std_logic;
SIGNAL \U2|temp_val[6]~21_combout\ : std_logic;
SIGNAL \U2|temp_val[6]~22\ : std_logic;
SIGNAL \U2|temp_val[7]~23_combout\ : std_logic;
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
SIGNAL \U1|target_temp[0]~0_combout\ : std_logic;
SIGNAL \U1|LessThan3~1_cout\ : std_logic;
SIGNAL \U1|LessThan3~3_cout\ : std_logic;
SIGNAL \U1|LessThan3~5_cout\ : std_logic;
SIGNAL \U1|LessThan3~7_cout\ : std_logic;
SIGNAL \U1|LessThan3~9_cout\ : std_logic;
SIGNAL \U1|LessThan3~11_cout\ : std_logic;
SIGNAL \U1|LessThan3~13_cout\ : std_logic;
SIGNAL \U1|LessThan3~15_cout\ : std_logic;
SIGNAL \U1|LessThan3~17_cout\ : std_logic;
SIGNAL \U1|LessThan3~19_cout\ : std_logic;
SIGNAL \U1|LessThan3~21_cout\ : std_logic;
SIGNAL \U1|LessThan3~23_cout\ : std_logic;
SIGNAL \U1|LessThan3~25_cout\ : std_logic;
SIGNAL \U1|LessThan3~27_cout\ : std_logic;
SIGNAL \U1|LessThan3~29_cout\ : std_logic;
SIGNAL \U1|LessThan3~31_cout\ : std_logic;
SIGNAL \U1|LessThan3~33_cout\ : std_logic;
SIGNAL \U1|LessThan3~35_cout\ : std_logic;
SIGNAL \U1|LessThan3~37_cout\ : std_logic;
SIGNAL \U1|LessThan3~39_cout\ : std_logic;
SIGNAL \U1|LessThan3~41_cout\ : std_logic;
SIGNAL \U1|LessThan3~43_cout\ : std_logic;
SIGNAL \U1|LessThan3~45_cout\ : std_logic;
SIGNAL \U1|LessThan3~47_cout\ : std_logic;
SIGNAL \U1|LessThan3~49_cout\ : std_logic;
SIGNAL \U1|LessThan3~51_cout\ : std_logic;
SIGNAL \U1|LessThan3~53_cout\ : std_logic;
SIGNAL \U1|LessThan3~55_cout\ : std_logic;
SIGNAL \U1|LessThan3~57_cout\ : std_logic;
SIGNAL \U1|LessThan3~59_cout\ : std_logic;
SIGNAL \U1|LessThan3~61_cout\ : std_logic;
SIGNAL \U1|LessThan3~62_combout\ : std_logic;
SIGNAL \U1|current_temp~34_combout\ : std_logic;
SIGNAL \U1|current_temp[0]~33\ : std_logic;
SIGNAL \U1|current_temp[1]~35_combout\ : std_logic;
SIGNAL \U1|current_temp[1]~36\ : std_logic;
SIGNAL \U1|current_temp[2]~37_combout\ : std_logic;
SIGNAL \U1|current_temp[2]~38\ : std_logic;
SIGNAL \U1|current_temp[3]~39_combout\ : std_logic;
SIGNAL \U1|current_temp[3]~40\ : std_logic;
SIGNAL \U1|current_temp[4]~41_combout\ : std_logic;
SIGNAL \U1|current_temp[4]~42\ : std_logic;
SIGNAL \U1|current_temp[5]~43_combout\ : std_logic;
SIGNAL \U1|current_temp[5]~44\ : std_logic;
SIGNAL \U1|current_temp[6]~45_combout\ : std_logic;
SIGNAL \U1|current_temp[6]~46\ : std_logic;
SIGNAL \U1|current_temp[7]~47_combout\ : std_logic;
SIGNAL \U1|current_temp[7]~48\ : std_logic;
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
SIGNAL \U1|LessThan2~1_cout\ : std_logic;
SIGNAL \U1|LessThan2~3_cout\ : std_logic;
SIGNAL \U1|LessThan2~5_cout\ : std_logic;
SIGNAL \U1|LessThan2~7_cout\ : std_logic;
SIGNAL \U1|LessThan2~9_cout\ : std_logic;
SIGNAL \U1|LessThan2~11_cout\ : std_logic;
SIGNAL \U1|LessThan2~13_cout\ : std_logic;
SIGNAL \U1|LessThan2~15_cout\ : std_logic;
SIGNAL \U1|LessThan2~17_cout\ : std_logic;
SIGNAL \U1|LessThan2~19_cout\ : std_logic;
SIGNAL \U1|LessThan2~21_cout\ : std_logic;
SIGNAL \U1|LessThan2~23_cout\ : std_logic;
SIGNAL \U1|LessThan2~25_cout\ : std_logic;
SIGNAL \U1|LessThan2~27_cout\ : std_logic;
SIGNAL \U1|LessThan2~29_cout\ : std_logic;
SIGNAL \U1|LessThan2~31_cout\ : std_logic;
SIGNAL \U1|LessThan2~33_cout\ : std_logic;
SIGNAL \U1|LessThan2~35_cout\ : std_logic;
SIGNAL \U1|LessThan2~37_cout\ : std_logic;
SIGNAL \U1|LessThan2~39_cout\ : std_logic;
SIGNAL \U1|LessThan2~41_cout\ : std_logic;
SIGNAL \U1|LessThan2~43_cout\ : std_logic;
SIGNAL \U1|LessThan2~45_cout\ : std_logic;
SIGNAL \U1|LessThan2~47_cout\ : std_logic;
SIGNAL \U1|LessThan2~49_cout\ : std_logic;
SIGNAL \U1|LessThan2~51_cout\ : std_logic;
SIGNAL \U1|LessThan2~53_cout\ : std_logic;
SIGNAL \U1|LessThan2~55_cout\ : std_logic;
SIGNAL \U1|LessThan2~57_cout\ : std_logic;
SIGNAL \U1|LessThan2~59_cout\ : std_logic;
SIGNAL \U1|LessThan2~61_cout\ : std_logic;
SIGNAL \U1|LessThan2~62_combout\ : std_logic;
SIGNAL \U1|heating~0_combout\ : std_logic;
SIGNAL \U1|heating~q\ : std_logic;
SIGNAL \U3|current_temp[4]~0_combout\ : std_logic;
SIGNAL \U3|current_temp[2]~1_combout\ : std_logic;
SIGNAL \U3|current_temp[1]~feeder_combout\ : std_logic;
SIGNAL \U3|target_temp[1]~feeder_combout\ : std_logic;
SIGNAL \U3|LessThan0~1_cout\ : std_logic;
SIGNAL \U3|LessThan0~3_cout\ : std_logic;
SIGNAL \U3|LessThan0~5_cout\ : std_logic;
SIGNAL \U3|LessThan0~7_cout\ : std_logic;
SIGNAL \U3|LessThan0~9_cout\ : std_logic;
SIGNAL \U3|LessThan0~11_cout\ : std_logic;
SIGNAL \U3|LessThan0~13_cout\ : std_logic;
SIGNAL \U3|LessThan0~14_combout\ : std_logic;
SIGNAL \U3|heater_on~0_combout\ : std_logic;
SIGNAL \U3|heater_on~q\ : std_logic;
SIGNAL \heater_on~0_combout\ : std_logic;
SIGNAL \U3|done_signal~0_combout\ : std_logic;
SIGNAL \U3|done_signal~q\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX0_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX0_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX1_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX1_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX2_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX2_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX3_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX3_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX4_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX4_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX5_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX5_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~0_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~1_combout\ : std_logic;
SIGNAL \HEX6_inst|Equal9~0_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~2_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~3_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~4_combout\ : std_logic;
SIGNAL \HEX6_inst|decOut_n~5_combout\ : std_logic;
SIGNAL \U2|temp_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|timer\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U2|td_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U2|tf_val\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \keys_debouncer|reset_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U1|current_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U1|target_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \keys_debouncer|start_stop_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U3|tf\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|current_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|target_temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U3|td\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \keys_debouncer|time_adjust_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \keys_debouncer|key_dec_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U3|ALT_INV_state.COOKING~q\ : std_logic;
SIGNAL \keys_debouncer|ALT_INV_reset_out~combout\ : std_logic;
SIGNAL \keys_debouncer|ALT_INV_start_stop_out~combout\ : std_logic;

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
\keys_debouncer|ALT_INV_start_stop_out~combout\ <= NOT \keys_debouncer|start_stop_out~combout\;
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
	i => \heater_on~0_combout\,
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
	i => \keys_debouncer|ALT_INV_start_stop_out~combout\,
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
	i => \U3|done_signal~q\,
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
	i => \HEX0_inst|decOut_n~0_combout\,
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
	i => \HEX0_inst|decOut_n~1_combout\,
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
	i => \HEX0_inst|Equal9~0_combout\,
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
	i => \HEX0_inst|decOut_n~2_combout\,
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
	i => \HEX0_inst|decOut_n~3_combout\,
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
	i => \HEX0_inst|decOut_n~4_combout\,
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
	i => \HEX0_inst|decOut_n~5_combout\,
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
	i => \HEX1_inst|decOut_n~0_combout\,
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
	i => \HEX1_inst|decOut_n~1_combout\,
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
	i => \HEX1_inst|Equal9~0_combout\,
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
	i => \HEX1_inst|decOut_n~2_combout\,
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
	i => \HEX1_inst|decOut_n~3_combout\,
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
	i => \HEX1_inst|decOut_n~4_combout\,
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
	i => \HEX1_inst|decOut_n~5_combout\,
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
	i => \HEX2_inst|decOut_n~0_combout\,
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
	i => \HEX2_inst|decOut_n~1_combout\,
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
	i => \HEX2_inst|Equal9~0_combout\,
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
	i => \HEX2_inst|decOut_n~2_combout\,
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
	i => \HEX2_inst|decOut_n~3_combout\,
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
	i => \HEX2_inst|decOut_n~4_combout\,
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
	i => \HEX2_inst|decOut_n~5_combout\,
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
	i => \HEX3_inst|decOut_n~0_combout\,
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
	i => \HEX3_inst|decOut_n~1_combout\,
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
	i => \HEX3_inst|Equal9~0_combout\,
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
	i => \HEX3_inst|decOut_n~2_combout\,
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
	i => \HEX3_inst|decOut_n~3_combout\,
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
	i => \HEX3_inst|decOut_n~4_combout\,
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
	i => \HEX3_inst|decOut_n~5_combout\,
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
	i => \HEX4_inst|decOut_n~0_combout\,
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
	i => \HEX4_inst|decOut_n~1_combout\,
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
	i => \HEX4_inst|Equal9~0_combout\,
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
	i => \HEX4_inst|decOut_n~2_combout\,
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
	i => \HEX4_inst|decOut_n~3_combout\,
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
	i => \HEX4_inst|decOut_n~4_combout\,
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
	i => \HEX4_inst|decOut_n~5_combout\,
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
	i => \HEX5_inst|decOut_n~0_combout\,
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
	i => \HEX5_inst|decOut_n~1_combout\,
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
	i => \HEX5_inst|Equal9~0_combout\,
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
	i => \HEX5_inst|decOut_n~2_combout\,
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
	i => \HEX5_inst|decOut_n~3_combout\,
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
	i => \HEX5_inst|decOut_n~4_combout\,
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
	i => \HEX5_inst|decOut_n~5_combout\,
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
	i => \HEX6_inst|decOut_n~0_combout\,
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
	i => \HEX6_inst|decOut_n~1_combout\,
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
	i => \HEX6_inst|Equal9~0_combout\,
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
	i => \HEX6_inst|decOut_n~2_combout\,
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
	i => \HEX6_inst|decOut_n~3_combout\,
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
	i => \HEX6_inst|decOut_n~4_combout\,
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
	i => \HEX6_inst|decOut_n~5_combout\,
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

-- Location: FF_X86_Y15_N23
\keys_debouncer|start_stop_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|start_stop_reg\(0));

-- Location: FF_X86_Y15_N21
\keys_debouncer|start_stop_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keys_debouncer|start_stop_reg\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|start_stop_reg\(1));

-- Location: LCCOMB_X86_Y15_N26
\keys_debouncer|start_stop_out\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|start_stop_out~combout\ = (\keys_debouncer|start_stop_reg\(1)) # (!\keys_debouncer|start_stop_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|start_stop_reg\(1),
	datac => \keys_debouncer|start_stop_reg\(0),
	combout => \keys_debouncer|start_stop_out~combout\);

-- Location: LCCOMB_X86_Y15_N24
\U3|led_alert~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|led_alert~0_combout\ = !\keys_debouncer|start_stop_out~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keys_debouncer|start_stop_out~combout\,
	combout => \U3|led_alert~0_combout\);

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

-- Location: LCCOMB_X88_Y15_N26
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

-- Location: FF_X88_Y15_N27
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

-- Location: FF_X88_Y15_N21
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

-- Location: LCCOMB_X88_Y15_N20
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

-- Location: LCCOMB_X107_Y15_N24
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

-- Location: FF_X107_Y15_N25
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

-- Location: LCCOMB_X107_Y15_N12
\keys_debouncer|time_adjust_reg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|time_adjust_reg[1]~feeder_combout\ = \keys_debouncer|time_adjust_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keys_debouncer|time_adjust_reg\(0),
	combout => \keys_debouncer|time_adjust_reg[1]~feeder_combout\);

-- Location: FF_X107_Y15_N13
\keys_debouncer|time_adjust_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keys_debouncer|time_adjust_reg[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|time_adjust_reg\(1));

-- Location: LCCOMB_X107_Y15_N10
\keys_debouncer|time_adjust_out\ : cycloneive_lcell_comb
-- Equation(s):
-- \keys_debouncer|time_adjust_out~combout\ = (!\keys_debouncer|time_adjust_reg\(1) & \keys_debouncer|time_adjust_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_reg\(1),
	datad => \keys_debouncer|time_adjust_reg\(0),
	combout => \keys_debouncer|time_adjust_out~combout\);

-- Location: LCCOMB_X89_Y15_N8
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

-- Location: FF_X107_Y15_N11
\keys_debouncer|key_dec_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keys_debouncer|key_dec_reg\(0));

-- Location: FF_X107_Y15_N27
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

-- Location: LCCOMB_X107_Y15_N26
\U2|temp_val~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val~10_combout\ = (\keys_debouncer|key_dec_reg\(0) & (((\keys_debouncer|time_adjust_reg\(0) & !\keys_debouncer|time_adjust_reg\(1))) # (!\keys_debouncer|key_dec_reg\(1)))) # (!\keys_debouncer|key_dec_reg\(0) & (\keys_debouncer|time_adjust_reg\(0) 
-- & ((!\keys_debouncer|time_adjust_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|key_dec_reg\(0),
	datab => \keys_debouncer|time_adjust_reg\(0),
	datac => \keys_debouncer|key_dec_reg\(1),
	datad => \keys_debouncer|time_adjust_reg\(1),
	combout => \U2|temp_val~10_combout\);

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

-- Location: LCCOMB_X107_Y15_N28
\U2|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~2_combout\ = (\U2|temp_val~10_combout\ & (\SW[1]~input_o\ & !\SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val~10_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~2_combout\);

-- Location: FF_X89_Y15_N9
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

-- Location: LCCOMB_X89_Y15_N10
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

-- Location: FF_X89_Y15_N11
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

-- Location: LCCOMB_X89_Y15_N12
\U2|tf_val[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[2]~12_combout\ = ((\U2|tf_val\(2) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|tf_val[1]~11\)))) # (GND)
-- \U2|tf_val[2]~13\ = CARRY((\U2|tf_val\(2) & ((!\U2|tf_val[1]~11\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|tf_val\(2) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|tf_val[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|tf_val[1]~11\,
	combout => \U2|tf_val[2]~12_combout\,
	cout => \U2|tf_val[2]~13\);

-- Location: FF_X89_Y15_N13
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

-- Location: LCCOMB_X86_Y14_N14
\U3|tf[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|tf[2]~feeder_combout\ = \U2|tf_val\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|tf_val\(2),
	combout => \U3|tf[2]~feeder_combout\);

-- Location: FF_X86_Y14_N15
\U3|tf[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|tf[2]~feeder_combout\,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(2));

-- Location: LCCOMB_X87_Y16_N0
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

-- Location: LCCOMB_X86_Y15_N28
\U3|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector0~2_combout\ = (\U3|state.DONE~q\ & ((\keys_debouncer|start_stop_reg\(1)) # (!\keys_debouncer|start_stop_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|start_stop_reg\(1),
	datab => \U3|state.DONE~q\,
	datac => \keys_debouncer|start_stop_reg\(0),
	combout => \U3|Selector0~2_combout\);

-- Location: LCCOMB_X86_Y15_N6
\U3|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector1~0_combout\ = (\U3|Selector0~0_combout\ & (((\U3|state.COOKING~q\ & !\U3|process_0~0_combout\)))) # (!\U3|Selector0~0_combout\ & (!\U3|Selector0~2_combout\ & ((!\U3|process_0~0_combout\) # (!\U3|state.COOKING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Selector0~0_combout\,
	datab => \U3|Selector0~2_combout\,
	datac => \U3|state.COOKING~q\,
	datad => \U3|process_0~0_combout\,
	combout => \U3|Selector1~0_combout\);

-- Location: FF_X86_Y15_N7
\U3|state.COOKING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|Selector1~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|state.COOKING~q\);

-- Location: LCCOMB_X87_Y16_N6
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

-- Location: LCCOMB_X87_Y16_N8
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

-- Location: FF_X87_Y16_N9
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(4));

-- Location: LCCOMB_X87_Y16_N10
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

-- Location: FF_X87_Y16_N11
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(5));

-- Location: LCCOMB_X87_Y16_N12
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

-- Location: FF_X87_Y16_N13
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(6));

-- Location: LCCOMB_X87_Y16_N14
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

-- Location: FF_X87_Y16_N15
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(7));

-- Location: LCCOMB_X87_Y16_N16
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

-- Location: FF_X87_Y16_N17
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(8));

-- Location: LCCOMB_X87_Y16_N18
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

-- Location: FF_X87_Y16_N19
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(9));

-- Location: LCCOMB_X87_Y16_N20
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

-- Location: FF_X87_Y16_N21
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(10));

-- Location: LCCOMB_X87_Y16_N22
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

-- Location: FF_X87_Y16_N23
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(11));

-- Location: LCCOMB_X87_Y16_N24
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

-- Location: FF_X87_Y16_N25
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(12));

-- Location: LCCOMB_X87_Y16_N26
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

-- Location: FF_X87_Y16_N27
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(13));

-- Location: LCCOMB_X87_Y16_N28
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

-- Location: FF_X87_Y16_N29
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(14));

-- Location: LCCOMB_X87_Y16_N30
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

-- Location: FF_X87_Y16_N31
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(15));

-- Location: LCCOMB_X87_Y15_N0
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

-- Location: FF_X87_Y15_N1
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(16));

-- Location: LCCOMB_X87_Y15_N2
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

-- Location: FF_X87_Y15_N3
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(17));

-- Location: LCCOMB_X87_Y15_N4
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

-- Location: FF_X87_Y15_N5
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(18));

-- Location: LCCOMB_X87_Y15_N6
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

-- Location: FF_X87_Y15_N7
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(19));

-- Location: LCCOMB_X87_Y15_N8
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

-- Location: FF_X87_Y15_N9
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(20));

-- Location: LCCOMB_X87_Y15_N10
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

-- Location: FF_X87_Y15_N11
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(21));

-- Location: LCCOMB_X87_Y15_N12
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

-- Location: FF_X87_Y15_N13
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(22));

-- Location: LCCOMB_X87_Y15_N14
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

-- Location: FF_X87_Y15_N15
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(23));

-- Location: LCCOMB_X87_Y15_N16
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

-- Location: FF_X87_Y15_N17
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(24));

-- Location: LCCOMB_X87_Y15_N18
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

-- Location: FF_X87_Y15_N19
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(25));

-- Location: LCCOMB_X87_Y15_N20
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

-- Location: FF_X87_Y15_N21
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(26));

-- Location: LCCOMB_X87_Y15_N22
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

-- Location: FF_X87_Y15_N23
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(27));

-- Location: LCCOMB_X87_Y15_N24
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

-- Location: FF_X87_Y15_N25
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(28));

-- Location: LCCOMB_X87_Y15_N26
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

-- Location: FF_X87_Y15_N27
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(29));

-- Location: LCCOMB_X87_Y15_N28
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

-- Location: FF_X87_Y15_N29
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(30));

-- Location: LCCOMB_X87_Y15_N30
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

-- Location: FF_X87_Y15_N31
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(31));

-- Location: LCCOMB_X91_Y15_N12
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

-- Location: FF_X91_Y15_N13
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

-- Location: LCCOMB_X86_Y15_N20
\U3|LessThan1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~24_combout\ = (\U3|timer\(31) & \U3|tf\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(31),
	datad => \U3|tf\(31),
	combout => \U3|LessThan1~24_combout\);

-- Location: LCCOMB_X89_Y15_N28
\U3|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~5_combout\ = (!\U3|timer\(25) & (!\U3|timer\(23) & (!\U3|timer\(24) & !\U3|timer\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(25),
	datab => \U3|timer\(23),
	datac => \U3|timer\(24),
	datad => \U3|timer\(22),
	combout => \U3|LessThan1~5_combout\);

-- Location: LCCOMB_X88_Y15_N18
\U3|LessThan1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~6_combout\ = (!\U3|timer\(27) & (!\U3|timer\(28) & (!\U3|timer\(29) & !\U3|timer\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(27),
	datab => \U3|timer\(28),
	datac => \U3|timer\(29),
	datad => \U3|timer\(26),
	combout => \U3|LessThan1~6_combout\);

-- Location: LCCOMB_X86_Y15_N8
\U3|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~0_combout\ = (!\U3|timer\(9) & (!\U3|timer\(8) & (\U3|timer\(31) $ (\U3|tf\(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(31),
	datab => \U3|tf\(31),
	datac => \U3|timer\(9),
	datad => \U3|timer\(8),
	combout => \U3|LessThan1~0_combout\);

-- Location: LCCOMB_X88_Y15_N24
\U3|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~3_combout\ = (!\U3|timer\(20) & (!\U3|timer\(19) & (!\U3|timer\(18) & !\U3|timer\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(20),
	datab => \U3|timer\(19),
	datac => \U3|timer\(18),
	datad => \U3|timer\(21),
	combout => \U3|LessThan1~3_combout\);

-- Location: LCCOMB_X88_Y16_N30
\U3|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~2_combout\ = (!\U3|timer\(16) & (!\U3|timer\(15) & (!\U3|timer\(17) & !\U3|timer\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(16),
	datab => \U3|timer\(15),
	datac => \U3|timer\(17),
	datad => \U3|timer\(14),
	combout => \U3|LessThan1~2_combout\);

-- Location: LCCOMB_X88_Y16_N12
\U3|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~1_combout\ = (!\U3|timer\(12) & (!\U3|timer\(11) & (!\U3|timer\(13) & !\U3|timer\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(12),
	datab => \U3|timer\(11),
	datac => \U3|timer\(13),
	datad => \U3|timer\(10),
	combout => \U3|LessThan1~1_combout\);

-- Location: LCCOMB_X89_Y15_N6
\U3|LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~4_combout\ = (\U3|LessThan1~0_combout\ & (\U3|LessThan1~3_combout\ & (\U3|LessThan1~2_combout\ & \U3|LessThan1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|LessThan1~0_combout\,
	datab => \U3|LessThan1~3_combout\,
	datac => \U3|LessThan1~2_combout\,
	datad => \U3|LessThan1~1_combout\,
	combout => \U3|LessThan1~4_combout\);

-- Location: LCCOMB_X89_Y15_N26
\U3|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~7_combout\ = (!\U3|timer\(30) & (\U3|LessThan1~5_combout\ & (\U3|LessThan1~6_combout\ & \U3|LessThan1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(30),
	datab => \U3|LessThan1~5_combout\,
	datac => \U3|LessThan1~6_combout\,
	datad => \U3|LessThan1~4_combout\,
	combout => \U3|LessThan1~7_combout\);

-- Location: LCCOMB_X92_Y15_N12
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

-- Location: LCCOMB_X107_Y15_N18
\U2|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~1_combout\ = (\U2|temp_val~10_combout\ & (!\SW[1]~input_o\ & \SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val~10_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~1_combout\);

-- Location: FF_X92_Y15_N13
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

-- Location: LCCOMB_X92_Y15_N14
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

-- Location: FF_X92_Y15_N15
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

-- Location: LCCOMB_X92_Y15_N16
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

-- Location: FF_X92_Y15_N17
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

-- Location: LCCOMB_X92_Y15_N18
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

-- Location: FF_X92_Y15_N19
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

-- Location: LCCOMB_X92_Y15_N20
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

-- Location: FF_X92_Y15_N21
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

-- Location: LCCOMB_X92_Y15_N22
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

-- Location: FF_X92_Y15_N23
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

-- Location: LCCOMB_X92_Y15_N24
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

-- Location: FF_X92_Y15_N25
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

-- Location: LCCOMB_X92_Y15_N26
\U2|td_val[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|td_val[7]~22_combout\ = \U2|td_val\(7) $ (\U2|td_val[6]~21\ $ (!\keys_debouncer|time_adjust_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datad => \keys_debouncer|time_adjust_out~combout\,
	cin => \U2|td_val[6]~21\,
	combout => \U2|td_val[7]~22_combout\);

-- Location: FF_X92_Y15_N27
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

-- Location: FF_X88_Y16_N29
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

-- Location: FF_X88_Y16_N27
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

-- Location: FF_X88_Y16_N25
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

-- Location: FF_X88_Y16_N23
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

-- Location: FF_X88_Y16_N21
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

-- Location: FF_X88_Y16_N19
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

-- Location: FF_X88_Y16_N17
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

-- Location: LCCOMB_X92_Y15_N0
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

-- Location: FF_X88_Y16_N15
\U3|td[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U3|td[0]~0_combout\,
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|td\(0));

-- Location: LCCOMB_X88_Y16_N14
\U3|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~9_cout\ = CARRY((!\U3|timer\(0) & !\U3|td\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(0),
	datab => \U3|td\(0),
	datad => VCC,
	cout => \U3|LessThan1~9_cout\);

-- Location: LCCOMB_X88_Y16_N16
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

-- Location: LCCOMB_X88_Y16_N18
\U3|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~13_cout\ = CARRY((\U3|td\(2) & ((!\U3|LessThan1~11_cout\) # (!\U3|timer\(2)))) # (!\U3|td\(2) & (!\U3|timer\(2) & !\U3|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|td\(2),
	datab => \U3|timer\(2),
	datad => VCC,
	cin => \U3|LessThan1~11_cout\,
	cout => \U3|LessThan1~13_cout\);

-- Location: LCCOMB_X88_Y16_N20
\U3|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~15_cout\ = CARRY((\U3|timer\(3) & ((!\U3|LessThan1~13_cout\) # (!\U3|td\(3)))) # (!\U3|timer\(3) & (!\U3|td\(3) & !\U3|LessThan1~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(3),
	datab => \U3|td\(3),
	datad => VCC,
	cin => \U3|LessThan1~13_cout\,
	cout => \U3|LessThan1~15_cout\);

-- Location: LCCOMB_X88_Y16_N22
\U3|LessThan1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~17_cout\ = CARRY((\U3|td\(4) & ((!\U3|LessThan1~15_cout\) # (!\U3|timer\(4)))) # (!\U3|td\(4) & (!\U3|timer\(4) & !\U3|LessThan1~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|td\(4),
	datab => \U3|timer\(4),
	datad => VCC,
	cin => \U3|LessThan1~15_cout\,
	cout => \U3|LessThan1~17_cout\);

-- Location: LCCOMB_X88_Y16_N24
\U3|LessThan1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~19_cout\ = CARRY((\U3|timer\(5) & ((!\U3|LessThan1~17_cout\) # (!\U3|td\(5)))) # (!\U3|timer\(5) & (!\U3|td\(5) & !\U3|LessThan1~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(5),
	datab => \U3|td\(5),
	datad => VCC,
	cin => \U3|LessThan1~17_cout\,
	cout => \U3|LessThan1~19_cout\);

-- Location: LCCOMB_X88_Y16_N26
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

-- Location: LCCOMB_X88_Y16_N28
\U3|LessThan1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan1~22_combout\ = (\U3|timer\(7) & (\U3|LessThan1~21_cout\ & \U3|td\(7))) # (!\U3|timer\(7) & ((\U3|LessThan1~21_cout\) # (\U3|td\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(7),
	datad => \U3|td\(7),
	cin => \U3|LessThan1~21_cout\,
	combout => \U3|LessThan1~22_combout\);

-- Location: LCCOMB_X86_Y15_N12
\U3|timer[22]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[22]~36_combout\ = (\U3|LessThan1~7_combout\ & (!\U3|Equal0~4_combout\ & ((\U3|LessThan1~24_combout\) # (\U3|LessThan1~22_combout\)))) # (!\U3|LessThan1~7_combout\ & (((\U3|LessThan1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Equal0~4_combout\,
	datab => \U3|LessThan1~24_combout\,
	datac => \U3|LessThan1~7_combout\,
	datad => \U3|LessThan1~22_combout\,
	combout => \U3|timer[22]~36_combout\);

-- Location: LCCOMB_X86_Y15_N14
\U3|timer[22]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|timer[22]~37_combout\ = (\U3|state.IDLE~q\ & (\U3|state.COOKING~q\ & ((\U3|timer[22]~36_combout\)))) # (!\U3|state.IDLE~q\ & (((\U3|state.COOKING~q\ & \U3|timer[22]~36_combout\)) # (!\keys_debouncer|start_stop_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.IDLE~q\,
	datab => \U3|state.COOKING~q\,
	datac => \keys_debouncer|start_stop_out~combout\,
	datad => \U3|timer[22]~36_combout\,
	combout => \U3|timer[22]~37_combout\);

-- Location: FF_X87_Y16_N1
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(0));

-- Location: LCCOMB_X87_Y16_N2
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

-- Location: FF_X87_Y16_N3
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(1));

-- Location: LCCOMB_X87_Y16_N4
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

-- Location: FF_X87_Y16_N5
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(2));

-- Location: FF_X87_Y16_N7
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
	ena => \U3|timer[22]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|timer\(3));

-- Location: LCCOMB_X89_Y15_N14
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

-- Location: FF_X89_Y15_N15
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

-- Location: FF_X87_Y14_N23
\U3|tf[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|tf_val\(3),
	sload => VCC,
	ena => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|tf\(3));

-- Location: LCCOMB_X87_Y14_N22
\U3|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~1_combout\ = (\U3|tf\(2) & (\U3|timer\(2) & (\U3|timer\(3) $ (!\U3|tf\(3))))) # (!\U3|tf\(2) & (!\U3|timer\(2) & (\U3|timer\(3) $ (!\U3|tf\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|tf\(2),
	datab => \U3|timer\(3),
	datac => \U3|tf\(3),
	datad => \U3|timer\(2),
	combout => \U3|Equal0~1_combout\);

-- Location: LCCOMB_X89_Y15_N16
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

-- Location: FF_X89_Y15_N17
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

-- Location: LCCOMB_X89_Y15_N18
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

-- Location: FF_X89_Y15_N19
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

-- Location: LCCOMB_X89_Y15_N20
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

-- Location: FF_X89_Y15_N21
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

-- Location: LCCOMB_X89_Y15_N22
\U2|tf_val[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|tf_val[7]~22_combout\ = \keys_debouncer|time_adjust_out~combout\ $ (\U2|tf_val[6]~21\ $ (!\U2|tf_val\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datad => \U2|tf_val\(7),
	cin => \U2|tf_val[6]~21\,
	combout => \U2|tf_val[7]~22_combout\);

-- Location: FF_X89_Y15_N23
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

-- Location: LCCOMB_X87_Y14_N10
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

-- Location: FF_X87_Y14_N11
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

-- Location: FF_X87_Y14_N25
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

-- Location: LCCOMB_X87_Y14_N24
\U3|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~3_combout\ = (\U3|tf\(7) & (\U3|timer\(7) & (\U3|tf\(6) $ (!\U3|timer\(6))))) # (!\U3|tf\(7) & (!\U3|timer\(7) & (\U3|tf\(6) $ (!\U3|timer\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|tf\(7),
	datab => \U3|timer\(7),
	datac => \U3|tf\(6),
	datad => \U3|timer\(6),
	combout => \U3|Equal0~3_combout\);

-- Location: FF_X87_Y14_N5
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

-- Location: LCCOMB_X87_Y14_N6
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

-- Location: FF_X87_Y14_N7
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

-- Location: LCCOMB_X87_Y14_N4
\U3|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~2_combout\ = (\U3|timer\(5) & (\U3|tf\(5) & (\U3|timer\(4) $ (!\U3|tf\(4))))) # (!\U3|timer\(5) & (!\U3|tf\(5) & (\U3|timer\(4) $ (!\U3|tf\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(5),
	datab => \U3|timer\(4),
	datac => \U3|tf\(4),
	datad => \U3|tf\(5),
	combout => \U3|Equal0~2_combout\);

-- Location: FF_X87_Y14_N13
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

-- Location: LCCOMB_X86_Y14_N8
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

-- Location: FF_X86_Y14_N9
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

-- Location: LCCOMB_X87_Y14_N12
\U3|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~0_combout\ = (\U3|timer\(0) & (!\U3|tf\(0) & (\U3|timer\(1) $ (!\U3|tf\(1))))) # (!\U3|timer\(0) & (\U3|tf\(0) & (\U3|timer\(1) $ (!\U3|tf\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|timer\(0),
	datab => \U3|timer\(1),
	datac => \U3|tf\(1),
	datad => \U3|tf\(0),
	combout => \U3|Equal0~0_combout\);

-- Location: LCCOMB_X87_Y14_N0
\U3|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Equal0~4_combout\ = (\U3|Equal0~1_combout\ & (\U3|Equal0~3_combout\ & (\U3|Equal0~2_combout\ & \U3|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Equal0~1_combout\,
	datab => \U3|Equal0~3_combout\,
	datac => \U3|Equal0~2_combout\,
	datad => \U3|Equal0~0_combout\,
	combout => \U3|Equal0~4_combout\);

-- Location: LCCOMB_X86_Y15_N10
\U3|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|process_0~0_combout\ = (\U3|LessThan1~7_combout\ & ((\U3|Equal0~4_combout\) # ((!\U3|LessThan1~24_combout\ & !\U3|LessThan1~22_combout\)))) # (!\U3|LessThan1~7_combout\ & (((!\U3|LessThan1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Equal0~4_combout\,
	datab => \U3|LessThan1~24_combout\,
	datac => \U3|LessThan1~7_combout\,
	datad => \U3|LessThan1~22_combout\,
	combout => \U3|process_0~0_combout\);

-- Location: LCCOMB_X86_Y15_N16
\U3|state.IDLE~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|state.IDLE~0_combout\ = (\U3|Selector0~0_combout\ & (\U3|state.IDLE~q\)) # (!\U3|Selector0~0_combout\ & ((!\U3|Selector0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.IDLE~q\,
	datac => \U3|Selector0~0_combout\,
	datad => \U3|Selector0~2_combout\,
	combout => \U3|state.IDLE~0_combout\);

-- Location: LCCOMB_X86_Y15_N30
\U3|state.IDLE~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|state.IDLE~1_combout\ = (\U3|process_0~0_combout\ & ((\U3|state.COOKING~q\ & ((!\U3|Selector0~2_combout\))) # (!\U3|state.COOKING~q\ & (\U3|state.IDLE~0_combout\)))) # (!\U3|process_0~0_combout\ & (\U3|state.IDLE~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|process_0~0_combout\,
	datab => \U3|state.IDLE~0_combout\,
	datac => \U3|state.COOKING~q\,
	datad => \U3|Selector0~2_combout\,
	combout => \U3|state.IDLE~1_combout\);

-- Location: FF_X86_Y15_N31
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

-- Location: LCCOMB_X86_Y15_N4
\U3|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector0~0_combout\ = (\keys_debouncer|start_stop_reg\(1) & (((!\U3|state.DONE~q\)))) # (!\keys_debouncer|start_stop_reg\(1) & ((\keys_debouncer|start_stop_reg\(0) & (\U3|state.IDLE~q\)) # (!\keys_debouncer|start_stop_reg\(0) & 
-- ((!\U3|state.DONE~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|start_stop_reg\(1),
	datab => \U3|state.IDLE~q\,
	datac => \keys_debouncer|start_stop_reg\(0),
	datad => \U3|state.DONE~q\,
	combout => \U3|Selector0~0_combout\);

-- Location: LCCOMB_X86_Y15_N18
\U3|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector0~1_combout\ = (\U3|state.COOKING~q\ & \U3|process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|state.COOKING~q\,
	datad => \U3|process_0~0_combout\,
	combout => \U3|Selector0~1_combout\);

-- Location: LCCOMB_X86_Y15_N0
\U3|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|Selector2~0_combout\ = (\U3|Selector0~1_combout\ & (((!\U3|Selector0~2_combout\)))) # (!\U3|Selector0~1_combout\ & (\U3|Selector0~0_combout\ & ((\U3|state.DONE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U3|Selector0~0_combout\,
	datab => \U3|Selector0~2_combout\,
	datac => \U3|state.DONE~q\,
	datad => \U3|Selector0~1_combout\,
	combout => \U3|Selector2~0_combout\);

-- Location: FF_X86_Y15_N1
\U3|state.DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|Selector2~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|state.DONE~q\);

-- Location: FF_X86_Y15_N25
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
	ena => \U3|state.DONE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|led_alert~q\);

-- Location: LCCOMB_X87_Y13_N0
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

-- Location: LCCOMB_X90_Y15_N4
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

-- Location: LCCOMB_X107_Y15_N20
\U2|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|process_0~0_combout\ = (\U2|temp_val~10_combout\ & (!\SW[1]~input_o\ & !\SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val~10_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \U2|process_0~0_combout\);

-- Location: FF_X90_Y15_N5
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

-- Location: LCCOMB_X90_Y15_N6
\U2|temp_val[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[1]~11_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(1) & (!\U2|temp_val[0]~9\)) # (!\U2|temp_val\(1) & ((\U2|temp_val[0]~9\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(1) & 
-- (\U2|temp_val[0]~9\ & VCC)) # (!\U2|temp_val\(1) & (!\U2|temp_val[0]~9\))))
-- \U2|temp_val[1]~12\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|temp_val[0]~9\) # (!\U2|temp_val\(1)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val\(1) & !\U2|temp_val[0]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|temp_val\(1),
	datad => VCC,
	cin => \U2|temp_val[0]~9\,
	combout => \U2|temp_val[1]~11_combout\,
	cout => \U2|temp_val[1]~12\);

-- Location: FF_X90_Y15_N7
\U2|temp_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[1]~11_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(1));

-- Location: LCCOMB_X90_Y15_N8
\U2|temp_val[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[2]~13_combout\ = ((\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val\(2) $ (\U2|temp_val[1]~12\)))) # (GND)
-- \U2|temp_val[2]~14\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & (\U2|temp_val\(2) & !\U2|temp_val[1]~12\)) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(2)) # (!\U2|temp_val[1]~12\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|temp_val\(2),
	datad => VCC,
	cin => \U2|temp_val[1]~12\,
	combout => \U2|temp_val[2]~13_combout\,
	cout => \U2|temp_val[2]~14\);

-- Location: FF_X90_Y15_N9
\U2|temp_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[2]~13_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(2));

-- Location: LCCOMB_X90_Y15_N10
\U2|temp_val[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[3]~15_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(3) & (!\U2|temp_val[2]~14\)) # (!\U2|temp_val\(3) & ((\U2|temp_val[2]~14\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(3) & 
-- (\U2|temp_val[2]~14\ & VCC)) # (!\U2|temp_val\(3) & (!\U2|temp_val[2]~14\))))
-- \U2|temp_val[3]~16\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|temp_val[2]~14\) # (!\U2|temp_val\(3)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val\(3) & !\U2|temp_val[2]~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|temp_val\(3),
	datad => VCC,
	cin => \U2|temp_val[2]~14\,
	combout => \U2|temp_val[3]~15_combout\,
	cout => \U2|temp_val[3]~16\);

-- Location: FF_X90_Y15_N11
\U2|temp_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[3]~15_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(3));

-- Location: LCCOMB_X90_Y15_N12
\U2|temp_val[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[4]~17_combout\ = ((\U2|temp_val\(4) $ (\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[3]~16\)))) # (GND)
-- \U2|temp_val[4]~18\ = CARRY((\U2|temp_val\(4) & ((!\U2|temp_val[3]~16\) # (!\keys_debouncer|time_adjust_out~combout\))) # (!\U2|temp_val\(4) & (!\keys_debouncer|time_adjust_out~combout\ & !\U2|temp_val[3]~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(4),
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => VCC,
	cin => \U2|temp_val[3]~16\,
	combout => \U2|temp_val[4]~17_combout\,
	cout => \U2|temp_val[4]~18\);

-- Location: FF_X90_Y15_N13
\U2|temp_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[4]~17_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(4));

-- Location: LCCOMB_X90_Y15_N14
\U2|temp_val[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[5]~19_combout\ = (\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(5) & (!\U2|temp_val[4]~18\)) # (!\U2|temp_val\(5) & ((\U2|temp_val[4]~18\) # (GND))))) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(5) & 
-- (\U2|temp_val[4]~18\ & VCC)) # (!\U2|temp_val\(5) & (!\U2|temp_val[4]~18\))))
-- \U2|temp_val[5]~20\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & ((!\U2|temp_val[4]~18\) # (!\U2|temp_val\(5)))) # (!\keys_debouncer|time_adjust_out~combout\ & (!\U2|temp_val\(5) & !\U2|temp_val[4]~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|temp_val\(5),
	datad => VCC,
	cin => \U2|temp_val[4]~18\,
	combout => \U2|temp_val[5]~19_combout\,
	cout => \U2|temp_val[5]~20\);

-- Location: FF_X90_Y15_N15
\U2|temp_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[5]~19_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(5));

-- Location: LCCOMB_X90_Y15_N16
\U2|temp_val[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[6]~21_combout\ = ((\keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val\(6) $ (\U2|temp_val[5]~20\)))) # (GND)
-- \U2|temp_val[6]~22\ = CARRY((\keys_debouncer|time_adjust_out~combout\ & (\U2|temp_val\(6) & !\U2|temp_val[5]~20\)) # (!\keys_debouncer|time_adjust_out~combout\ & ((\U2|temp_val\(6)) # (!\U2|temp_val[5]~20\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \keys_debouncer|time_adjust_out~combout\,
	datab => \U2|temp_val\(6),
	datad => VCC,
	cin => \U2|temp_val[5]~20\,
	combout => \U2|temp_val[6]~21_combout\,
	cout => \U2|temp_val[6]~22\);

-- Location: FF_X90_Y15_N17
\U2|temp_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[6]~21_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(6));

-- Location: LCCOMB_X90_Y15_N18
\U2|temp_val[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \U2|temp_val[7]~23_combout\ = \keys_debouncer|time_adjust_out~combout\ $ (\U2|temp_val[6]~22\ $ (!\U2|temp_val\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \keys_debouncer|time_adjust_out~combout\,
	datad => \U2|temp_val\(7),
	cin => \U2|temp_val[6]~22\,
	combout => \U2|temp_val[7]~23_combout\);

-- Location: FF_X90_Y15_N19
\U2|temp_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U2|temp_val[7]~23_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U2|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|temp_val\(7));

-- Location: FF_X91_Y13_N1
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

-- Location: FF_X91_Y13_N13
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

-- Location: FF_X91_Y13_N11
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

-- Location: FF_X91_Y13_N9
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

-- Location: FF_X91_Y13_N7
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

-- Location: FF_X91_Y13_N5
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

-- Location: FF_X91_Y13_N3
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

-- Location: LCCOMB_X91_Y13_N2
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

-- Location: LCCOMB_X91_Y13_N4
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

-- Location: LCCOMB_X91_Y13_N6
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

-- Location: LCCOMB_X91_Y13_N8
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

-- Location: LCCOMB_X91_Y13_N10
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

-- Location: LCCOMB_X91_Y13_N12
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

-- Location: LCCOMB_X91_Y13_N14
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

-- Location: LCCOMB_X91_Y13_N16
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

-- Location: LCCOMB_X91_Y13_N18
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

-- Location: LCCOMB_X91_Y13_N20
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

-- Location: LCCOMB_X91_Y13_N22
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

-- Location: LCCOMB_X91_Y13_N24
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

-- Location: LCCOMB_X91_Y13_N26
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

-- Location: LCCOMB_X91_Y13_N28
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

-- Location: LCCOMB_X91_Y13_N30
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

-- Location: LCCOMB_X91_Y12_N0
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

-- Location: LCCOMB_X91_Y12_N2
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

-- Location: LCCOMB_X91_Y12_N4
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

-- Location: LCCOMB_X91_Y12_N6
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

-- Location: LCCOMB_X91_Y12_N8
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

-- Location: LCCOMB_X91_Y12_N10
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

-- Location: LCCOMB_X91_Y12_N12
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

-- Location: LCCOMB_X91_Y12_N14
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

-- Location: LCCOMB_X91_Y12_N16
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

-- Location: LCCOMB_X91_Y12_N18
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

-- Location: LCCOMB_X91_Y12_N20
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

-- Location: LCCOMB_X91_Y12_N22
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

-- Location: LCCOMB_X91_Y12_N24
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

-- Location: LCCOMB_X91_Y12_N26
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

-- Location: LCCOMB_X91_Y12_N28
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

-- Location: LCCOMB_X91_Y12_N30
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

-- Location: LCCOMB_X90_Y15_N28
\U1|target_temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|target_temp[0]~0_combout\ = !\U2|temp_val\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U2|temp_val\(0),
	combout => \U1|target_temp[0]~0_combout\);

-- Location: FF_X92_Y13_N11
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

-- Location: LCCOMB_X92_Y13_N0
\U1|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~1_cout\ = CARRY((\U1|target_temp\(0) & \U1|current_temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(0),
	datab => \U1|current_temp\(0),
	datad => VCC,
	cout => \U1|LessThan3~1_cout\);

-- Location: LCCOMB_X92_Y13_N2
\U1|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~3_cout\ = CARRY((\U1|Add2~0_combout\ & ((!\U1|LessThan3~1_cout\) # (!\U1|current_temp\(1)))) # (!\U1|Add2~0_combout\ & (!\U1|current_temp\(1) & !\U1|LessThan3~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~0_combout\,
	datab => \U1|current_temp\(1),
	datad => VCC,
	cin => \U1|LessThan3~1_cout\,
	cout => \U1|LessThan3~3_cout\);

-- Location: LCCOMB_X92_Y13_N4
\U1|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~5_cout\ = CARRY((\U1|current_temp\(2) & (!\U1|Add2~2_combout\ & !\U1|LessThan3~3_cout\)) # (!\U1|current_temp\(2) & ((!\U1|LessThan3~3_cout\) # (!\U1|Add2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|Add2~2_combout\,
	datad => VCC,
	cin => \U1|LessThan3~3_cout\,
	cout => \U1|LessThan3~5_cout\);

-- Location: LCCOMB_X92_Y13_N6
\U1|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~7_cout\ = CARRY((\U1|current_temp\(3) & (\U1|Add2~4_combout\ & !\U1|LessThan3~5_cout\)) # (!\U1|current_temp\(3) & ((\U1|Add2~4_combout\) # (!\U1|LessThan3~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(3),
	datab => \U1|Add2~4_combout\,
	datad => VCC,
	cin => \U1|LessThan3~5_cout\,
	cout => \U1|LessThan3~7_cout\);

-- Location: LCCOMB_X92_Y13_N8
\U1|LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~9_cout\ = CARRY((\U1|Add2~6_combout\ & (!\U1|current_temp\(4) & !\U1|LessThan3~7_cout\)) # (!\U1|Add2~6_combout\ & ((!\U1|LessThan3~7_cout\) # (!\U1|current_temp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~6_combout\,
	datab => \U1|current_temp\(4),
	datad => VCC,
	cin => \U1|LessThan3~7_cout\,
	cout => \U1|LessThan3~9_cout\);

-- Location: LCCOMB_X92_Y13_N10
\U1|LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~11_cout\ = CARRY((\U1|Add2~8_combout\ & ((!\U1|LessThan3~9_cout\) # (!\U1|current_temp\(5)))) # (!\U1|Add2~8_combout\ & (!\U1|current_temp\(5) & !\U1|LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~8_combout\,
	datab => \U1|current_temp\(5),
	datad => VCC,
	cin => \U1|LessThan3~9_cout\,
	cout => \U1|LessThan3~11_cout\);

-- Location: LCCOMB_X92_Y13_N12
\U1|LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~13_cout\ = CARRY((\U1|Add2~10_combout\ & (\U1|current_temp\(6) & !\U1|LessThan3~11_cout\)) # (!\U1|Add2~10_combout\ & ((\U1|current_temp\(6)) # (!\U1|LessThan3~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~10_combout\,
	datab => \U1|current_temp\(6),
	datad => VCC,
	cin => \U1|LessThan3~11_cout\,
	cout => \U1|LessThan3~13_cout\);

-- Location: LCCOMB_X92_Y13_N14
\U1|LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~15_cout\ = CARRY((\U1|Add2~12_combout\ & ((!\U1|LessThan3~13_cout\) # (!\U1|current_temp\(7)))) # (!\U1|Add2~12_combout\ & (!\U1|current_temp\(7) & !\U1|LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~12_combout\,
	datab => \U1|current_temp\(7),
	datad => VCC,
	cin => \U1|LessThan3~13_cout\,
	cout => \U1|LessThan3~15_cout\);

-- Location: LCCOMB_X92_Y13_N16
\U1|LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~17_cout\ = CARRY((\U1|Add2~14_combout\ & (\U1|current_temp\(8) & !\U1|LessThan3~15_cout\)) # (!\U1|Add2~14_combout\ & ((\U1|current_temp\(8)) # (!\U1|LessThan3~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~14_combout\,
	datab => \U1|current_temp\(8),
	datad => VCC,
	cin => \U1|LessThan3~15_cout\,
	cout => \U1|LessThan3~17_cout\);

-- Location: LCCOMB_X92_Y13_N18
\U1|LessThan3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~19_cout\ = CARRY((\U1|current_temp\(9) & (\U1|Add2~16_combout\ & !\U1|LessThan3~17_cout\)) # (!\U1|current_temp\(9) & ((\U1|Add2~16_combout\) # (!\U1|LessThan3~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(9),
	datab => \U1|Add2~16_combout\,
	datad => VCC,
	cin => \U1|LessThan3~17_cout\,
	cout => \U1|LessThan3~19_cout\);

-- Location: LCCOMB_X92_Y13_N20
\U1|LessThan3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~21_cout\ = CARRY((\U1|current_temp\(10) & ((!\U1|LessThan3~19_cout\) # (!\U1|Add2~18_combout\))) # (!\U1|current_temp\(10) & (!\U1|Add2~18_combout\ & !\U1|LessThan3~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(10),
	datab => \U1|Add2~18_combout\,
	datad => VCC,
	cin => \U1|LessThan3~19_cout\,
	cout => \U1|LessThan3~21_cout\);

-- Location: LCCOMB_X92_Y13_N22
\U1|LessThan3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~23_cout\ = CARRY((\U1|current_temp\(11) & (\U1|Add2~20_combout\ & !\U1|LessThan3~21_cout\)) # (!\U1|current_temp\(11) & ((\U1|Add2~20_combout\) # (!\U1|LessThan3~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(11),
	datab => \U1|Add2~20_combout\,
	datad => VCC,
	cin => \U1|LessThan3~21_cout\,
	cout => \U1|LessThan3~23_cout\);

-- Location: LCCOMB_X92_Y13_N24
\U1|LessThan3~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~25_cout\ = CARRY((\U1|current_temp\(12) & ((!\U1|LessThan3~23_cout\) # (!\U1|Add2~22_combout\))) # (!\U1|current_temp\(12) & (!\U1|Add2~22_combout\ & !\U1|LessThan3~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(12),
	datab => \U1|Add2~22_combout\,
	datad => VCC,
	cin => \U1|LessThan3~23_cout\,
	cout => \U1|LessThan3~25_cout\);

-- Location: LCCOMB_X92_Y13_N26
\U1|LessThan3~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~27_cout\ = CARRY((\U1|Add2~24_combout\ & ((!\U1|LessThan3~25_cout\) # (!\U1|current_temp\(13)))) # (!\U1|Add2~24_combout\ & (!\U1|current_temp\(13) & !\U1|LessThan3~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~24_combout\,
	datab => \U1|current_temp\(13),
	datad => VCC,
	cin => \U1|LessThan3~25_cout\,
	cout => \U1|LessThan3~27_cout\);

-- Location: LCCOMB_X92_Y13_N28
\U1|LessThan3~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~29_cout\ = CARRY((\U1|current_temp\(14) & ((!\U1|LessThan3~27_cout\) # (!\U1|Add2~26_combout\))) # (!\U1|current_temp\(14) & (!\U1|Add2~26_combout\ & !\U1|LessThan3~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(14),
	datab => \U1|Add2~26_combout\,
	datad => VCC,
	cin => \U1|LessThan3~27_cout\,
	cout => \U1|LessThan3~29_cout\);

-- Location: LCCOMB_X92_Y13_N30
\U1|LessThan3~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~31_cout\ = CARRY((\U1|current_temp\(15) & (\U1|Add2~28_combout\ & !\U1|LessThan3~29_cout\)) # (!\U1|current_temp\(15) & ((\U1|Add2~28_combout\) # (!\U1|LessThan3~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(15),
	datab => \U1|Add2~28_combout\,
	datad => VCC,
	cin => \U1|LessThan3~29_cout\,
	cout => \U1|LessThan3~31_cout\);

-- Location: LCCOMB_X92_Y12_N0
\U1|LessThan3~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~33_cout\ = CARRY((\U1|Add2~30_combout\ & (\U1|current_temp\(16) & !\U1|LessThan3~31_cout\)) # (!\U1|Add2~30_combout\ & ((\U1|current_temp\(16)) # (!\U1|LessThan3~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~30_combout\,
	datab => \U1|current_temp\(16),
	datad => VCC,
	cin => \U1|LessThan3~31_cout\,
	cout => \U1|LessThan3~33_cout\);

-- Location: LCCOMB_X92_Y12_N2
\U1|LessThan3~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~35_cout\ = CARRY((\U1|Add2~32_combout\ & ((!\U1|LessThan3~33_cout\) # (!\U1|current_temp\(17)))) # (!\U1|Add2~32_combout\ & (!\U1|current_temp\(17) & !\U1|LessThan3~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~32_combout\,
	datab => \U1|current_temp\(17),
	datad => VCC,
	cin => \U1|LessThan3~33_cout\,
	cout => \U1|LessThan3~35_cout\);

-- Location: LCCOMB_X92_Y12_N4
\U1|LessThan3~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~37_cout\ = CARRY((\U1|current_temp\(18) & ((!\U1|LessThan3~35_cout\) # (!\U1|Add2~34_combout\))) # (!\U1|current_temp\(18) & (!\U1|Add2~34_combout\ & !\U1|LessThan3~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(18),
	datab => \U1|Add2~34_combout\,
	datad => VCC,
	cin => \U1|LessThan3~35_cout\,
	cout => \U1|LessThan3~37_cout\);

-- Location: LCCOMB_X92_Y12_N6
\U1|LessThan3~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~39_cout\ = CARRY((\U1|current_temp\(19) & (\U1|Add2~36_combout\ & !\U1|LessThan3~37_cout\)) # (!\U1|current_temp\(19) & ((\U1|Add2~36_combout\) # (!\U1|LessThan3~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(19),
	datab => \U1|Add2~36_combout\,
	datad => VCC,
	cin => \U1|LessThan3~37_cout\,
	cout => \U1|LessThan3~39_cout\);

-- Location: LCCOMB_X92_Y12_N8
\U1|LessThan3~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~41_cout\ = CARRY((\U1|Add2~38_combout\ & (\U1|current_temp\(20) & !\U1|LessThan3~39_cout\)) # (!\U1|Add2~38_combout\ & ((\U1|current_temp\(20)) # (!\U1|LessThan3~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~38_combout\,
	datab => \U1|current_temp\(20),
	datad => VCC,
	cin => \U1|LessThan3~39_cout\,
	cout => \U1|LessThan3~41_cout\);

-- Location: LCCOMB_X92_Y12_N10
\U1|LessThan3~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~43_cout\ = CARRY((\U1|Add2~40_combout\ & ((!\U1|LessThan3~41_cout\) # (!\U1|current_temp\(21)))) # (!\U1|Add2~40_combout\ & (!\U1|current_temp\(21) & !\U1|LessThan3~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~40_combout\,
	datab => \U1|current_temp\(21),
	datad => VCC,
	cin => \U1|LessThan3~41_cout\,
	cout => \U1|LessThan3~43_cout\);

-- Location: LCCOMB_X92_Y12_N12
\U1|LessThan3~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~45_cout\ = CARRY((\U1|Add2~42_combout\ & (\U1|current_temp\(22) & !\U1|LessThan3~43_cout\)) # (!\U1|Add2~42_combout\ & ((\U1|current_temp\(22)) # (!\U1|LessThan3~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~42_combout\,
	datab => \U1|current_temp\(22),
	datad => VCC,
	cin => \U1|LessThan3~43_cout\,
	cout => \U1|LessThan3~45_cout\);

-- Location: LCCOMB_X92_Y12_N14
\U1|LessThan3~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~47_cout\ = CARRY((\U1|Add2~44_combout\ & ((!\U1|LessThan3~45_cout\) # (!\U1|current_temp\(23)))) # (!\U1|Add2~44_combout\ & (!\U1|current_temp\(23) & !\U1|LessThan3~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~44_combout\,
	datab => \U1|current_temp\(23),
	datad => VCC,
	cin => \U1|LessThan3~45_cout\,
	cout => \U1|LessThan3~47_cout\);

-- Location: LCCOMB_X92_Y12_N16
\U1|LessThan3~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~49_cout\ = CARRY((\U1|Add2~46_combout\ & (\U1|current_temp\(24) & !\U1|LessThan3~47_cout\)) # (!\U1|Add2~46_combout\ & ((\U1|current_temp\(24)) # (!\U1|LessThan3~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~46_combout\,
	datab => \U1|current_temp\(24),
	datad => VCC,
	cin => \U1|LessThan3~47_cout\,
	cout => \U1|LessThan3~49_cout\);

-- Location: LCCOMB_X92_Y12_N18
\U1|LessThan3~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~51_cout\ = CARRY((\U1|current_temp\(25) & (\U1|Add2~48_combout\ & !\U1|LessThan3~49_cout\)) # (!\U1|current_temp\(25) & ((\U1|Add2~48_combout\) # (!\U1|LessThan3~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(25),
	datab => \U1|Add2~48_combout\,
	datad => VCC,
	cin => \U1|LessThan3~49_cout\,
	cout => \U1|LessThan3~51_cout\);

-- Location: LCCOMB_X92_Y12_N20
\U1|LessThan3~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~53_cout\ = CARRY((\U1|current_temp\(26) & ((!\U1|LessThan3~51_cout\) # (!\U1|Add2~50_combout\))) # (!\U1|current_temp\(26) & (!\U1|Add2~50_combout\ & !\U1|LessThan3~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(26),
	datab => \U1|Add2~50_combout\,
	datad => VCC,
	cin => \U1|LessThan3~51_cout\,
	cout => \U1|LessThan3~53_cout\);

-- Location: LCCOMB_X92_Y12_N22
\U1|LessThan3~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~55_cout\ = CARRY((\U1|current_temp\(27) & (\U1|Add2~52_combout\ & !\U1|LessThan3~53_cout\)) # (!\U1|current_temp\(27) & ((\U1|Add2~52_combout\) # (!\U1|LessThan3~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(27),
	datab => \U1|Add2~52_combout\,
	datad => VCC,
	cin => \U1|LessThan3~53_cout\,
	cout => \U1|LessThan3~55_cout\);

-- Location: LCCOMB_X92_Y12_N24
\U1|LessThan3~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~57_cout\ = CARRY((\U1|current_temp\(28) & ((!\U1|LessThan3~55_cout\) # (!\U1|Add2~54_combout\))) # (!\U1|current_temp\(28) & (!\U1|Add2~54_combout\ & !\U1|LessThan3~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(28),
	datab => \U1|Add2~54_combout\,
	datad => VCC,
	cin => \U1|LessThan3~55_cout\,
	cout => \U1|LessThan3~57_cout\);

-- Location: LCCOMB_X92_Y12_N26
\U1|LessThan3~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~59_cout\ = CARRY((\U1|Add2~56_combout\ & ((!\U1|LessThan3~57_cout\) # (!\U1|current_temp\(29)))) # (!\U1|Add2~56_combout\ & (!\U1|current_temp\(29) & !\U1|LessThan3~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add2~56_combout\,
	datab => \U1|current_temp\(29),
	datad => VCC,
	cin => \U1|LessThan3~57_cout\,
	cout => \U1|LessThan3~59_cout\);

-- Location: LCCOMB_X92_Y12_N28
\U1|LessThan3~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~61_cout\ = CARRY((\U1|current_temp\(30) & ((!\U1|LessThan3~59_cout\) # (!\U1|Add2~58_combout\))) # (!\U1|current_temp\(30) & (!\U1|Add2~58_combout\ & !\U1|LessThan3~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(30),
	datab => \U1|Add2~58_combout\,
	datad => VCC,
	cin => \U1|LessThan3~59_cout\,
	cout => \U1|LessThan3~61_cout\);

-- Location: LCCOMB_X92_Y12_N30
\U1|LessThan3~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan3~62_combout\ = (\U1|current_temp\(31) & (\U1|LessThan3~61_cout\ & \U1|Add2~60_combout\)) # (!\U1|current_temp\(31) & ((\U1|LessThan3~61_cout\) # (\U1|Add2~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(31),
	datad => \U1|Add2~60_combout\,
	cin => \U1|LessThan3~61_cout\,
	combout => \U1|LessThan3~62_combout\);

-- Location: LCCOMB_X88_Y12_N0
\U1|current_temp~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp~34_combout\ = (\U1|heating~q\ & (\U1|LessThan2~62_combout\)) # (!\U1|heating~q\ & ((\U1|LessThan3~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|heating~q\,
	datac => \U1|LessThan2~62_combout\,
	datad => \U1|LessThan3~62_combout\,
	combout => \U1|current_temp~34_combout\);

-- Location: FF_X87_Y13_N1
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(0));

-- Location: LCCOMB_X87_Y13_N2
\U1|current_temp[1]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[1]~35_combout\ = (\U1|current_temp\(1) & ((\U1|heating~q\ & (!\U1|current_temp[0]~33\)) # (!\U1|heating~q\ & (\U1|current_temp[0]~33\ & VCC)))) # (!\U1|current_temp\(1) & ((\U1|heating~q\ & ((\U1|current_temp[0]~33\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[0]~33\))))
-- \U1|current_temp[1]~36\ = CARRY((\U1|current_temp\(1) & (\U1|heating~q\ & !\U1|current_temp[0]~33\)) # (!\U1|current_temp\(1) & ((\U1|heating~q\) # (!\U1|current_temp[0]~33\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[0]~33\,
	combout => \U1|current_temp[1]~35_combout\,
	cout => \U1|current_temp[1]~36\);

-- Location: FF_X87_Y13_N3
\U1|current_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[1]~35_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(1));

-- Location: LCCOMB_X87_Y13_N4
\U1|current_temp[2]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[2]~37_combout\ = (\U1|current_temp\(2) & ((\U1|heating~q\ & (\U1|current_temp[1]~36\ & VCC)) # (!\U1|heating~q\ & (!\U1|current_temp[1]~36\)))) # (!\U1|current_temp\(2) & ((\U1|heating~q\ & (!\U1|current_temp[1]~36\)) # (!\U1|heating~q\ & 
-- ((\U1|current_temp[1]~36\) # (GND)))))
-- \U1|current_temp[2]~38\ = CARRY((\U1|current_temp\(2) & (!\U1|heating~q\ & !\U1|current_temp[1]~36\)) # (!\U1|current_temp\(2) & ((!\U1|current_temp[1]~36\) # (!\U1|heating~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[1]~36\,
	combout => \U1|current_temp[2]~37_combout\,
	cout => \U1|current_temp[2]~38\);

-- Location: FF_X87_Y13_N5
\U1|current_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[2]~37_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(2));

-- Location: LCCOMB_X87_Y13_N6
\U1|current_temp[3]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[3]~39_combout\ = (\U1|current_temp\(3) & ((\U1|heating~q\ & (!\U1|current_temp[2]~38\)) # (!\U1|heating~q\ & (\U1|current_temp[2]~38\ & VCC)))) # (!\U1|current_temp\(3) & ((\U1|heating~q\ & ((\U1|current_temp[2]~38\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[2]~38\))))
-- \U1|current_temp[3]~40\ = CARRY((\U1|current_temp\(3) & (\U1|heating~q\ & !\U1|current_temp[2]~38\)) # (!\U1|current_temp\(3) & ((\U1|heating~q\) # (!\U1|current_temp[2]~38\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(3),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[2]~38\,
	combout => \U1|current_temp[3]~39_combout\,
	cout => \U1|current_temp[3]~40\);

-- Location: FF_X87_Y13_N7
\U1|current_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[3]~39_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(3));

-- Location: LCCOMB_X87_Y13_N8
\U1|current_temp[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[4]~41_combout\ = (\U1|current_temp\(4) & ((\U1|heating~q\ & (\U1|current_temp[3]~40\ & VCC)) # (!\U1|heating~q\ & (!\U1|current_temp[3]~40\)))) # (!\U1|current_temp\(4) & ((\U1|heating~q\ & (!\U1|current_temp[3]~40\)) # (!\U1|heating~q\ & 
-- ((\U1|current_temp[3]~40\) # (GND)))))
-- \U1|current_temp[4]~42\ = CARRY((\U1|current_temp\(4) & (!\U1|heating~q\ & !\U1|current_temp[3]~40\)) # (!\U1|current_temp\(4) & ((!\U1|current_temp[3]~40\) # (!\U1|heating~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(4),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[3]~40\,
	combout => \U1|current_temp[4]~41_combout\,
	cout => \U1|current_temp[4]~42\);

-- Location: FF_X87_Y13_N9
\U1|current_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[4]~41_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(4));

-- Location: LCCOMB_X87_Y13_N10
\U1|current_temp[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[5]~43_combout\ = (\U1|current_temp\(5) & ((\U1|heating~q\ & (!\U1|current_temp[4]~42\)) # (!\U1|heating~q\ & (\U1|current_temp[4]~42\ & VCC)))) # (!\U1|current_temp\(5) & ((\U1|heating~q\ & ((\U1|current_temp[4]~42\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[4]~42\))))
-- \U1|current_temp[5]~44\ = CARRY((\U1|current_temp\(5) & (\U1|heating~q\ & !\U1|current_temp[4]~42\)) # (!\U1|current_temp\(5) & ((\U1|heating~q\) # (!\U1|current_temp[4]~42\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(5),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[4]~42\,
	combout => \U1|current_temp[5]~43_combout\,
	cout => \U1|current_temp[5]~44\);

-- Location: FF_X87_Y13_N11
\U1|current_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[5]~43_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(5));

-- Location: LCCOMB_X87_Y13_N12
\U1|current_temp[6]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[6]~45_combout\ = ((\U1|current_temp\(6) $ (\U1|heating~q\ $ (\U1|current_temp[5]~44\)))) # (GND)
-- \U1|current_temp[6]~46\ = CARRY((\U1|current_temp\(6) & ((!\U1|current_temp[5]~44\) # (!\U1|heating~q\))) # (!\U1|current_temp\(6) & (!\U1|heating~q\ & !\U1|current_temp[5]~44\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[5]~44\,
	combout => \U1|current_temp[6]~45_combout\,
	cout => \U1|current_temp[6]~46\);

-- Location: FF_X87_Y13_N13
\U1|current_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[6]~45_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(6));

-- Location: LCCOMB_X87_Y13_N14
\U1|current_temp[7]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[7]~47_combout\ = (\U1|current_temp\(7) & ((\U1|heating~q\ & (!\U1|current_temp[6]~46\)) # (!\U1|heating~q\ & (\U1|current_temp[6]~46\ & VCC)))) # (!\U1|current_temp\(7) & ((\U1|heating~q\ & ((\U1|current_temp[6]~46\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[6]~46\))))
-- \U1|current_temp[7]~48\ = CARRY((\U1|current_temp\(7) & (\U1|heating~q\ & !\U1|current_temp[6]~46\)) # (!\U1|current_temp\(7) & ((\U1|heating~q\) # (!\U1|current_temp[6]~46\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(7),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[6]~46\,
	combout => \U1|current_temp[7]~47_combout\,
	cout => \U1|current_temp[7]~48\);

-- Location: FF_X87_Y13_N15
\U1|current_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U1|current_temp[7]~47_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(7));

-- Location: LCCOMB_X87_Y13_N16
\U1|current_temp[8]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[8]~49_combout\ = ((\U1|current_temp\(8) $ (\U1|heating~q\ $ (\U1|current_temp[7]~48\)))) # (GND)
-- \U1|current_temp[8]~50\ = CARRY((\U1|current_temp\(8) & ((!\U1|current_temp[7]~48\) # (!\U1|heating~q\))) # (!\U1|current_temp\(8) & (!\U1|heating~q\ & !\U1|current_temp[7]~48\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(8),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[7]~48\,
	combout => \U1|current_temp[8]~49_combout\,
	cout => \U1|current_temp[8]~50\);

-- Location: FF_X87_Y13_N17
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(8));

-- Location: LCCOMB_X87_Y13_N18
\U1|current_temp[9]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[9]~51_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(9) & (!\U1|current_temp[8]~50\)) # (!\U1|current_temp\(9) & ((\U1|current_temp[8]~50\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(9) & (\U1|current_temp[8]~50\ & VCC)) # 
-- (!\U1|current_temp\(9) & (!\U1|current_temp[8]~50\))))
-- \U1|current_temp[9]~52\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[8]~50\) # (!\U1|current_temp\(9)))) # (!\U1|heating~q\ & (!\U1|current_temp\(9) & !\U1|current_temp[8]~50\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(9),
	datad => VCC,
	cin => \U1|current_temp[8]~50\,
	combout => \U1|current_temp[9]~51_combout\,
	cout => \U1|current_temp[9]~52\);

-- Location: FF_X87_Y13_N19
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(9));

-- Location: LCCOMB_X87_Y13_N20
\U1|current_temp[10]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[10]~53_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(10) $ (\U1|current_temp[9]~52\)))) # (GND)
-- \U1|current_temp[10]~54\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(10) & !\U1|current_temp[9]~52\)) # (!\U1|heating~q\ & ((\U1|current_temp\(10)) # (!\U1|current_temp[9]~52\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(10),
	datad => VCC,
	cin => \U1|current_temp[9]~52\,
	combout => \U1|current_temp[10]~53_combout\,
	cout => \U1|current_temp[10]~54\);

-- Location: FF_X87_Y13_N21
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(10));

-- Location: LCCOMB_X87_Y13_N22
\U1|current_temp[11]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[11]~55_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(11) & (!\U1|current_temp[10]~54\)) # (!\U1|current_temp\(11) & ((\U1|current_temp[10]~54\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(11) & (\U1|current_temp[10]~54\ & 
-- VCC)) # (!\U1|current_temp\(11) & (!\U1|current_temp[10]~54\))))
-- \U1|current_temp[11]~56\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[10]~54\) # (!\U1|current_temp\(11)))) # (!\U1|heating~q\ & (!\U1|current_temp\(11) & !\U1|current_temp[10]~54\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(11),
	datad => VCC,
	cin => \U1|current_temp[10]~54\,
	combout => \U1|current_temp[11]~55_combout\,
	cout => \U1|current_temp[11]~56\);

-- Location: FF_X87_Y13_N23
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(11));

-- Location: LCCOMB_X87_Y13_N24
\U1|current_temp[12]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[12]~57_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(12) $ (\U1|current_temp[11]~56\)))) # (GND)
-- \U1|current_temp[12]~58\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(12) & !\U1|current_temp[11]~56\)) # (!\U1|heating~q\ & ((\U1|current_temp\(12)) # (!\U1|current_temp[11]~56\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(12),
	datad => VCC,
	cin => \U1|current_temp[11]~56\,
	combout => \U1|current_temp[12]~57_combout\,
	cout => \U1|current_temp[12]~58\);

-- Location: FF_X87_Y13_N25
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(12));

-- Location: LCCOMB_X87_Y13_N26
\U1|current_temp[13]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[13]~59_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(13) & (!\U1|current_temp[12]~58\)) # (!\U1|current_temp\(13) & ((\U1|current_temp[12]~58\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(13) & (\U1|current_temp[12]~58\ & 
-- VCC)) # (!\U1|current_temp\(13) & (!\U1|current_temp[12]~58\))))
-- \U1|current_temp[13]~60\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[12]~58\) # (!\U1|current_temp\(13)))) # (!\U1|heating~q\ & (!\U1|current_temp\(13) & !\U1|current_temp[12]~58\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(13),
	datad => VCC,
	cin => \U1|current_temp[12]~58\,
	combout => \U1|current_temp[13]~59_combout\,
	cout => \U1|current_temp[13]~60\);

-- Location: FF_X87_Y13_N27
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(13));

-- Location: LCCOMB_X87_Y13_N28
\U1|current_temp[14]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[14]~61_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(14) $ (\U1|current_temp[13]~60\)))) # (GND)
-- \U1|current_temp[14]~62\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(14) & !\U1|current_temp[13]~60\)) # (!\U1|heating~q\ & ((\U1|current_temp\(14)) # (!\U1|current_temp[13]~60\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(14),
	datad => VCC,
	cin => \U1|current_temp[13]~60\,
	combout => \U1|current_temp[14]~61_combout\,
	cout => \U1|current_temp[14]~62\);

-- Location: FF_X87_Y13_N29
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(14));

-- Location: LCCOMB_X87_Y13_N30
\U1|current_temp[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[15]~63_combout\ = (\U1|heating~q\ & ((\U1|current_temp\(15) & (!\U1|current_temp[14]~62\)) # (!\U1|current_temp\(15) & ((\U1|current_temp[14]~62\) # (GND))))) # (!\U1|heating~q\ & ((\U1|current_temp\(15) & (\U1|current_temp[14]~62\ & 
-- VCC)) # (!\U1|current_temp\(15) & (!\U1|current_temp[14]~62\))))
-- \U1|current_temp[15]~64\ = CARRY((\U1|heating~q\ & ((!\U1|current_temp[14]~62\) # (!\U1|current_temp\(15)))) # (!\U1|heating~q\ & (!\U1|current_temp\(15) & !\U1|current_temp[14]~62\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(15),
	datad => VCC,
	cin => \U1|current_temp[14]~62\,
	combout => \U1|current_temp[15]~63_combout\,
	cout => \U1|current_temp[15]~64\);

-- Location: FF_X87_Y13_N31
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(15));

-- Location: LCCOMB_X87_Y12_N0
\U1|current_temp[16]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[16]~65_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(16) $ (\U1|current_temp[15]~64\)))) # (GND)
-- \U1|current_temp[16]~66\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(16) & !\U1|current_temp[15]~64\)) # (!\U1|heating~q\ & ((\U1|current_temp\(16)) # (!\U1|current_temp[15]~64\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(16),
	datad => VCC,
	cin => \U1|current_temp[15]~64\,
	combout => \U1|current_temp[16]~65_combout\,
	cout => \U1|current_temp[16]~66\);

-- Location: FF_X87_Y12_N1
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(16));

-- Location: LCCOMB_X87_Y12_N2
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

-- Location: FF_X87_Y12_N3
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(17));

-- Location: LCCOMB_X87_Y12_N4
\U1|current_temp[18]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[18]~69_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(18) $ (\U1|current_temp[17]~68\)))) # (GND)
-- \U1|current_temp[18]~70\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(18) & !\U1|current_temp[17]~68\)) # (!\U1|heating~q\ & ((\U1|current_temp\(18)) # (!\U1|current_temp[17]~68\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(18),
	datad => VCC,
	cin => \U1|current_temp[17]~68\,
	combout => \U1|current_temp[18]~69_combout\,
	cout => \U1|current_temp[18]~70\);

-- Location: FF_X87_Y12_N5
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(18));

-- Location: LCCOMB_X87_Y12_N6
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

-- Location: FF_X87_Y12_N7
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(19));

-- Location: LCCOMB_X87_Y12_N8
\U1|current_temp[20]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[20]~73_combout\ = ((\U1|heating~q\ $ (\U1|current_temp\(20) $ (\U1|current_temp[19]~72\)))) # (GND)
-- \U1|current_temp[20]~74\ = CARRY((\U1|heating~q\ & (\U1|current_temp\(20) & !\U1|current_temp[19]~72\)) # (!\U1|heating~q\ & ((\U1|current_temp\(20)) # (!\U1|current_temp[19]~72\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|heating~q\,
	datab => \U1|current_temp\(20),
	datad => VCC,
	cin => \U1|current_temp[19]~72\,
	combout => \U1|current_temp[20]~73_combout\,
	cout => \U1|current_temp[20]~74\);

-- Location: FF_X87_Y12_N9
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(20));

-- Location: LCCOMB_X87_Y12_N10
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

-- Location: FF_X87_Y12_N11
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(21));

-- Location: LCCOMB_X87_Y12_N12
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

-- Location: FF_X87_Y12_N13
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(22));

-- Location: LCCOMB_X87_Y12_N14
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

-- Location: FF_X87_Y12_N15
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(23));

-- Location: LCCOMB_X87_Y12_N16
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

-- Location: FF_X87_Y12_N17
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(24));

-- Location: LCCOMB_X87_Y12_N18
\U1|current_temp[25]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[25]~83_combout\ = (\U1|current_temp\(25) & ((\U1|heating~q\ & (!\U1|current_temp[24]~82\)) # (!\U1|heating~q\ & (\U1|current_temp[24]~82\ & VCC)))) # (!\U1|current_temp\(25) & ((\U1|heating~q\ & ((\U1|current_temp[24]~82\) # (GND))) # 
-- (!\U1|heating~q\ & (!\U1|current_temp[24]~82\))))
-- \U1|current_temp[25]~84\ = CARRY((\U1|current_temp\(25) & (\U1|heating~q\ & !\U1|current_temp[24]~82\)) # (!\U1|current_temp\(25) & ((\U1|heating~q\) # (!\U1|current_temp[24]~82\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(25),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[24]~82\,
	combout => \U1|current_temp[25]~83_combout\,
	cout => \U1|current_temp[25]~84\);

-- Location: FF_X87_Y12_N19
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(25));

-- Location: LCCOMB_X87_Y12_N20
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

-- Location: FF_X87_Y12_N21
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(26));

-- Location: LCCOMB_X87_Y12_N22
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

-- Location: FF_X87_Y12_N23
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(27));

-- Location: LCCOMB_X87_Y12_N24
\U1|current_temp[28]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[28]~89_combout\ = ((\U1|current_temp\(28) $ (\U1|heating~q\ $ (\U1|current_temp[27]~88\)))) # (GND)
-- \U1|current_temp[28]~90\ = CARRY((\U1|current_temp\(28) & ((!\U1|current_temp[27]~88\) # (!\U1|heating~q\))) # (!\U1|current_temp\(28) & (!\U1|heating~q\ & !\U1|current_temp[27]~88\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(28),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[27]~88\,
	combout => \U1|current_temp[28]~89_combout\,
	cout => \U1|current_temp[28]~90\);

-- Location: FF_X87_Y12_N25
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(28));

-- Location: LCCOMB_X87_Y12_N26
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

-- Location: FF_X87_Y12_N27
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(29));

-- Location: LCCOMB_X87_Y12_N28
\U1|current_temp[30]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|current_temp[30]~93_combout\ = ((\U1|current_temp\(30) $ (\U1|heating~q\ $ (\U1|current_temp[29]~92\)))) # (GND)
-- \U1|current_temp[30]~94\ = CARRY((\U1|current_temp\(30) & ((!\U1|current_temp[29]~92\) # (!\U1|heating~q\))) # (!\U1|current_temp\(30) & (!\U1|heating~q\ & !\U1|current_temp[29]~92\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(30),
	datab => \U1|heating~q\,
	datad => VCC,
	cin => \U1|current_temp[29]~92\,
	combout => \U1|current_temp[30]~93_combout\,
	cout => \U1|current_temp[30]~94\);

-- Location: FF_X87_Y12_N29
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(30));

-- Location: LCCOMB_X87_Y12_N30
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

-- Location: FF_X87_Y12_N31
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
	ena => \U1|current_temp~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|current_temp\(31));

-- Location: LCCOMB_X90_Y13_N16
\U1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~0_combout\ = \U1|target_temp\(1) $ (VCC)
-- \U1|Add0~1\ = CARRY(\U1|target_temp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(1),
	datad => VCC,
	combout => \U1|Add0~0_combout\,
	cout => \U1|Add0~1\);

-- Location: LCCOMB_X90_Y13_N18
\U1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~2_combout\ = (\U1|target_temp\(2) & (!\U1|Add0~1\)) # (!\U1|target_temp\(2) & ((\U1|Add0~1\) # (GND)))
-- \U1|Add0~3\ = CARRY((!\U1|Add0~1\) # (!\U1|target_temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(2),
	datad => VCC,
	cin => \U1|Add0~1\,
	combout => \U1|Add0~2_combout\,
	cout => \U1|Add0~3\);

-- Location: LCCOMB_X90_Y13_N20
\U1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~4_combout\ = (\U1|target_temp\(3) & (\U1|Add0~3\ $ (GND))) # (!\U1|target_temp\(3) & (!\U1|Add0~3\ & VCC))
-- \U1|Add0~5\ = CARRY((\U1|target_temp\(3) & !\U1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(3),
	datad => VCC,
	cin => \U1|Add0~3\,
	combout => \U1|Add0~4_combout\,
	cout => \U1|Add0~5\);

-- Location: LCCOMB_X90_Y13_N22
\U1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~6_combout\ = (\U1|target_temp\(4) & (!\U1|Add0~5\)) # (!\U1|target_temp\(4) & ((\U1|Add0~5\) # (GND)))
-- \U1|Add0~7\ = CARRY((!\U1|Add0~5\) # (!\U1|target_temp\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(4),
	datad => VCC,
	cin => \U1|Add0~5\,
	combout => \U1|Add0~6_combout\,
	cout => \U1|Add0~7\);

-- Location: LCCOMB_X90_Y13_N24
\U1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|Add0~8_combout\ = (\U1|target_temp\(5) & (\U1|Add0~7\ $ (GND))) # (!\U1|target_temp\(5) & (!\U1|Add0~7\ & VCC))
-- \U1|Add0~9\ = CARRY((\U1|target_temp\(5) & !\U1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|target_temp\(5),
	datad => VCC,
	cin => \U1|Add0~7\,
	combout => \U1|Add0~8_combout\,
	cout => \U1|Add0~9\);

-- Location: LCCOMB_X90_Y13_N26
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

-- Location: LCCOMB_X90_Y13_N28
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

-- Location: LCCOMB_X90_Y13_N30
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

-- Location: LCCOMB_X89_Y13_N0
\U1|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~1_cout\ = CARRY((!\U1|target_temp\(0) & !\U1|current_temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|target_temp\(0),
	datab => \U1|current_temp\(0),
	datad => VCC,
	cout => \U1|LessThan2~1_cout\);

-- Location: LCCOMB_X89_Y13_N2
\U1|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~3_cout\ = CARRY((\U1|current_temp\(1) & ((!\U1|LessThan2~1_cout\) # (!\U1|Add0~0_combout\))) # (!\U1|current_temp\(1) & (!\U1|Add0~0_combout\ & !\U1|LessThan2~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(1),
	datab => \U1|Add0~0_combout\,
	datad => VCC,
	cin => \U1|LessThan2~1_cout\,
	cout => \U1|LessThan2~3_cout\);

-- Location: LCCOMB_X89_Y13_N4
\U1|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~5_cout\ = CARRY((\U1|current_temp\(2) & ((\U1|Add0~2_combout\) # (!\U1|LessThan2~3_cout\))) # (!\U1|current_temp\(2) & (\U1|Add0~2_combout\ & !\U1|LessThan2~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(2),
	datab => \U1|Add0~2_combout\,
	datad => VCC,
	cin => \U1|LessThan2~3_cout\,
	cout => \U1|LessThan2~5_cout\);

-- Location: LCCOMB_X89_Y13_N6
\U1|LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~7_cout\ = CARRY((\U1|Add0~4_combout\ & (\U1|current_temp\(3) & !\U1|LessThan2~5_cout\)) # (!\U1|Add0~4_combout\ & ((\U1|current_temp\(3)) # (!\U1|LessThan2~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~4_combout\,
	datab => \U1|current_temp\(3),
	datad => VCC,
	cin => \U1|LessThan2~5_cout\,
	cout => \U1|LessThan2~7_cout\);

-- Location: LCCOMB_X89_Y13_N8
\U1|LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~9_cout\ = CARRY((\U1|current_temp\(4) & ((\U1|Add0~6_combout\) # (!\U1|LessThan2~7_cout\))) # (!\U1|current_temp\(4) & (\U1|Add0~6_combout\ & !\U1|LessThan2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(4),
	datab => \U1|Add0~6_combout\,
	datad => VCC,
	cin => \U1|LessThan2~7_cout\,
	cout => \U1|LessThan2~9_cout\);

-- Location: LCCOMB_X89_Y13_N10
\U1|LessThan2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~11_cout\ = CARRY((\U1|Add0~8_combout\ & (\U1|current_temp\(5) & !\U1|LessThan2~9_cout\)) # (!\U1|Add0~8_combout\ & ((\U1|current_temp\(5)) # (!\U1|LessThan2~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~8_combout\,
	datab => \U1|current_temp\(5),
	datad => VCC,
	cin => \U1|LessThan2~9_cout\,
	cout => \U1|LessThan2~11_cout\);

-- Location: LCCOMB_X89_Y13_N12
\U1|LessThan2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~13_cout\ = CARRY((\U1|current_temp\(6) & (\U1|Add0~10_combout\ & !\U1|LessThan2~11_cout\)) # (!\U1|current_temp\(6) & ((\U1|Add0~10_combout\) # (!\U1|LessThan2~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(6),
	datab => \U1|Add0~10_combout\,
	datad => VCC,
	cin => \U1|LessThan2~11_cout\,
	cout => \U1|LessThan2~13_cout\);

-- Location: LCCOMB_X89_Y13_N14
\U1|LessThan2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~15_cout\ = CARRY((\U1|current_temp\(7) & ((!\U1|LessThan2~13_cout\) # (!\U1|Add0~12_combout\))) # (!\U1|current_temp\(7) & (!\U1|Add0~12_combout\ & !\U1|LessThan2~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(7),
	datab => \U1|Add0~12_combout\,
	datad => VCC,
	cin => \U1|LessThan2~13_cout\,
	cout => \U1|LessThan2~15_cout\);

-- Location: LCCOMB_X89_Y13_N16
\U1|LessThan2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~17_cout\ = CARRY((\U1|Add0~14_combout\ & ((!\U1|LessThan2~15_cout\) # (!\U1|current_temp\(8)))) # (!\U1|Add0~14_combout\ & (!\U1|current_temp\(8) & !\U1|LessThan2~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Add0~14_combout\,
	datab => \U1|current_temp\(8),
	datad => VCC,
	cin => \U1|LessThan2~15_cout\,
	cout => \U1|LessThan2~17_cout\);

-- Location: LCCOMB_X89_Y13_N18
\U1|LessThan2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~19_cout\ = CARRY((\U1|current_temp\(9)) # (!\U1|LessThan2~17_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(9),
	datad => VCC,
	cin => \U1|LessThan2~17_cout\,
	cout => \U1|LessThan2~19_cout\);

-- Location: LCCOMB_X89_Y13_N20
\U1|LessThan2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~21_cout\ = CARRY((!\U1|current_temp\(10) & !\U1|LessThan2~19_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(10),
	datad => VCC,
	cin => \U1|LessThan2~19_cout\,
	cout => \U1|LessThan2~21_cout\);

-- Location: LCCOMB_X89_Y13_N22
\U1|LessThan2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~23_cout\ = CARRY((\U1|current_temp\(11)) # (!\U1|LessThan2~21_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(11),
	datad => VCC,
	cin => \U1|LessThan2~21_cout\,
	cout => \U1|LessThan2~23_cout\);

-- Location: LCCOMB_X89_Y13_N24
\U1|LessThan2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~25_cout\ = CARRY((!\U1|current_temp\(12) & !\U1|LessThan2~23_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(12),
	datad => VCC,
	cin => \U1|LessThan2~23_cout\,
	cout => \U1|LessThan2~25_cout\);

-- Location: LCCOMB_X89_Y13_N26
\U1|LessThan2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~27_cout\ = CARRY((\U1|current_temp\(13)) # (!\U1|LessThan2~25_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(13),
	datad => VCC,
	cin => \U1|LessThan2~25_cout\,
	cout => \U1|LessThan2~27_cout\);

-- Location: LCCOMB_X89_Y13_N28
\U1|LessThan2~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~29_cout\ = CARRY((!\U1|current_temp\(14) & !\U1|LessThan2~27_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(14),
	datad => VCC,
	cin => \U1|LessThan2~27_cout\,
	cout => \U1|LessThan2~29_cout\);

-- Location: LCCOMB_X89_Y13_N30
\U1|LessThan2~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~31_cout\ = CARRY((\U1|current_temp\(15)) # (!\U1|LessThan2~29_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(15),
	datad => VCC,
	cin => \U1|LessThan2~29_cout\,
	cout => \U1|LessThan2~31_cout\);

-- Location: LCCOMB_X89_Y12_N0
\U1|LessThan2~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~33_cout\ = CARRY((!\U1|current_temp\(16) & !\U1|LessThan2~31_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(16),
	datad => VCC,
	cin => \U1|LessThan2~31_cout\,
	cout => \U1|LessThan2~33_cout\);

-- Location: LCCOMB_X89_Y12_N2
\U1|LessThan2~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~35_cout\ = CARRY((\U1|current_temp\(17)) # (!\U1|LessThan2~33_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(17),
	datad => VCC,
	cin => \U1|LessThan2~33_cout\,
	cout => \U1|LessThan2~35_cout\);

-- Location: LCCOMB_X89_Y12_N4
\U1|LessThan2~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~37_cout\ = CARRY((!\U1|current_temp\(18) & !\U1|LessThan2~35_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(18),
	datad => VCC,
	cin => \U1|LessThan2~35_cout\,
	cout => \U1|LessThan2~37_cout\);

-- Location: LCCOMB_X89_Y12_N6
\U1|LessThan2~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~39_cout\ = CARRY((\U1|current_temp\(19)) # (!\U1|LessThan2~37_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(19),
	datad => VCC,
	cin => \U1|LessThan2~37_cout\,
	cout => \U1|LessThan2~39_cout\);

-- Location: LCCOMB_X89_Y12_N8
\U1|LessThan2~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~41_cout\ = CARRY((!\U1|current_temp\(20) & !\U1|LessThan2~39_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(20),
	datad => VCC,
	cin => \U1|LessThan2~39_cout\,
	cout => \U1|LessThan2~41_cout\);

-- Location: LCCOMB_X89_Y12_N10
\U1|LessThan2~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~43_cout\ = CARRY((\U1|current_temp\(21)) # (!\U1|LessThan2~41_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(21),
	datad => VCC,
	cin => \U1|LessThan2~41_cout\,
	cout => \U1|LessThan2~43_cout\);

-- Location: LCCOMB_X89_Y12_N12
\U1|LessThan2~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~45_cout\ = CARRY((!\U1|current_temp\(22) & !\U1|LessThan2~43_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(22),
	datad => VCC,
	cin => \U1|LessThan2~43_cout\,
	cout => \U1|LessThan2~45_cout\);

-- Location: LCCOMB_X89_Y12_N14
\U1|LessThan2~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~47_cout\ = CARRY((\U1|current_temp\(23)) # (!\U1|LessThan2~45_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(23),
	datad => VCC,
	cin => \U1|LessThan2~45_cout\,
	cout => \U1|LessThan2~47_cout\);

-- Location: LCCOMB_X89_Y12_N16
\U1|LessThan2~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~49_cout\ = CARRY((!\U1|current_temp\(24) & !\U1|LessThan2~47_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(24),
	datad => VCC,
	cin => \U1|LessThan2~47_cout\,
	cout => \U1|LessThan2~49_cout\);

-- Location: LCCOMB_X89_Y12_N18
\U1|LessThan2~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~51_cout\ = CARRY((\U1|current_temp\(25)) # (!\U1|LessThan2~49_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(25),
	datad => VCC,
	cin => \U1|LessThan2~49_cout\,
	cout => \U1|LessThan2~51_cout\);

-- Location: LCCOMB_X89_Y12_N20
\U1|LessThan2~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~53_cout\ = CARRY((!\U1|current_temp\(26) & !\U1|LessThan2~51_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(26),
	datad => VCC,
	cin => \U1|LessThan2~51_cout\,
	cout => \U1|LessThan2~53_cout\);

-- Location: LCCOMB_X89_Y12_N22
\U1|LessThan2~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~55_cout\ = CARRY((\U1|current_temp\(27)) # (!\U1|LessThan2~53_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(27),
	datad => VCC,
	cin => \U1|LessThan2~53_cout\,
	cout => \U1|LessThan2~55_cout\);

-- Location: LCCOMB_X89_Y12_N24
\U1|LessThan2~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~57_cout\ = CARRY((!\U1|current_temp\(28) & !\U1|LessThan2~55_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(28),
	datad => VCC,
	cin => \U1|LessThan2~55_cout\,
	cout => \U1|LessThan2~57_cout\);

-- Location: LCCOMB_X89_Y12_N26
\U1|LessThan2~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~59_cout\ = CARRY((\U1|current_temp\(29)) # (!\U1|LessThan2~57_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|current_temp\(29),
	datad => VCC,
	cin => \U1|LessThan2~57_cout\,
	cout => \U1|LessThan2~59_cout\);

-- Location: LCCOMB_X89_Y12_N28
\U1|LessThan2~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~61_cout\ = CARRY((!\U1|current_temp\(30) & !\U1|LessThan2~59_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(30),
	datad => VCC,
	cin => \U1|LessThan2~59_cout\,
	cout => \U1|LessThan2~61_cout\);

-- Location: LCCOMB_X89_Y12_N30
\U1|LessThan2~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|LessThan2~62_combout\ = (\U3|tf\(31) & ((\U1|LessThan2~61_cout\) # (\U1|current_temp\(31)))) # (!\U3|tf\(31) & (\U1|LessThan2~61_cout\ & \U1|current_temp\(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U3|tf\(31),
	datad => \U1|current_temp\(31),
	cin => \U1|LessThan2~61_cout\,
	combout => \U1|LessThan2~62_combout\);

-- Location: LCCOMB_X88_Y12_N16
\U1|heating~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U1|heating~0_combout\ = (\U1|LessThan2~62_combout\ & ((\U1|heating~q\) # (!\U1|LessThan3~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|LessThan2~62_combout\,
	datac => \U1|heating~q\,
	datad => \U1|LessThan3~62_combout\,
	combout => \U1|heating~0_combout\);

-- Location: FF_X88_Y12_N17
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

-- Location: FF_X88_Y15_N15
\U3|current_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|current_temp\(7),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(7));

-- Location: FF_X88_Y15_N7
\U3|target_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(7),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(7));

-- Location: FF_X88_Y15_N11
\U3|target_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(6),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(6));

-- Location: FF_X88_Y15_N13
\U3|current_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|current_temp\(6),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(6));

-- Location: FF_X88_Y15_N5
\U3|target_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(5),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(5));

-- Location: FF_X88_Y15_N3
\U3|current_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|current_temp\(5),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(5));

-- Location: LCCOMB_X88_Y15_N30
\U3|current_temp[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|current_temp[4]~0_combout\ = !\U1|current_temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|current_temp\(4),
	combout => \U3|current_temp[4]~0_combout\);

-- Location: FF_X88_Y15_N31
\U3|current_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|current_temp[4]~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(4));

-- Location: FF_X88_Y15_N9
\U3|target_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(4),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(4));

-- Location: FF_X89_Y15_N5
\U3|target_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(3),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(3));

-- Location: FF_X88_Y13_N1
\U3|current_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|current_temp\(3),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(3));

-- Location: FF_X89_Y15_N3
\U3|target_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(2),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(2));

-- Location: LCCOMB_X88_Y15_N28
\U3|current_temp[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|current_temp[2]~1_combout\ = !\U1|current_temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U1|current_temp\(2),
	combout => \U3|current_temp[2]~1_combout\);

-- Location: FF_X88_Y15_N29
\U3|current_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|current_temp[2]~1_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(2));

-- Location: LCCOMB_X91_Y15_N30
\U3|current_temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|current_temp[1]~feeder_combout\ = \U1|current_temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|current_temp\(1),
	combout => \U3|current_temp[1]~feeder_combout\);

-- Location: FF_X91_Y15_N31
\U3|current_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|current_temp[1]~feeder_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(1));

-- Location: LCCOMB_X89_Y15_N24
\U3|target_temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|target_temp[1]~feeder_combout\ = \U2|temp_val\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|temp_val\(1),
	combout => \U3|target_temp[1]~feeder_combout\);

-- Location: FF_X89_Y15_N25
\U3|target_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|target_temp[1]~feeder_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(1));

-- Location: FF_X88_Y15_N23
\U3|target_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U2|temp_val\(0),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|target_temp\(0));

-- Location: FF_X88_Y15_N1
\U3|current_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \U1|current_temp\(0),
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|current_temp\(0));

-- Location: LCCOMB_X88_Y15_N0
\U3|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~1_cout\ = CARRY((\U3|target_temp\(0) & !\U3|current_temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|target_temp\(0),
	datab => \U3|current_temp\(0),
	datad => VCC,
	cout => \U3|LessThan0~1_cout\);

-- Location: LCCOMB_X88_Y15_N2
\U3|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~3_cout\ = CARRY((\U3|current_temp\(1) & ((!\U3|LessThan0~1_cout\) # (!\U3|target_temp\(1)))) # (!\U3|current_temp\(1) & (!\U3|target_temp\(1) & !\U3|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|current_temp\(1),
	datab => \U3|target_temp\(1),
	datad => VCC,
	cin => \U3|LessThan0~1_cout\,
	cout => \U3|LessThan0~3_cout\);

-- Location: LCCOMB_X88_Y15_N4
\U3|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~5_cout\ = CARRY((\U3|target_temp\(2) & ((!\U3|LessThan0~3_cout\) # (!\U3|current_temp\(2)))) # (!\U3|target_temp\(2) & (!\U3|current_temp\(2) & !\U3|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|target_temp\(2),
	datab => \U3|current_temp\(2),
	datad => VCC,
	cin => \U3|LessThan0~3_cout\,
	cout => \U3|LessThan0~5_cout\);

-- Location: LCCOMB_X88_Y15_N6
\U3|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~7_cout\ = CARRY((\U3|target_temp\(3) & (\U3|current_temp\(3) & !\U3|LessThan0~5_cout\)) # (!\U3|target_temp\(3) & ((\U3|current_temp\(3)) # (!\U3|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|target_temp\(3),
	datab => \U3|current_temp\(3),
	datad => VCC,
	cin => \U3|LessThan0~5_cout\,
	cout => \U3|LessThan0~7_cout\);

-- Location: LCCOMB_X88_Y15_N8
\U3|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~9_cout\ = CARRY((\U3|current_temp\(4) & (\U3|target_temp\(4) & !\U3|LessThan0~7_cout\)) # (!\U3|current_temp\(4) & ((\U3|target_temp\(4)) # (!\U3|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|current_temp\(4),
	datab => \U3|target_temp\(4),
	datad => VCC,
	cin => \U3|LessThan0~7_cout\,
	cout => \U3|LessThan0~9_cout\);

-- Location: LCCOMB_X88_Y15_N10
\U3|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~11_cout\ = CARRY((\U3|target_temp\(5) & (\U3|current_temp\(5) & !\U3|LessThan0~9_cout\)) # (!\U3|target_temp\(5) & ((\U3|current_temp\(5)) # (!\U3|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|target_temp\(5),
	datab => \U3|current_temp\(5),
	datad => VCC,
	cin => \U3|LessThan0~9_cout\,
	cout => \U3|LessThan0~11_cout\);

-- Location: LCCOMB_X88_Y15_N12
\U3|LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~13_cout\ = CARRY((\U3|target_temp\(6) & ((!\U3|LessThan0~11_cout\) # (!\U3|current_temp\(6)))) # (!\U3|target_temp\(6) & (!\U3|current_temp\(6) & !\U3|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|target_temp\(6),
	datab => \U3|current_temp\(6),
	datad => VCC,
	cin => \U3|LessThan0~11_cout\,
	cout => \U3|LessThan0~13_cout\);

-- Location: LCCOMB_X88_Y15_N14
\U3|LessThan0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|LessThan0~14_combout\ = (\U3|current_temp\(7) & (\U3|LessThan0~13_cout\ & \U3|target_temp\(7))) # (!\U3|current_temp\(7) & ((\U3|LessThan0~13_cout\) # (\U3|target_temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U3|current_temp\(7),
	datad => \U3|target_temp\(7),
	cin => \U3|LessThan0~13_cout\,
	combout => \U3|LessThan0~14_combout\);

-- Location: LCCOMB_X88_Y15_N16
\U3|heater_on~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|heater_on~0_combout\ = (\U3|LessThan0~14_combout\ & !\U3|process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U3|LessThan0~14_combout\,
	datad => \U3|process_0~0_combout\,
	combout => \U3|heater_on~0_combout\);

-- Location: FF_X88_Y15_N17
\U3|heater_on\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|heater_on~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U3|state.COOKING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|heater_on~q\);

-- Location: LCCOMB_X88_Y15_N22
\heater_on~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \heater_on~0_combout\ = (\U1|heating~q\) # (\U3|heater_on~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|heating~q\,
	datad => \U3|heater_on~q\,
	combout => \heater_on~0_combout\);

-- Location: LCCOMB_X86_Y15_N2
\U3|done_signal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U3|done_signal~0_combout\ = !\keys_debouncer|start_stop_out~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keys_debouncer|start_stop_out~combout\,
	combout => \U3|done_signal~0_combout\);

-- Location: FF_X86_Y15_N3
\U3|done_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \U3|done_signal~0_combout\,
	clrn => \keys_debouncer|ALT_INV_reset_out~combout\,
	ena => \U3|state.DONE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|done_signal~q\);

-- Location: LCCOMB_X92_Y53_N20
\HEX0_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~0_combout\ = (!\U2|temp_val\(3) & (!\U2|temp_val\(1) & (\U2|temp_val\(2) $ (\U2|temp_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X92_Y53_N18
\HEX0_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~1_combout\ = (!\U2|temp_val\(3) & (\U2|temp_val\(2) & (\U2|temp_val\(1) $ (\U2|temp_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X92_Y53_N28
\HEX0_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|Equal9~0_combout\ = (!\U2|temp_val\(3) & (!\U2|temp_val\(2) & (\U2|temp_val\(1) & !\U2|temp_val\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|Equal9~0_combout\);

-- Location: LCCOMB_X92_Y53_N10
\HEX0_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~2_combout\ = (!\U2|temp_val\(3) & ((\U2|temp_val\(2) & (\U2|temp_val\(1) $ (!\U2|temp_val\(0)))) # (!\U2|temp_val\(2) & (!\U2|temp_val\(1) & \U2|temp_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X92_Y53_N0
\HEX0_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~3_combout\ = (\U2|temp_val\(1) & (!\U2|temp_val\(3) & ((\U2|temp_val\(0))))) # (!\U2|temp_val\(1) & ((\U2|temp_val\(2) & (!\U2|temp_val\(3))) # (!\U2|temp_val\(2) & ((\U2|temp_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X92_Y53_N26
\HEX0_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~4_combout\ = (!\U2|temp_val\(3) & ((\U2|temp_val\(2) & (\U2|temp_val\(1) & \U2|temp_val\(0))) # (!\U2|temp_val\(2) & ((\U2|temp_val\(1)) # (\U2|temp_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X92_Y53_N12
\HEX0_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX0_inst|decOut_n~5_combout\ = (\U2|temp_val\(2) & ((\U2|temp_val\(3)) # ((\U2|temp_val\(1) & \U2|temp_val\(0))))) # (!\U2|temp_val\(2) & (\U2|temp_val\(3) $ ((!\U2|temp_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(3),
	datab => \U2|temp_val\(2),
	datac => \U2|temp_val\(1),
	datad => \U2|temp_val\(0),
	combout => \HEX0_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X90_Y15_N24
\HEX1_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~0_combout\ = (!\U2|temp_val\(7) & (!\U2|temp_val\(5) & (\U2|temp_val\(6) $ (\U2|temp_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X90_Y15_N26
\HEX1_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~1_combout\ = (!\U2|temp_val\(7) & (\U2|temp_val\(6) & (\U2|temp_val\(5) $ (\U2|temp_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X91_Y13_N0
\HEX1_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|Equal9~0_combout\ = (\U2|temp_val\(5) & (!\U2|temp_val\(6) & (!\U2|temp_val\(7) & !\U2|temp_val\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(5),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(7),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|Equal9~0_combout\);

-- Location: LCCOMB_X90_Y15_N20
\HEX1_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~2_combout\ = (!\U2|temp_val\(7) & ((\U2|temp_val\(6) & (\U2|temp_val\(5) $ (!\U2|temp_val\(4)))) # (!\U2|temp_val\(6) & (!\U2|temp_val\(5) & \U2|temp_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X90_Y15_N22
\HEX1_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~3_combout\ = (\U2|temp_val\(5) & (!\U2|temp_val\(7) & ((\U2|temp_val\(4))))) # (!\U2|temp_val\(5) & ((\U2|temp_val\(6) & (!\U2|temp_val\(7))) # (!\U2|temp_val\(6) & ((\U2|temp_val\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X90_Y15_N0
\HEX1_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~4_combout\ = (!\U2|temp_val\(7) & ((\U2|temp_val\(6) & (\U2|temp_val\(5) & \U2|temp_val\(4))) # (!\U2|temp_val\(6) & ((\U2|temp_val\(5)) # (\U2|temp_val\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X90_Y15_N30
\HEX1_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX1_inst|decOut_n~5_combout\ = (\U2|temp_val\(6) & ((\U2|temp_val\(7)) # ((\U2|temp_val\(5) & \U2|temp_val\(4))))) # (!\U2|temp_val\(6) & (\U2|temp_val\(7) $ ((!\U2|temp_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|temp_val\(7),
	datab => \U2|temp_val\(6),
	datac => \U2|temp_val\(5),
	datad => \U2|temp_val\(4),
	combout => \HEX1_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X98_Y15_N24
\HEX2_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~0_combout\ = (!\U2|td_val\(3) & (!\U2|td_val\(1) & (\U2|td_val\(0) $ (\U2|td_val\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X98_Y15_N14
\HEX2_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~1_combout\ = (\U2|td_val\(2) & (!\U2|td_val\(3) & (\U2|td_val\(0) $ (\U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X98_Y15_N8
\HEX2_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|Equal9~0_combout\ = (!\U2|td_val\(0) & (!\U2|td_val\(2) & (!\U2|td_val\(3) & \U2|td_val\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|Equal9~0_combout\);

-- Location: LCCOMB_X98_Y15_N18
\HEX2_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~2_combout\ = (!\U2|td_val\(3) & ((\U2|td_val\(0) & (\U2|td_val\(2) $ (!\U2|td_val\(1)))) # (!\U2|td_val\(0) & (\U2|td_val\(2) & !\U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X98_Y15_N16
\HEX2_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~3_combout\ = (\U2|td_val\(1) & (\U2|td_val\(0) & ((!\U2|td_val\(3))))) # (!\U2|td_val\(1) & ((\U2|td_val\(2) & ((!\U2|td_val\(3)))) # (!\U2|td_val\(2) & (\U2|td_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X98_Y15_N10
\HEX2_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~4_combout\ = (!\U2|td_val\(3) & ((\U2|td_val\(0) & ((\U2|td_val\(1)) # (!\U2|td_val\(2)))) # (!\U2|td_val\(0) & (!\U2|td_val\(2) & \U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X98_Y15_N0
\HEX2_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX2_inst|decOut_n~5_combout\ = (\U2|td_val\(2) & ((\U2|td_val\(3)) # ((\U2|td_val\(0) & \U2|td_val\(1))))) # (!\U2|td_val\(2) & ((\U2|td_val\(3) $ (!\U2|td_val\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(0),
	datab => \U2|td_val\(2),
	datac => \U2|td_val\(3),
	datad => \U2|td_val\(1),
	combout => \HEX2_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X92_Y15_N4
\HEX3_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~0_combout\ = (!\U2|td_val\(5) & (!\U2|td_val\(7) & (\U2|td_val\(6) $ (\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X92_Y15_N2
\HEX3_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~1_combout\ = (\U2|td_val\(6) & (!\U2|td_val\(7) & (\U2|td_val\(5) $ (\U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(5),
	datab => \U2|td_val\(6),
	datac => \U2|td_val\(7),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X98_Y12_N24
\HEX3_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|Equal9~0_combout\ = (!\U2|td_val\(7) & (\U2|td_val\(5) & (!\U2|td_val\(6) & !\U2|td_val\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \U2|td_val\(5),
	datac => \U2|td_val\(6),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|Equal9~0_combout\);

-- Location: LCCOMB_X98_Y12_N26
\HEX3_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~2_combout\ = (!\U2|td_val\(7) & ((\U2|td_val\(5) & (\U2|td_val\(6) & \U2|td_val\(4))) # (!\U2|td_val\(5) & (\U2|td_val\(6) $ (\U2|td_val\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \U2|td_val\(5),
	datac => \U2|td_val\(6),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X98_Y12_N8
\HEX3_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~3_combout\ = (\U2|td_val\(5) & (!\U2|td_val\(7) & ((\U2|td_val\(4))))) # (!\U2|td_val\(5) & ((\U2|td_val\(6) & (!\U2|td_val\(7))) # (!\U2|td_val\(6) & ((\U2|td_val\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \U2|td_val\(5),
	datac => \U2|td_val\(6),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X98_Y12_N30
\HEX3_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~4_combout\ = (!\U2|td_val\(7) & ((\U2|td_val\(5) & ((\U2|td_val\(4)) # (!\U2|td_val\(6)))) # (!\U2|td_val\(5) & (!\U2|td_val\(6) & \U2|td_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \U2|td_val\(5),
	datac => \U2|td_val\(6),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X98_Y12_N4
\HEX3_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX3_inst|decOut_n~5_combout\ = (\U2|td_val\(5) & ((\U2|td_val\(7)) # ((\U2|td_val\(6) & \U2|td_val\(4))))) # (!\U2|td_val\(5) & (\U2|td_val\(7) $ ((!\U2|td_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|td_val\(7),
	datab => \U2|td_val\(5),
	datac => \U2|td_val\(6),
	datad => \U2|td_val\(4),
	combout => \HEX3_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X89_Y15_N0
\HEX4_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~0_combout\ = (!\U2|tf_val\(3) & (!\U2|tf_val\(1) & (\U2|tf_val\(2) $ (\U2|tf_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(2),
	datab => \U2|tf_val\(3),
	datac => \U2|tf_val\(0),
	datad => \U2|tf_val\(1),
	combout => \HEX4_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X86_Y14_N12
\HEX4_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~1_combout\ = (\U2|tf_val\(2) & (!\U2|tf_val\(3) & (\U2|tf_val\(1) $ (\U2|tf_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X86_Y14_N2
\HEX4_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|Equal9~0_combout\ = (\U2|tf_val\(1) & (!\U2|tf_val\(2) & (!\U2|tf_val\(3) & !\U2|tf_val\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|Equal9~0_combout\);

-- Location: LCCOMB_X86_Y14_N0
\HEX4_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~2_combout\ = (!\U2|tf_val\(3) & ((\U2|tf_val\(1) & (\U2|tf_val\(2) & \U2|tf_val\(0))) # (!\U2|tf_val\(1) & (\U2|tf_val\(2) $ (\U2|tf_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X86_Y14_N22
\HEX4_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~3_combout\ = (\U2|tf_val\(1) & (((!\U2|tf_val\(3) & \U2|tf_val\(0))))) # (!\U2|tf_val\(1) & ((\U2|tf_val\(2) & (!\U2|tf_val\(3))) # (!\U2|tf_val\(2) & ((\U2|tf_val\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X86_Y14_N20
\HEX4_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~4_combout\ = (!\U2|tf_val\(3) & ((\U2|tf_val\(1) & ((\U2|tf_val\(0)) # (!\U2|tf_val\(2)))) # (!\U2|tf_val\(1) & (!\U2|tf_val\(2) & \U2|tf_val\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X86_Y14_N6
\HEX4_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX4_inst|decOut_n~5_combout\ = (\U2|tf_val\(1) & ((\U2|tf_val\(3)) # ((\U2|tf_val\(2) & \U2|tf_val\(0))))) # (!\U2|tf_val\(1) & (\U2|tf_val\(2) $ ((!\U2|tf_val\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(1),
	datab => \U2|tf_val\(2),
	datac => \U2|tf_val\(3),
	datad => \U2|tf_val\(0),
	combout => \HEX4_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X87_Y14_N20
\HEX5_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~0_combout\ = (!\U2|tf_val\(7) & (!\U2|tf_val\(5) & (\U2|tf_val\(4) $ (\U2|tf_val\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X87_Y14_N30
\HEX5_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~1_combout\ = (!\U2|tf_val\(7) & (\U2|tf_val\(6) & (\U2|tf_val\(4) $ (\U2|tf_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X89_Y15_N30
\HEX5_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|Equal9~0_combout\ = (!\U2|tf_val\(4) & (!\U2|tf_val\(6) & (!\U2|tf_val\(7) & \U2|tf_val\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(6),
	datac => \U2|tf_val\(7),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|Equal9~0_combout\);

-- Location: LCCOMB_X87_Y14_N28
\HEX5_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~2_combout\ = (!\U2|tf_val\(7) & ((\U2|tf_val\(4) & (\U2|tf_val\(6) $ (!\U2|tf_val\(5)))) # (!\U2|tf_val\(4) & (\U2|tf_val\(6) & !\U2|tf_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X87_Y14_N14
\HEX5_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~3_combout\ = (\U2|tf_val\(5) & (\U2|tf_val\(4) & (!\U2|tf_val\(7)))) # (!\U2|tf_val\(5) & ((\U2|tf_val\(6) & ((!\U2|tf_val\(7)))) # (!\U2|tf_val\(6) & (\U2|tf_val\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X87_Y14_N8
\HEX5_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~4_combout\ = (!\U2|tf_val\(7) & ((\U2|tf_val\(4) & ((\U2|tf_val\(5)) # (!\U2|tf_val\(6)))) # (!\U2|tf_val\(4) & (!\U2|tf_val\(6) & \U2|tf_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X87_Y14_N26
\HEX5_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX5_inst|decOut_n~5_combout\ = (\U2|tf_val\(6) & ((\U2|tf_val\(7)) # ((\U2|tf_val\(4) & \U2|tf_val\(5))))) # (!\U2|tf_val\(6) & ((\U2|tf_val\(7) $ (!\U2|tf_val\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|tf_val\(4),
	datab => \U2|tf_val\(7),
	datac => \U2|tf_val\(6),
	datad => \U2|tf_val\(5),
	combout => \HEX5_inst|decOut_n~5_combout\);

-- Location: LCCOMB_X88_Y12_N2
\HEX6_inst|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~0_combout\ = (!\U1|current_temp\(1) & (!\U1|current_temp\(3) & (\U1|current_temp\(0) $ (!\U1|current_temp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~0_combout\);

-- Location: LCCOMB_X88_Y12_N4
\HEX6_inst|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~1_combout\ = (!\U1|current_temp\(2) & (!\U1|current_temp\(3) & (\U1|current_temp\(0) $ (\U1|current_temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~1_combout\);

-- Location: LCCOMB_X88_Y12_N14
\HEX6_inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|Equal9~0_combout\ = (!\U1|current_temp\(0) & (\U1|current_temp\(2) & (\U1|current_temp\(1) & !\U1|current_temp\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|Equal9~0_combout\);

-- Location: LCCOMB_X88_Y12_N12
\HEX6_inst|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~2_combout\ = (!\U1|current_temp\(3) & ((\U1|current_temp\(0) & (\U1|current_temp\(2) $ (\U1|current_temp\(1)))) # (!\U1|current_temp\(0) & (!\U1|current_temp\(2) & !\U1|current_temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~2_combout\);

-- Location: LCCOMB_X88_Y12_N10
\HEX6_inst|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~3_combout\ = (\U1|current_temp\(1) & (\U1|current_temp\(0) & ((!\U1|current_temp\(3))))) # (!\U1|current_temp\(1) & ((\U1|current_temp\(2) & (\U1|current_temp\(0))) # (!\U1|current_temp\(2) & ((!\U1|current_temp\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~3_combout\);

-- Location: LCCOMB_X88_Y12_N24
\HEX6_inst|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~4_combout\ = (!\U1|current_temp\(3) & ((\U1|current_temp\(0) & ((\U1|current_temp\(2)) # (\U1|current_temp\(1)))) # (!\U1|current_temp\(0) & (\U1|current_temp\(2) & \U1|current_temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~4_combout\);

-- Location: LCCOMB_X88_Y12_N22
\HEX6_inst|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX6_inst|decOut_n~5_combout\ = (\U1|current_temp\(2) & ((\U1|current_temp\(1) $ (!\U1|current_temp\(3))))) # (!\U1|current_temp\(2) & ((\U1|current_temp\(3)) # ((\U1|current_temp\(0) & \U1|current_temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|current_temp\(0),
	datab => \U1|current_temp\(2),
	datac => \U1|current_temp\(1),
	datad => \U1|current_temp\(3),
	combout => \HEX6_inst|decOut_n~5_combout\);

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


