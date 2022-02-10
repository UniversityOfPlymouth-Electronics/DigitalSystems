//D-Type Flip-Flop (with asynchronous reset)
module d_ffN #(parameter N) (output logic [N-1:0] Q, input logic [N-1:0] D, logic CLK, n_Reset, EN);

logic [N-1:0] q_int;
assign #(10ps) Q = q_int;

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		q_int <= 8'b0;
	end
	else begin
		//Otherwise Q = D (and latches)
		if (EN == 1) 
			q_int <= D;
	end
end
	
endmodule