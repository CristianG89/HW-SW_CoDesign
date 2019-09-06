-- It separates the input of 8 bits in a 2 independent BCD numbers
-- each for 7 segment display
library ieee;
use ieee.std_logic_1164.all;
 
entity decoder7seg is	
  port (
    encoded_input: 	  in  std_logic_vector(7 downto 0);
	Out_7Seg_LSB: out std_logic_vector(7 downto 0);
	Out_7Seg_MSB: out std_logic_vector(7 downto 0)
  );
end entity decoder7seg;
 
architecture arch of decoder7seg is 
	component bcd_7seg
		port (
			data_in: 	in  std_logic_vector(3 downto 0);
			data_out:	out std_logic_vector(7 downto 0)
		);
	end component bcd_7seg;
	
	signal in_LSB, in_MSB: std_logic_vector(3 downto 0);
	signal out_LSB, out_MSB: std_logic_vector(7 downto 0);
			
	begin
	  in_LSB <= encoded_input(3 downto 0);
	  in_MSB <= encoded_input(7 downto 4);
	  
	  g5: bcd_7seg port map (in_LSB, out_LSB);
	  g6: bcd_7seg port map (in_MSB, out_MSB);
	  
	  Out_7Seg_LSB <= out_LSB;
	  Out_7Seg_MSB <= out_MSB;
 
end architecture arch;
