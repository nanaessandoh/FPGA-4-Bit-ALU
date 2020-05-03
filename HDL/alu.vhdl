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

architecture logic of alu is
    component adder is
        port(
            SW : in std_logic_vector(7 downto 0);
            HEX0, HEX1 : out std_logic_vector(6 downto 0)
        );
    end component;
    component subtractor is
        port(
            SW : in std_logic_vector(7 downto 0);
            HEX0, HEX1 : out std_logic_vector(6 downto 0)
        );
    end component;
    component or_gate is
        port(
            SW : in std_logic_vector(7 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;
    component and_gate is
        port(
            SW : in std_logic_vector(7 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;
    component seven_segment_decoder
        port(
            SW : in std_logic_vector(3 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;
    signal sel : std_logic_vector(1 downto 0);
    signal addition_op : std_logic_vector(3 downto 0);
    signal sub_op : std_logic_vector(3 downto 0);
    signal and_op : std_logic_vector(3 downto 0);
    signal or_op : std_logic_vector(3 downto 0);
    signal carry_add,carry_sub : std_logic_vector(0 downto 0);
    signal four_bit_carry : std_logic_vector(3 downto 0);
    signal op : std_logic_vector(3 downto 0);
begin
    Direct0 : seven_segment_decoder port map (SW(7 downto 4), HEX5);
    Direct1 : seven_segment_decoder port map (SW(3 downto 0), HEX4);


    
    AG : and_gate port map (SW(7 downto 0), and_op);
    OG : or_gate port map (SW(7 downto 0), or_op);
    addition_operation : adder port map (SW(7 downto 0), addition_op, carry_add);
    subtraction_operation : subtractor port map (SW(7 downto 0), sub_op, carry_sub);
    
    process(SW)
        begin
            if (SW(9) ='0') and (SW(8) = '0') then
                -- LEDR(0) <= '0';
                -- AG : and_gate port map (SW(7 downto 0), HEX0);
                op <= and_op;
                -- LEDR(0) <= '1';
            end if;
            if (SW(9) ='0') and (SW(8) = '1') then
                -- LEDR(0) <= '0';
                -- OG : or_gate port map (SW(7 downto 0), HEX0);
                op <= or_op;
                -- LEDR(0) <= '1';
                end if;
            if (SW(9) ='1') and (SW(8) = '0') then
                -- LEDR(0) <= '0';
                -- addition_op : adder port map (SW(7 downto 0), HEX0, HEX1);
                op <= addition_op;
                four_bit_carry <= "000" & carry_add;
                -- LEDR(0) <= '1';
                end if;
            if (SW(9) ='1') and (SW(8) = '1') then
                -- LEDR(0) <= '0';
                -- SUB_OP : subtractor port map (SW(7 downto 0), HEX0, HEX1);
                op <= sub_op;
                four_bit_carry <= "000" & carry_sub;
                -- LEDR(0) <= '1';
            end if;
    end process;

    SSD0 : seven_segment_decoder port map (op, HEX0);
    SSD1 : seven_segment_decoder port map (four_bit_carry, HEX1);
    
end logic;