library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor_unit is
    port(
        a,b,cin : in std_logic;
        sum,cout: out std_logic
    );
end full_subtractor_unit;

architecture logic of full_subtractor_unit is
    begin
        sum <= a xor (not b) xor cin;
        cout <= (a and (not b)) or ((not b) and cin) or (a and cin);
    end logic;
