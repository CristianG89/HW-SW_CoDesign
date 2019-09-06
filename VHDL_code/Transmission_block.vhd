-- Transmission block

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;

entity Transmission_block is 
    port(
            clk:    in  std_logic;
            reset:  in  std_logic;
            push_button:in  std_logic;
            dip_switch: in  std_logic_vector(7 downto 0);
            clk_spi: out std_logic;
            tx: out std_logic
        );
end entity Transmission_block;

architecture arch of Transmission_block is

    component spi_block_tx is
        port (  
            clk: in std_logic; 
            reset: in std_logic; 
            data: in std_logic_vector (7 downto 0);
            en: in std_logic; 
            empty_buf: out std_logic; 
            clk_spi: out std_logic;
            tx: out std_logic
        );
    end component spi_block_tx; 

    component Interf_Inputs  is 
        port (
            clk:    in  std_logic;
            reset:  in  std_logic;
            dip_switch: in std_logic_vector(7 downto 0);
            push_button:    in std_logic;
            empty_buf:  in  std_logic;
            en: out std_logic;
            data_out:   out std_logic_vector(7 downto 0)
        );		
    end component Interf_Inputs;
    
	-- Internal signals
    signal iempty_buf: std_logic;
    signal ien: std_logic;
    signal idata: std_logic_vector(7 downto 0);

begin

    INPUTS_READ: Interf_Inputs port map(
            clk => clk,
            reset => reset, 
            dip_switch => dip_switch,
            push_button => push_button,
            empty_buf => iempty_buf,
            en => ien,
            data_out => idata);

    SPI_TRANSMISSION: spi_block_tx port map(
            clk => clk,
            reset =>  reset, 
            data => idata,
            en => ien,
            empty_buf => iempty_buf,
            clk_spi => clk_spi,
            tx => tx);

end architecture arch;