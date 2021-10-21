module q3 (output wire[3:0] Y, input wire[3:0] A, input wire[3:0] B);

wire[4:0] s0, s1;

assign s1 = ~s0;
assign s0 = A | B;
assign Y = s1;

endmodule
