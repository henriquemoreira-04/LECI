library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AccN is
    generic ( n : positive := 8);
    port(
            dataIn : IN STD_LOGIC_VECTOR((n-1) DOWNTO 0); 
            dataOut : OUT STD_LOGIC_vector((n-1) downto 0); 
            enable : IN STD_LOGIC; 
            reset : IN STD_LOGIC; 
            clk : IN STD_LOGIC
            );
end AccN;

architecture Behavioral of AccN is
    signal s_regOut, s_adderOut : std_logic_vector((n-1) downto 0);
begin

    somador: entity work.AdderN(Behavioral)
                generic map(n => n)
                port map (operand0 => dataIN, operand1 => s_regOut, result => s_adderOut);

    registo: entity work.RegN(Behavioral)
                generic map(n => n)
                port map(reset => reset, clk => clk, enable => enable, 
                            dataIn => s_adderOut, dataOut => s_regOut);

    dataOut <= s_regOut;

end Behavioral;