-- Reception block

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Reception_block is
    port (  clk: in std_logic; 
            reset: in std_logic; 
            clk_spi: in std_logic;
            rx: in std_logic;
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
end entity Reception_block;

architecture arch of Reception_block is
    component spi_block_rx is
        port (
            clk: in std_logic; 
            reset: in std_logic; 
            clk_spi: in std_logic;
            rx: in std_logic;
            data: out std_logic_vector (7 downto 0);
            full_buf: out std_logic
        );
    end component spi_block_rx; 

    component decoder_block is
        port (
            clk:    in  std_logic;
            reset:  in  std_logic;
            full_buf:  in  std_logic;
            data_in:    in  std_logic_vector(7 downto 0);
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
    end component decoder_block;

-- Internal signals
    signal idata : std_logic_vector(7 downto 0);
    signal ifull_buf: std_logic; 

begin
    SPI_RECEPTION: spi_block_rx port map(
            clk => clk,
            reset  => reset,
            clk_spi => clk_spi,
            rx =>  rx, 
            data => idata,
            full_buf => ifull_buf);  

    DECODER:  decoder_block port map(
            clk => clk, 
            reset =>  reset, 
            full_buf =>  ifull_buf,
            data_in => idata,
            Out_7Seg_LSB => Out_7Seg_LSB,
            Out_7Seg_MSB => Out_7Seg_MSB  );
        
end architecture arch;