library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.round;

entity pwm_gen_2 is
port( mode	: in std_logic;
		clk	: in std_logic;
		pwm_out : out std_logic);
end pwm_gen_2;

architecture Behavioral of pwm_gen_2 is
	signal counter : integer range 0 to 399999 := 0;
   signal clk_out_internal : STD_LOGIC := '0';
begin
process(clk)
    begin
	 if rising_edge(clk) then
		 if (mode = '1') then
			if (counter <= 26999) then
				clk_out_internal <= '1';
			else
				clk_out_internal <= '0';
			end if;
		else
			if (counter <= 9999) then
				clk_out_internal <= '1';
			else
				clk_out_internal <= '0';
			end if;
		end if;
		counter <= counter + 1;
	end if;
		pwm_out <= clk_out_internal;
    end process;

end Behavioral;

