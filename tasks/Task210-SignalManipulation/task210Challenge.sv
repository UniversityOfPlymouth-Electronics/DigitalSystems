module task210Challenge (output wire Y, input wire A, input wire B, input wire C);

//internal wires
wire term0;
wire term1;
wire term2;
wire term3;

//task210Challenge

/*
1. Create a SystemVerilog module to implement the following combinational logic using continuous assignment 
(dataflow style). Do not attempt to simplify the logic.

| A | B | C | | Y |
-------------------
| 0 | 0 | 0 | | 0 |
| 0 | 0 | 1 | | 0 |
| 0 | 1 | 0 | | 1 |
| 0 | 1 | 1 | | 1 |
| 1 | 0 | 0 | | 1 |
| 1 | 0 | 1 | | 1 |
| 1 | 1 | 0 | | 0 |
| 1 | 1 | 1 | | 0 |

*/

//Continuaous assignment - order does not matter
assign term0 = ~A & B & ~C;
assign term1 = ~A & B & C;
assign term2 = A & ~B & ~C;
assign term3 = A & ~B & C;
assign Y = term0 | term1 | term2 | term3;




endmodule