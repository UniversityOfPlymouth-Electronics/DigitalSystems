module q2 (output wire[7:0] Y, input wire[3:0] A, input wire[3:0] B);

assign Y = { B, A };

endmodule