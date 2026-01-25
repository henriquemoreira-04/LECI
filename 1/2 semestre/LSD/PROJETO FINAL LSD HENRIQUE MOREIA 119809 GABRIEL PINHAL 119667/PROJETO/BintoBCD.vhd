library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinToBCD is
    Port (
        bin       : in  std_logic_vector(7 downto 0);
        bcd_ones  : out std_logic_vector(3 downto 0);
        bcd_tens  : out std_logic_vector(3 downto 0);
        bcd_hundreds : out std_logic_vector(3 downto 0)
    );
end BinToBCD;

architecture Behavioral of BinToBCD is
begin
    process(bin)
        variable bcd : std_logic_vector(11 downto 0) := (others => '0');
        variable i : integer;
    begin
        bcd := "000000000000";
        for i in 7 downto 0 loop
            if bcd(11 downto 8) > "0100" then
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
            end if;
            if bcd(7 downto 4) > "0100" then
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
            end if;
            if bcd(3 downto 0) > "0100" then
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
            end if;
            bcd := bcd(10 downto 0) & bin(i);
        end loop;
        bcd_ones <= bcd(3 downto 0);
        bcd_tens <= bcd(7 downto 4);
        bcd_hundreds <= bcd(11 downto 8);
    end process;
end Behavioral;

