# FPGA implementation of a 4-Bit ALU

The design is prototype on the DE1-SoC board and is driven by the 50 MHz clock signal. 


The specifications of the design are
* It has 2 4-bit input operands, A and B, connected to switches SW(7 downto 4) and SW(3 downto 0) respectively.
* The hexadecimal values of inputs A and B are displayed on seven-segment displays HEX5 (for input A) and HEX4 (for input B).
* It has a 2-bit operation input, called op, connected to switches SW(9 downto 8) that controls the mode of operation according to the following table:

| op | operation | definition          |  
|----|-----------|---------------------|
| 00 | A and B   | logical bitwise AND |   
| 01 | A or B    | logical bitwise OR  |  
| 10 | A + B     | addition            |
| 11 | A - B     | subtraction         |   

A RTL Structure of the design is

    .
    ├── ...
    ├── alu.vhdl                        # Top Level Entity
    │   ├── and_gate.vhdl               # HR1 - Counts from 0-2 
    │   ├── or_gate.vhdl                # HR0 - Counts from 0-9 when HR1 is 0 or 1 and 0-3 when HR is 2 
    │   ├── seven_segment_decoder.vhdl  # MIN1 - Counts from 0-5 
    │   ├── adder.vhdl                  # MIN0 - Counts from 0-9 
    │   │     └──  adder_unit.vhdl      # SEC1 - Counts from 0-5 
    │   ├──subtractor_unit              # Generates a control signal every 1 second
    │        └──  adder_unit.vhdl       # SEC1 - Counts from 0-5 
    └── ...


 
 