//D-Type Flip-Flop (with asynchronous reset)
module d_ff #(parameter Tpd=10ps) (output logic Q, input logic D, CLK, n_Reset);

logic q_int;
assign #Tpd Q = q_int;

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		q_int <= 0;
	end
	else begin
		//Otherwise Q = D (and latches)
		q_int <= D;
	end
end
	
endmodule