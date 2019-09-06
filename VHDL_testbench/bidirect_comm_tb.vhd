
-- VHDL Test Bench Created from source file bidirect_comm.vhd -- Sat Jul 07 12:14:49 2018

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

	COMPONENT bidirect_comm
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		push_button : IN std_logic;
		dip_switch : IN std_logic_vector(7 downto 0);
		clk_spi_in : IN std_logic;
		rx : IN std_logic;          
		clk_spi_out : OUT std_logic;
		tx : OUT std_logic;
		Out_7Seg_LSB : OUT std_logic_vector(7 downto 0);
		Out_7Seg_MSB : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL push_button :  std_logic;
	SIGNAL dip_switch :  std_logic_vector(7 downto 0);
	SIGNAL clk_spi_out :  std_logic;
	SIGNAL tx :  std_logic;
	SIGNAL clk_spi_in :  std_logic;
	SIGNAL rx :  std_logic;
	SIGNAL Out_7Seg_LSB :  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_MSB :  std_logic_vector(7 downto 0);

BEGIN

-- Please check and add your generic clause manually
	uut: bidirect_comm PORT MAP(
		clk => clk,
		reset => reset,
		push_button => push_button,
		dip_switch => dip_switch,
		clk_spi_out => clk_spi_out,
		tx => tx,
		clk_spi_in => clk_spi_in,
		rx => rx,
		Out_7Seg_LSB => Out_7Seg_LSB,
		Out_7Seg_MSB => Out_7Seg_MSB
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
