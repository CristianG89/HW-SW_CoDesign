
-- VHDL Test Bench Created from source file Reception_blk.vhd -- Thu Jul 05 11:15:18 2018

--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
-- 3) VHDL simulations will produce errors if there are Lattice FPGA library 
-- elements in your design that require the instantiation of GSR, PUR, and
-- TSALL and they are not present in the testbench. For more information see
-- the How To section of online help.  
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT Reception_block
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		clk_spi : IN std_logic;
		rx : IN std_logic;          
		Out_7Seg_LSB : OUT std_logic_vector(7 downto 0);
		Out_7Seg_MSB : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL clk_spi :  std_logic;
	SIGNAL rx :  std_logic;
	SIGNAL Out_7Seg_LSB :  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_MSB :  std_logic_vector(7 downto 0);

BEGIN

-- Please check and add your generic clause manually
	uut: Reception_block PORT MAP(
		clk => clk,
		reset => reset,
		clk_spi => clk_spi,
		rx => rx,
		Out_7Seg_LSB => Out_7Seg_LSB,
		Out_7Seg_MSB => Out_7Seg_MSB
	);


-- *** Test Bench - User Defined Section ***
    tb0 : PROCESS
   BEGIN
        clk <= '0'; wait for 5 ns;
        clk <= '1'; wait for 5 ns;
   END PROCESS;
   
   tb1 : PROCESS
   BEGIN
        rx <= '0';
        reset <= '1';
        wait for 15 ns;
        reset <= '0';
        wait for 60 ns;
        
        -- sync
        rx <= '0';
        clk_spi <= '1'; wait for 20 ns; 
        clk_spi <= '0'; wait for 20 ns;
        -- reception starts here 0101 0101
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
       
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        -- two more clk_spi
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
 
        wait for 200 ns;

        -- sync
        rx <= '0';
        clk_spi <= '1'; wait for 20 ns; 
        clk_spi <= '0'; wait for 20 ns;
        -- reception of 1100 1100 starts here 
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        -- two more clk_spi
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
 
        wait for 200 ns;
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
