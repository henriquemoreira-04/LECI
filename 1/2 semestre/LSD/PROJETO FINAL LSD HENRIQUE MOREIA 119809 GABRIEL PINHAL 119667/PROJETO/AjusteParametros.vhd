library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AjusteParametros is
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        key_inc     : in  std_logic;
        key_dec     : in  std_logic;
        sw1         : in  std_logic;
        sw2         : in  std_logic;
        temp_set    : out std_logic_vector(7 downto 0);
        td_set      : out std_logic_vector(7 downto 0);
        tf_set      : out std_logic_vector(7 downto 0)
    );
end AjusteParametros;

architecture Behavioral of AjusteParametros is
    signal temp_val : integer := 0;
    signal td_val   : integer := 0;
    signal tf_val   : integer := 0;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            temp_val <= 0;
            td_val <= 0;
            tf_val <= 0;
        elsif rising_edge(clk) then
            if sw1 = '0' and sw2 = '0' then
                if key_inc = '1' then
                    temp_val <= temp_val + 1;
                elsif key_dec = '1' then
                    temp_val <= temp_val - 1;
                end if;
            elsif sw1 = '0' and sw2 = '1' then
                if key_inc = '1' then
                    td_val <= td_val + 1;
                elsif key_dec = '1' then
                    td_val <= td_val - 1;
                end if;
            elsif sw1 = '1' and sw2 = '0' then
                if key_inc = '1' then
                    tf_val <= tf_val + 1;
                elsif key_dec = '1' then
                    tf_val <= tf_val - 1;
                end if;
            end if;
        end if;
    end process;

    temp_set <= std_logic_vector(to_unsigned(temp_val, 8));
    td_set <= std_logic_vector(to_unsigned(td_val, 8));
    tf_set <= std_logic_vector(to_unsigned(tf_val, 8));
end Behavioral;
