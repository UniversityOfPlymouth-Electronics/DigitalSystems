//Adapted from example in the book by Mark Zwolinski (see references)
module ripple_adder #(parameter N = 4) (output logic [N-1:0] Sum, output logic Cout, input logic [N-1:0] A, B, input logic Cin);
	logic [N-1:0] Ca;
	assign Ca[0] = Cin;

	genvar i;
	generate for (i = 0; i < N-1; i++) 
		begin : f_loop
			fulladder fi (Sum[i], Ca[i+1], A[i], B[i], Ca[i]);
		end
	endgenerate

	//msb
	fulladder fN (Sum[N-1], Cout, A[N-1], B[N-1], Ca[N-1]);
endmodule