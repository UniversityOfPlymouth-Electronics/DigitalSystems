module custom_function #(parameter int f = 0) (output logic Y, input logic A, B);

generate
	if (f == 0) 
		assign Y = A & B;
	else if (f == 1)
		assign Y = A | B;
	else
		assign Y = A ^ B;
endgenerate

endmodule