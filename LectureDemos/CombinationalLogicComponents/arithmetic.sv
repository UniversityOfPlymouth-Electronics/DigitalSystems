module adder #(parameter N = 4) (output logic [N-1:0] Sum, output logic Cout, input logic [N-1:0] A, B, input logic Cin);

always_comb
	{Cout, Sum} = A + B + Cin;

endmodule

