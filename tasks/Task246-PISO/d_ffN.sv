//D-Type Flip-Flop (with asynchronous reset)
module d_ffN #(parameter N=8) (output logic [N-1:0] Q, input logic [N-1:0] D, input logic CLK, N_RESET, EN);

logic [N-1:0] q_int;
assign #(10ps) Q = q_int;

always_ff @(posedge CLK, negedge N_RESET) begin
	//Reset takes precedence
	if (N_RESET == 1'b0) begin
		q_int <= 8'b0;
	end
	else begin
		//Otherwise if EN=1 then Q = D (and latches)
		if (EN == 1) 
			q_int <= D;
	end
end
	
endmodule
