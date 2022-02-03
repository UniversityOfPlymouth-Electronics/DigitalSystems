module srgate (output logic Q, Qbar, input logic S, R, n_reset);

always @(S,R,n_reset)
begin
	if (n_reset == 0) begin
		Q    <= 0;
		Qbar <= 0;
	end
	else if ( (S==1) && (R==0) )
		{Q, Qbar} <= 2'b10;
	else if ( (S == 0) && (R == 1) )
		{Q, Qbar} <= 2'b01;
	else if ( (S == 1'b1) && (R == 1'b1) )
		{Q, Qbar} <= 2'bzz;
	// No coverage of the input combination 0 0 !!!!
end

endmodule




