LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT full_comm 
	port(
            clk: in std_logic;
            reset: in std_logic; 
            push_button: in std_logic;
            dip_switch: in std_logic_vector(7 downto 0);
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
	END COMPONENT;

    SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL push_button :  std_logic;
	SIGNAL dip_switch :  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_LSB:  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_MSB:  std_logic_vector(7 downto 0);

BEGIN
	
    uut: full_comm PORT MAP(
		clk => clk,
		reset => reset,
		push_button => push_button,
		dip_switch => dip_switch,
		Out_7Seg_LSB => Out_7Seg_LSB,
		Out_7Seg_MSB => Out_7Seg_MSB);

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
      dip_switch <= "10100101"; wait for 50 ns;

      -- send dip "11110000" 
      push_button <= '1'; wait for 100 ns;
      -- enough time to send the data
      push_button <= '0'; wait for 500 ns;


      dip_switch <= "00110011"; wait for 100 ns;
      -- send dip "10101100" 
      dip_switch <= "10101100"; wait for 100 ns;
      push_button <= '1'; wait for 100 ns;
      -- enough time to send the data
      push_button <= '0'; wait for 1500 ns;
  END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
