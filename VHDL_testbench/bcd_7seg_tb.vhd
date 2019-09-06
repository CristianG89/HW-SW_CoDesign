
-- VHDL Test Bench Created from source file bcd_to_7seg.vhd -- Thu Jul 05 10:40:23 2018

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

	COMPONENT bcd_to_7seg
	PORT(
		data_in : IN std_logic_vector(3 downto 0);          
		data_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL data_in :  std_logic_vector(3 downto 0);
	SIGNAL data_out :  std_logic_vector(7 downto 0);

BEGIN

-- Please check and add your generic clause manually
	uut: bcd_to_7seg PORT MAP(
		data_in => data_in,
		data_out => data_out
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      data_in <= "0101"; wait for 10 ns;
      data_in <= "1001"; wait for 10 ns;
      data_in <= "0011"; wait for 10 ns;
      data_in <= "0110"; wait for 10 ns;
      data_in <= "0100"; wait for 10 ns;
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;