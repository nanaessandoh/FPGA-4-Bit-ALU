library ieee;
use ieee.std_logic_1164.all;

entity test_subtractor is

end test_subtractor;


architecture behav of test_subtractor is

-- Declare Components
component subtractor
    port(
     SW : in std_logic_vector(7 downto 0);
     sub_op : out std_logic_vector(3 downto 0);
     cout : out std_logic
 );
end component;


-- Declare Signals
signal SW_i : std_logic_vector(7 downto 0);
signal sub_op_i : std_logic_vector(3 downto 0);
signal cout_i : std_logic;


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
	test: subtractor port map( 	
                            SW => SW_i,
                            sub_op => sub_op_i,
                            cout => cout_i
                        );


    -- Perform Test
	Do_Test:
	process
	begin

	wait for 10 ns;

    -- Test 5-2
    SW_i(7 downto 4) <= "0101";
    SW_i(3 downto 0) <= "0010";

    wait for 20 ns;

    -- Test 6+3
    SW_i(7 downto 4) <= "0110";
    SW_i(3 downto 0) <= "0011";

    wait for 20 ns;

    -- Test 3-0
    SW_i(7 downto 4) <= "0011";
    SW_i(3 downto 0) <= "0000";

	wait for 50 ns;	

	end process Do_test;





end behav;