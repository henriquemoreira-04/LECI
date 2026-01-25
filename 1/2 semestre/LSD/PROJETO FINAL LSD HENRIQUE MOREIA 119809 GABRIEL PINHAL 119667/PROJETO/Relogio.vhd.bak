library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Relogio is
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        adjust      : in  std_logic;
        adjust_time : in  std_logic_vector(7 downto 0);
        current_time: out std_logic_vector(7 downto 0)
    );
end Relogio;

architecture Behavioral of Relogio is
    signal time : integer := 0;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            time <= 0;
        elsif rising_edge(clk) then
            if adjust = '1' then
                time <= to_integer(unsigned(adjust_time));
            else
                time <= time + 1;
            end if;
        end if;
    end process;

    current_time <= std_logic_vector(to_unsigned(time, 8));
end Behavioral;
