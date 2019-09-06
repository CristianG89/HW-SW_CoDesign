library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- DATA is taken from the SPI RX block
entity Interf_7Seg is			
    port (
		clk:		in  std_logic;
		reset:		in	std_logic;
		buffer_full:in	std_logic;
		data_in:	in  std_logic_vector(7 downto 0);
		data_out:	out std_logic_vector(7 downto 0)
	);
end entity Interf_7Seg ;

architecture arch of Interf_7Seg  is
    type STATES is (READING, UPDATE);
    signal state_next, state_reg: STATES;
    signal data_next, data_reg: std_logic_vector(7 downto 0);
	
begin
    -- FSMD: state and data registers
    process (clk, reset)	
    begin
        if (reset = '1') then	
            state_reg <= READING;	
            data_reg <= "00000000";
        elsif (rising_edge(clk)) then
            state_reg <= state_next;	
            data_reg <= data_next; 
        end if;
    end process;

    -- control flow and data path
    process (state_reg, buffer_full, data_in, data_reg)	        
    begin
        state_next <= state_reg;	
        data_next <= "00000000";
		
        case state_reg is
            when READING =>
				data_next <= data_reg;
				if (buffer_full = '1') then
					state_next <= UPDATE;
                end if;
            when UPDATE =>
				data_next <= data_in;
				state_next <= READING;
        end case;
    end process;

    data_out <= data_reg;
end architecture arch;
