module mul #(parameter N = 4) (output logic [2*N - 1 : 0] Y, input logic [N-1:0] A, B);

	always_comb
	begin
		Y = A*B;
	end
endmodule
