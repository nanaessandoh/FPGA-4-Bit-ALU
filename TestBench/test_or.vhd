library ieee;
use ieee.std_logic_1164.all;

entity test_and is

end test_and;


architecture behav of test_and is

-- Declare Components
component or_gate
    port(
     SW : in std_logic_vector(7 downto 0);
     op : out std_logic_vector(3 downto 0)
 );
end component;


-- Declare Signals
signal SW_i : std_logic_vector(7 downto 0);
signal op_i : std_logic_vector(3 downto 0);


begin


	-- Generate Clock
	GenerateCLK:
	process
	constant TimeHigh : time := 5 ns;
	constant TimeLow : time := 5 ns;
	constant CycleCount: integer := 0;
 
	begin
	clk_i <= '1';
	wait for TimeHigh;
	clk_i <= '0';
	wait for TimeLow;

	end process GenerateCLK;

    -- Port Map Declaration
	test: or_gate port map( 	
                            SW => SW_i,
                            op => op_i
                        );


    -- Perform Test
	Do_Test:
	process
	begin

	wait for 10 ns;

    -- Test 5 or 3 = 7 (0111)
    SW_i(7 downto 4) <= "0101";
    SW_i(3 downto 0) <= "0011";

    wait for 20 ns;

    -- Test 6 or 7 = 6 (0111)
    SW_i(7 downto 4) <= "0110";
    SW_i(3 downto 0) <= "0111";

    wait for 20 ns;

    -- Test 12 or 9 = 13 (1101)
    SW_i(7 downto 4) <= "1100";
    SW_i(3 downto 0) <= "1001";

	wait for 50 ns;	

	end process Do_test;





end behav;