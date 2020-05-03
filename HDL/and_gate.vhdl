library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port(
        SW : in std_logic_vector(7 downto 0);
        op : out std_logic_vector(3 downto 0)
    );
end and_gate;

architecture logic of and_gate is
    component seven_segment_decoder
        port(
            SW : in std_logic_vector(3 downto 0);
            HEX0 : out std_logic_vector(6 downto 0)
        );
    end component;
    -- signal op : std_logic_vector(3 downto 0);
    begin
        op(3) <= SW(7) and SW(3);
        op(2) <= SW(6) and SW(2);
        op(1) <= SW(5) and SW(1);
        op(0) <= SW(4) and SW(0);
        -- SSD0 : seven_segment_decoder port map (op, HEX0);
    end logic;