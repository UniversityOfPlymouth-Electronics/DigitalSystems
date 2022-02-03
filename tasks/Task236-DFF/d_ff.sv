module d_ff (output logic Q, input logic D, CLK);

//D-Type Flip-Flop (without asynchronous reset)
always_ff @(posedge CLK) begin
	//Q is equal to D when the clock rises
	Q <= D;
end
	
endmodule
	
//D-Type Flip-Flop (with asynchronous reset)
module d_ff1 (output logic Q, input logic D, CLK, n_Reset);

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0)
		Q <= 0;
	else
		//Otherwise Q = D (and latches)
		Q <= D;
end
	
endmodule