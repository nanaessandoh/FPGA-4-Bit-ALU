library ieee;
use ieee.std_logic_1164.all;

entity adder is
    port(
        SW : in std_logic_vector(7 downto 0);
        adder_op : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end adder;

architecture logic of adder is

    component seven_segment_decoder
        port(
            SW : in std_logic_vector(3 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;
    
    component full_adder_unit
        port(
            a,b,cin : in std_logic;
            sum,cout: out std_logic
        );
    end component;
    

    signal carry : std_logic_vector(3 downto 0);
    begin
        FAU0 : full_adder_unit port map(SW(7),SW(3),'0',adder_op(3),carry(0));
        FAU1 : full_adder_unit port map(SW(6),SW(2),carry(0),adder_op(2),carry(1));
        FAU2 : full_adder_unit port map(SW(5),SW(1),carry(1),adder_op(1),carry(2));
        FAU3 : full_adder_unit port map(SW(4),SW(0),carry(2),adder_op(0),carry(3));
        cout <= carry(3);
    end logic;