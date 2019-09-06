-- Entity that transforms a 4-array into a BCD number to 7 segment display
library ieee;
use ieee.std_logic_1164.all;

entity bcd_7seg is	  
    port (
        data_in:    in  std_logic_vector(3 downto 0);
        data_out:   out std_logic_vector(7 downto 0)
  );
end entity bcd_7seg;
 
architecture arch of bcd_7seg is
begin
    process (data_in) is
    begin
        case data_in is
            when "0000" => data_out <= "01111110";	-- 0x7E (Number 0)
            when "0001" => data_out <= "00110000";	-- 0x30 (Number 1)
            when "0010" => data_out <= "01101101";	-- 0x6D (Number 2)
            when "0011" => data_out <= "01111001";	-- 0x79 (Number 3)
            when "0100" => data_out <= "00110011";	-- 0x33 (Number 4)
            when "0101" => data_out <= "01011011";	-- 0x5B (Number 5)
            when "0110" => data_out <= "01011111";	-- 0x5F (Number 6)
            when "0111" => data_out <= "01110000";	-- 0x70 (Number 7)
            when "1000" => data_out <= "01111111";	-- 0x7F (Number 8)
            when "1001" => data_out <= "01111011";	-- 0x7B (Number 9)
            when "1010" => data_out <= "01110111";	-- 0x77 (Number A)
            when "1011" => data_out <= "00011111";	-- 0x1F (Number B)
            when "1100" => data_out <= "01001110";	-- 0x4E (Number C)
            when "1101" => data_out <= "00111101";	-- 0x3D (Number D)
            when "1110" => data_out <= "01001111";	-- 0x4F (Number E)
            when others => data_out <= "01000111";	-- 0x47 (Number F)
        end case;
    end process;
 
end architecture arch;