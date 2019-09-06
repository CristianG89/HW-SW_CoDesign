-- clk generator for the SPI communication
-- clk by default 0
 
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_generator is
    port (  clk: in std_logic; 
            reset: in std_logic; 
            en: in std_logic;
            clk_out: out std_logic
         );
end entity clk_generator;

architecture arch of clk_generator is
    type STATES is (ONE, ZERO);
    signal state_next, state_reg: STATES; 
    signal clk_next, clk_reg: std_logic;
    signal count_next, count_reg: std_logic_vector (3 downto 0);
	signal MAX_COUNT: std_logic_vector(3 downto 0) := "1010"; --10
    --constant MAX_COUNT: integer := 10; 
begin

    -- FSMD: state and data registers
    process(clk, reset)
    begin
		if (reset = '1') then
            state_reg <= ONE;
            clk_reg <= '0';
            count_reg <= (others => '0');
		elsif ( rising_edge(clk)) then 
            state_reg <= state_next;
            clk_reg <= clk_next;
            count_reg <= count_next; 	
        end if;
    end process;

    -- Control logic and data path
    process(state_reg, count_reg, en)
    begin
        state_next <= state_reg; 
        count_next <= count_reg;
        if (en = '1') then
            case state_reg is
                when ONE =>
                    clk_next <= '1';
                    if ( count_reg = (MAX_COUNT-1)  ) then
                        count_next <= (others => '0');
                        state_next <= ZERO;
                    else 
                        count_next <= (count_reg + 1);
						state_next <= ONE;
                    end if; 
				when ZERO =>  
                    clk_next <= '0';
                    if ( count_reg = (MAX_COUNT-1)   ) then
                        count_next <= (others => '0');
                        state_next <= ONE;
                    else 
                        count_next <= (count_reg + 1);
						state_next <= ZERO;
                    end if; 
           end case;
        else
            clk_next <= '0';
            count_next <= (others => '0');
            state_next <= ONE;
        end if;
    end process;
   clk_out <= clk_reg; 
end architecture arch;

