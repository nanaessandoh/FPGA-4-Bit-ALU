library ieee;
use ieee.std_logic_1164.all;

entity full_adder_unit is
    port(
        a,b,cin : in std_logic;
        sum,cout: out std_logic
    );
end full_adder_unit;

architecture logic of full_adder_unit is
    begin
        sum <= a xor b xor cin;
        cout <= (a and b) or (b and cin) or (a and cin);
    end logic;