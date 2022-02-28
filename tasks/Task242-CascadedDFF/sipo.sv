module sipo #(parameter N = 8) (output logic [N-1:0] q, input logic D, clk, n_reset);

always_ff @(posedge clk, negedge n_reset)
	if (n_reset == 0)
		q <= '0;
	else
		q <= {D, q[N-1:1]};

endmodule