library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity counter_0_4 is
port (
        clk : in std_logic;
        rst : in std_logic;
        count : out std_logic_vector(3 downto 0)
    );
	 
end counter_0_4;

architecture Behavioral of counter_0_4 is
    signal count_int : std_logic_vector(3 downto 0);
begin
process(clk, rst)
begin
    if rst = '1' then
        count_int <= "0000";
    elsif rising_edge(clk) then
        if count_int = "0100" then
            count_int <= "0000";
        else
            count_int <= std_logic_vector(unsigned(count_int) + 1);
        end if;
    end if;
end process;

count <= count_int;

end Behavioral;

