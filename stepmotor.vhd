library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stepmotor is
port(reset,clock,dir : in std_logic;
     speed : in std_logic_vector(5 downto 0);
	  d,c,b,a : out std_logic
);
end stepmotor;

architecture Behavioral of stepmotor is

component timer is
port(clk,reset,dir : in std_logic;
     s : in std_logic_vector(5 downto 0);
	  o1,o2 : out std_logic_vector(3 downto 0)
);
end component;


signal temp1,temp2 : std_logic_vector(3 downto 0);

begin


bb1: timer PORT MAP(
		clk => clock,
		reset => reset,
		dir => dir,
		s => speed,
		o1 =>temp1 ,
		o2 => temp2
);

process(dir,temp1,temp2)
begin
if dir = '1' then 
a <= temp1(3);
b <= temp1(1);
c <= temp1(2);
d <= temp1(0);

else
a <= temp2(3);
b <= temp2(1);
c <= temp2(2);
d <= temp2(0);

end if;
end process;
end Behavioral;

