library ieee;
use ieee.std_logic_1164.all;

entity test_adder is

end test_adder;


architecture behav of test_adder is

-- Declare Components
component adder
    port(
        SW : in std_logic_vector(7 downto 0);
        adder_op : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end component;


-- Declare Signals
signal SW_i : std_logic_vector(7 downto 0);
signal adder_op_i : std_logic_vector(3 downto 0);
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
	test: adder port map( 	
                            SW => SW_i,
                            adder_op => adder_op_i,
                            cout => cout_i
                        );


    -- Perform Test
	Do_Test:
	process
	begin

	wait for 10 ns;

    -- Test 1+2
    SW_i(7 downto 4) <= "0001";
    SW_i(3 downto 0) <= "0010";

    wait for 20 ns;

    -- Test 5+2
    SW_i(7 downto 4) <= "0101";
    SW_i(3 downto 0) <= "0010";

    wait for 20 ns;

    -- Test 3+4
    SW_i(7 downto 4) <= "0011";
    SW_i(3 downto 0) <= "0100";

	wait for 50 ns;	

	end process Do_test;





end behav;