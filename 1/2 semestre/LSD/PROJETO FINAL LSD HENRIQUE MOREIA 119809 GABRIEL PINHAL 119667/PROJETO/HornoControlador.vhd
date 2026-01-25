library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HornoControlador is
    port (
        CLOCK_50  : in  std_logic;
        KEY       : in  std_logic_vector(3 downto 0);
        SW        : in  std_logic_vector(2 downto 0);
        
        LEDR      : out std_logic_vector(0 downto 0);
        LEDG      : out std_logic_vector(2 downto 0);
        
        HEX0      : out std_logic_vector(6 downto 0);
        HEX1      : out std_logic_vector(6 downto 0);
        HEX2      : out std_logic_vector(6 downto 0);
        HEX3      : out std_logic_vector(6 downto 0);
        HEX4      : out std_logic_vector(6 downto 0);
        HEX5      : out std_logic_vector(6 downto 0);
        HEX6      : out std_logic_vector(6 downto 0)
    );
end HornoControlador;

architecture Behavioral of HornoControlador is

    
    signal s_reset        : std_logic := '0';
    signal s_start        : std_logic;
    signal s_key_inc      : std_logic;
    signal s_key_dec      : std_logic;
    
    
    signal temp_set, td_set, tf_set, temp : std_logic_vector(7 downto 0);
    signal heater_on_temp : std_logic;
    signal heater_on_auto : std_logic;
    signal done_internal  : std_logic;
    signal heater_on      : std_logic;
    signal done           : std_logic;
   
    
    signal bcd_temp_ones, bcd_temp_tens : std_logic_vector(3 downto 0);
    signal bcd_td_ones, bcd_td_tens : std_logic_vector(3 downto 0);
    signal bcd_tf_ones, bcd_tf_tens : std_logic_vector(3 downto 0);
    signal bcd_current_temp_ones, bcd_current_temp_tens, bcd_current_temp_hundreds : std_logic_vector(3 downto 0);

begin
    
    keys_debouncer : entity work.Debouncers port map (
        clock => CLOCK_50,
        
        reset_btn       => KEY(3),
        start_stop_btn  => KEY(0),
        time_adjust_btn => KEY(1),
        key_dec         => KEY(2),
        
        reset_out       => s_reset,
        start_stop_out  => s_start,
        time_adjust_out => s_key_inc,
        key_dec_out     => s_key_dec
    );
    
    
    U1: entity work.ControladorTemperatura port map (
        clk => CLOCK_50,
        reset => s_reset,
        set_temp => temp_set,
        temp => temp,
        heater_on => heater_on_temp
    );

    
    U2: entity work.AjusteParametros port map (
        clk => CLOCK_50,
        reset => s_reset,
        key_inc => s_key_inc,
        key_dec => s_key_dec,
        sw1 => SW(1),
        sw2 => SW(2),
        temp_set => temp_set,
        td_set => td_set,
        tf_set => tf_set
    );

    
    U3: entity work.ControlAutomatico port map (
        clk => CLOCK_50,
        reset => s_reset,
        start => s_start,
        td_set => td_set,
        tf_set => tf_set,
        temp_set => temp_set,
        temp => temp,
        heater_on => heater_on_auto,
        done_flag => done_internal,
        led_alert => LEDR(0)
    );

    
    heater_on <= heater_on_temp or heater_on_auto;
    done <= done_internal;

    
    bin_to_bcd_temp : entity work.BinToBCD port map (
        bin => temp_set,
        bcd_ones => bcd_temp_ones,
        bcd_tens => bcd_temp_tens,
        bcd_hundreds => open 
    );

    bin_to_bcd_td : entity work.BinToBCD port map (
        bin => td_set,
        bcd_ones => bcd_td_ones,
        bcd_tens => bcd_td_tens,
        bcd_hundreds => open 
    );

    bin_to_bcd_tf : entity work.BinToBCD port map (
        bin => tf_set,
        bcd_ones => bcd_tf_ones,
        bcd_tens => bcd_tf_tens,
        bcd_hundreds => open 
    );

    bin_to_bcd_current_temp : entity work.BinToBCD port map (
        bin => temp,
        bcd_ones => bcd_current_temp_ones,
        bcd_tens => bcd_current_temp_tens,
        bcd_hundreds => bcd_current_temp_hundreds 
    );

    
    HEX0_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_temp_ones,
        enable => '1',
        decOut_n => HEX0
    );

    HEX1_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_temp_tens,
        enable => '1',
        decOut_n => HEX1
    );

    HEX2_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_td_ones,
        enable => '1',
        decOut_n => HEX2
    );

    HEX3_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_td_tens,
        enable => '1',
        decOut_n => HEX3
    );

    HEX4_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_tf_ones,
        enable => '1',
        decOut_n => HEX4
    );

    HEX5_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_tf_tens,
        enable => '1',
        decOut_n => HEX5
    );

    HEX6_inst : entity work.Bin7SegDecoder port map (
        binInput => bcd_current_temp_ones,
        enable => '1',
        decOut_n => HEX6
    );

   
    LEDG <= "000"; 

end Behavioral;
