library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        SW : in std_logic_vector(9 downto 0);
        HEX5: out std_logic_vector(6 downto 0);
        HEX4: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX0: out std_logic_vector(6 downto 0)
    );
end alu;

architecture behav of alu is


    -- Declare Components
    component adder
        port(
            SW : in std_logic_vector(7 downto 0);
            adder_op : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;

    component subtractor is
        port(
            SW : in std_logic_vector(7 downto 0);
            sub_op : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;
    
    component or_gate is
        port(
            SW : in std_logic_vector(7 downto 0);
            op : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component and_gate is
        port(
            SW : in std_logic_vector(7 downto 0);
            op : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component seven_segment_decoder
        port(
            SW : in std_logic_vector(3 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Declare Signals
    signal sel : std_logic_vector(1 downto 0);
    signal addition_op : std_logic_vector(3 downto 0);
    signal sub_op : std_logic_vector(3 downto 0);
    signal and_op : std_logic_vector(3 downto 0);
    signal or_op : std_logic_vector(3 downto 0);
    signal carry_add,carry_sub : std_logic;
    signal four_bit_carry : std_logic_vector(3 downto 0);
    signal op : std_logic_vector(3 downto 0);

begin

    
    process(SW,and_op,or_op,addition_op,carry_add,sub_op,carry_sub)
        begin

             -- When 00 Mode = AND
            if (SW(9) ='0') and (SW(8) = '0') then
                op <= and_op;
            end if;

            -- When 00 Mode = OR
            if (SW(9) ='0') and (SW(8) = '1') then
                op <= or_op;
                end if;

             -- When 00 Mode = ADD
            if (SW(9) ='1') and (SW(8) = '0') then
                op <= addition_op;
                four_bit_carry <= "000" & carry_add;
                end if;

            -- When 00 Mode = SUBTRACT
            if (SW(9) ='1') and (SW(8) = '1') then
                op <= sub_op;
                four_bit_carry <= "000" & carry_sub;
            end if;

    end process;


    -- Declare Port Maps
    and_operation : and_gate port map (SW(7 downto 0), and_op);
    or_operation : or_gate port map (SW(7 downto 0), or_op);
    addition_operation : adder port map (SW(7 downto 0), addition_op, carry_add);
    subtraction_operation : subtractor port map (SW(7 downto 0), sub_op, carry_sub);

    SSD5 : seven_segment_decoder port map (SW(7 downto 4), HEX5);
    SSD4 : seven_segment_decoder port map (SW(3 downto 0), HEX4);
    SSD0 : seven_segment_decoder port map (op, HEX0);
    SSD1 : seven_segment_decoder port map (four_bit_carry, HEX1);
    
end behav;