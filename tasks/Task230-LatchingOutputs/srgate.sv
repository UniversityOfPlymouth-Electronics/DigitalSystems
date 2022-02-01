module srgate (output logic Q, Qbar, input logic S, R);

always @(S,R)
begin
	if ( (S==1) && (R==0) )
		{Q, Qbar} <= 2'b10;
	else if ( (S == 0) && (R == 1) )
		{Q, Qbar} <= 2'b01;
	else if ( (S == 1'b1) && (R == 1'b1) )
		{Q, Qbar} <= 2'bzz;
	// No coverage of the input combination 0 0 !!!!
end

endmodule




