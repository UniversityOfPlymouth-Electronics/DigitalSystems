module dlatch (output logic Q, input logic D, EN, n_Reset);

always_latch
	if (n_Reset == 1'b0) 
		Q <= 0;
	else if (EN == 1'b1)
		Q <= D;

endmodule