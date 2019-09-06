
-- VHDL Test Bench Created from source file Transmission_blk.vhd -- Sat Jul 07 11:30:16 2018

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

	COMPONENT Transmission_block 
		port(
            clk:    in  std_logic;
            reset:  in  std_logic;
            push_button:in  std_logic;
            dip_switch: in  std_logic_vector(7 downto 0);
            clk_spi: out std_logic;
            tx: out std_logic
        );
	END COMPONENT;

    SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL push_button :  std_logic;
	SIGNAL dip_switch :  std_logic_vector(7 downto 0);
	SIGNAL clk_spi:  std_logic;
	SIGNAL tx:  std_logic;

BEGIN
	
    uut: Transmission_block PORT MAP(
		clk => clk,
		reset => reset,
		push_button => push_button,
		dip_switch => dip_switch,
		clk_spi => clk_spi,
		tx => tx);

   -- *** Test Bench - User Defined Section ***
   tb0 : PROCESS
   BEGIN
        clk <= '1'; wait for 5 ns;
        clk <= '0'; wait for 5 ns;
   END PROCESS;
   
   tb1 : PROCESS
   BEGIN
	  reset <= '1'; wait for 3 ns; 
	  reset <= '0';

	  push_button <= '0';
      dip_switch <= "00001111"; wait for 50 ns;
      dip_switch <= "11110000"; wait for 50 ns;

      -- send dip "11110000" 
      push_button <= '1'; wait for 100 ns;
      -- enough time to send the data
      push_button <= '0'; wait for 500 ns;

      dip_switch <= "00110011"; wait for 100 ns;
      -- send dip "10101100" 
      dip_switch <= "10101100"; wait for 100 ns;
      push_button <= '1'; wait for 100 ns;
      -- enough time to send the data
      push_button <= '0'; wait for 1200 ns;
      
      push_button <= '1'; wait for 100 ns;
      -- enough time to send the data
      push_button <= '0'; wait for 2700 ns;
  END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;