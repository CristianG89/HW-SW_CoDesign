library ieee;
use ieee.std_logic_1164.all;		-- standard unresolved logic UX01ZWLH-
 
-- When SPI TX block is ready, a signal informs it to take the updated output
entity Interf_Inputs is 
    port (
            clk:    in  std_logic;
            reset:  in  std_logic;
            dip_switch: in std_logic_vector(7 downto 0);
            empty_buf:  in  std_logic;
            push_button:    in std_logic;
            en: out std_logic;
            data_out:   out std_logic_vector(7 downto 0)
	);
end entity Interf_Inputs;

architecture Data_Sending of Interf_Inputs is
    type STATES is (IDLE, PRESS_BUTTON, CHECK_BUFF, WAIT_BUFFER, SEND);
    -- Current state (reg) and the next one (next) --> Then "next" is updated earler
    signal state_next, state_reg: STATES;
    signal data_next, data_reg: std_logic_vector(7 downto 0);
    signal en_next, en_reg: std_logic ;

begin
    -- FSMD: state and data registers
    process (clk, reset)
    begin
        -- To ensure the system will work, the reset button must be pushed at first, after configuring the HW
        if (reset = '1') then	            
            state_reg <= IDLE;
            en_reg <= '0';
            data_reg <= "00000000";
        elsif (rising_edge(clk)) then 
            state_reg <= state_next;
            en_reg <= en_next;
            data_reg <= data_next;
        end if;
    end process;

    -- control flow and data path
    process (state_reg,  data_reg, empty_buf, push_button, en_reg, dip_switch)
    begin
        state_next <= state_reg;
        en_next <= en_reg;
        data_next <= data_reg;
            
        case state_reg is
            when IDLE => 
                en_next <= '0';
                -- Button has been pressed
                if (push_button = '1') then
                        state_next <= PRESS_BUTTON;
                end if;

            when PRESS_BUTTON =>
                en_next <= '0';
                -- wait until the button is released
                if (push_button = '0')  then
                    state_next <= CHECK_BUFF;
                end if;
           
            -- the flag that says whether the transmission is empty or not
            -- is delayed so we have to wait
            -- Note that the data in the dip_switch have been already move to the
            -- transmission buffer
            when CHECK_BUFF =>
                if (empty_buf = '1') then
                        state_next <= WAIT_BUFFER;
                        data_next <= dip_switch;
                        en_next <= '1';
                else
                        en_next <= '0';
                        state_next <= IDLE;
                end if;
				
            when WAIT_BUFFER =>
                en_next <= '1';
                if  (empty_buf = '0') then
                    state_next <= SEND;
                end if;
            when SEND =>
                en_next <= '1';
                data_next <= data_reg;
                if (empty_buf = '1') then
                        state_next <= IDLE;
                        en_next <= '0';
                end if;
            end case;
    end process;
    
    data_out <= data_reg;
    en <= en_reg;

end architecture Data_Sending;
