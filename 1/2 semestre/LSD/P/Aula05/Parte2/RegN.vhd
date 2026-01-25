library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY RegN IS
generic(n : positive := 8);
PORT(
dataIn : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0); 
dataOut : OUT STD_LOGIC_vector(n-1 downto 0); 
enable : IN STD_LOGIC; 
reset : IN STD_LOGIC; 
clk : IN STD_LOGIC);

END RegN;
ARCHITECTURE Behavioral OF RegN IS

BEGIN

 process(clk)
   begin
    if (rising_edge(clk)) then
      if (reset = '1') then 
        dataOut <= (others => '0');
        elsif (enable = '1') then
        dataOut <= dataIn;
      end if;
        end if;
   end process;
END Behavioral;