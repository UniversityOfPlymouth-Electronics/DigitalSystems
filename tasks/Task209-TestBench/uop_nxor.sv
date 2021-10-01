module uop_nxor (output wire Y, input wire A, input wire B);

//Internal wires
wire term0;
wire term3;

//Continuous Assignment (order does not matter)
assign Y = term0 | term3;
assign term0 = ~A & ~B;
assign term3 = A & B;

endmodule