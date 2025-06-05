library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timer is
port(clk,reset,dir : in std_logic;
     s : in std_logic_vector(5 downto 0);
	  o1,o2 : out std_logic_vector(3 downto 0)
);
end timer;

architecture Behavioral of timer is

signal timer : integer range 0 to 49999999;
signal pace : integer range 0 to 63;
signal clkw,invclk : integer;

begin

process(clk,reset)
begin
if rising_edge(clk) then
   if timer < 49999999 then 
	    timer <= timer + 1;
	 if pace = to_integer(unsigned(s)) then	
		  if dir = '1' then
		     invclk <= invclk + 1;
			  if invclk > 3 then 
			     invclk <= 0;
			  end if;
		  else
		     clkw <= clkw + 1;
			  if clkw > 3 then 
			      clkw <= 0;
			  end if;
		  end if;
	 else
	   pace <= pace + 1;
	 end if;
	else 
	   timer <= 0;
	end if;
elsif reset = '1' then
    pace <= 0;
	 timer <= 0;
end if;
end process;

with clkw select 
o1 <= "0110" when 0,
		 "1010" when 1,
		 "1001" when 2,
		 "0101" when others;

with invclk select
o2 <= "0110" when  0 ,
		"0101" when  1 ,
		"1001" when  2 ,
		"1010" when others;

end Behavioral;

