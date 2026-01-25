library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlAutomatico is
    port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        start      : in  std_logic;
        td_set     : in  std_logic_vector(7 downto 0);
        tf_set     : in  std_logic_vector(7 downto 0);
        temp_set   : in  std_logic_vector(7 downto 0);
        temp       : in  std_logic_vector(7 downto 0);
        heater_on  : out std_logic;
        done_flag  : out std_logic;
        led_alert  : out std_logic
    );
end ControlAutomatico;

architecture Behavioral of ControlAutomatico is
    type state_type is (IDLE, COOKING, DONE);
    signal state : state_type := IDLE;
    signal timer : integer := 0;
    signal tf    : integer;
    signal td    : integer;
    signal target_temp : integer;
    signal current_temp : integer;
    signal done_signal : std_logic;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            timer <= 0;
            heater_on <= '0';
            done_signal <= '0';
            led_alert <= '0';
            target_temp <= 0;
            current_temp <= 0;
        elsif rising_edge(clk) then
            tf <= to_integer(unsigned(tf_set));
            td <= to_integer(unsigned(td_set));
            target_temp <= to_integer(unsigned(temp_set));
            current_temp <= to_integer(unsigned(temp));
            
            case state is
                when IDLE =>
                    if start = '1' then
                        state <= COOKING;
                        timer <= 0;
                    end if;
                when COOKING =>
                    if current_temp < target_temp then
                        heater_on <= '1';
                    else
                        heater_on <= '0';
                    end if;
                    
                    if timer = tf or timer >= td then
                        state <= DONE;
                        heater_on <= '0';
                    else
                        timer <= timer + 1;
                    end if;
                when DONE =>
                    done_signal <= '1';
                    led_alert <= '1';
                    if start = '0' then
                        state <= IDLE;
                        done_signal <= '0';
                        led_alert <= '0';
                    end if;
            end case;
        end if;
    end process;

    done_flag <= done_signal;
end Behavioral;
