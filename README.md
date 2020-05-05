# FPGA implementation of a 4-Bit ALU

The design is prototype on the DE1-SoC board. 

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

* It has an 4-bit output that shows the result of the selected operation on the supplied operands. The output is displayed on seven-segment display HEX0.
* It has a 1-bit overflow output that is connected to the carry-out of the 8-bit adder when adding and subtracting and is 0 otherwise. This output is connected to HEX1.

A RTL Structure of the design is

    .
    ├── ...
    ├── alu.vhdl   # Top Level Entity
    │   ├── and_gate.vhdl                
    │   ├── or_gate.vhdl                 
    │   ├── seven_segment_decoder.vhdl  
    │   ├── adder.vhdl                  
    │   │   └──  adder_unit.vhdl      
    │   └── subtractor_unit              
    │       └──  adder_unit.vhdl       
    └── ...


 
 