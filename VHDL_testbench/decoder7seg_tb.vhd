
-- VHDL Test Bench Created from source file decoder7seg.vhd -- Sun Jun 24 12:28:50 2018

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

	COMPONENT decoder7seg
	PORT(
		encoded_input : IN std_logic_vector(7 downto 0);          
		Out_7Seg_LSB : OUT std_logic_vector(7 downto 0);
		Out_7Seg_MSB : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL encoded_input :  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_LSB :  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_MSB :  std_logic_vector(7 downto 0);

BEGIN

-- Please check and add your generic clause manually
	uut: decoder7seg PORT MAP(
		encoded_input => encoded_input,
		Out_7Seg_LSB => Out_7Seg_LSB,
		Out_7Seg_MSB => Out_7Seg_MSB
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      encoded_input <= "01010110"; wait for 10 ns;
      encoded_input <= "10011100"; wait for 10 ns;
      encoded_input <= "00110000"; wait for 10 ns;
      encoded_input <= "01101111"; wait for 10 ns;
      encoded_input <= "01000101"; wait for 10 ns;
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
