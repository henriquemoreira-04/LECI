library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SR_Latch_Demo is
	port(SW : in  std_logic_vector(1 downto 0);
		LEDR : inout std_logic_vector(1 downto 0));
end SR_Latch_Demo;

architecture Shell of SR_Latch_Demo is
begin
	SR_L : entity work.SR_Latch(Behavioral)
	
	port map(S => SW(0),
				R => SW(1),
				Q => LEDR(0),
			  QN => LEDR(1));
end Shell; 