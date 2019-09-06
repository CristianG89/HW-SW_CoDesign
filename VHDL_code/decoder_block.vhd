-- Block of Interf_7Seg, Control_7Seg and Bin_To_BCD
library ieee;
use ieee.std_logic_1164.all;

entity decoder_block is			
    port (
            clk:    in  std_logic;
            reset:  in  std_logic;
            full_buf : in  std_logic;
            data_in: in  std_logic_vector(7 downto 0);
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
	);
end entity decoder_block;

architecture arch of decoder_block is
    component Interf_7Seg is
            port (
                clk: in  std_logic;
                reset: in std_logic;
                buffer_full:in std_logic;
                data_in: in  std_logic_vector(7 downto 0);
                data_out: out std_logic_vector(7 downto 0)
            );
    end component Interf_7Seg;
	
    component decoder7seg is
        port (
                encoded_input:  in  std_logic_vector(7 downto 0);
                Out_7Seg_LSB: out std_logic_vector(7 downto 0);
                Out_7Seg_MSB: out std_logic_vector(7 downto 0)
            );
    end component decoder7seg;
	
    signal iEncodedData: std_logic_vector(7 downto 0);
    
begin
        g7: Interf_7Seg port map (clk, reset, full_buf, data_in, iEncodedData);
        g8: decoder7seg port map ( iEncodedData, Out_7Seg_LSB, Out_7Seg_MSB);
		
end architecture arch;
