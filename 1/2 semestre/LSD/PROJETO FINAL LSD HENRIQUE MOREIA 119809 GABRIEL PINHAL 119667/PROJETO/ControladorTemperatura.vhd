library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControladorTemperatura is
    port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        set_temp  : in  std_logic_vector(7 downto 0);
        temp      : out std_logic_vector(7 downto 0);
        heater_on : out std_logic
    );
end ControladorTemperatura;

architecture Behavioral of ControladorTemperatura is
    signal current_temp : integer := 20;
    signal target_temp  : integer;
    signal heating      : boolean := false;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            current_temp <= 20;
            heating <= false;
        elsif rising_edge(clk) then
            target_temp <= to_integer(unsigned(set_temp));
            if heating then
                if current_temp < target_temp + 2 then
                    current_temp <= current_temp + 1;
                end if;
            else
                if current_temp > target_temp - 2 then
                    current_temp <= current_temp - 1;
                end if;
            end if;

            if current_temp >= target_temp + 2 then
                heating <= false;
            elsif current_temp <= target_temp - 2 then
                heating <= true;
            end if;
        end if;
    end process;

    temp <= std_logic_vector(to_unsigned(current_temp, 8));
    heater_on <= '1' when heating else '0';
end Behavioral;
