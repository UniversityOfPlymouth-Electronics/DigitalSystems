module mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

initial
begin
	//Write test code here
	//A=0 and B=0
	A = 4'd0;
	B = 4'd0;

	#10ps;

	assert (Y == 0) $display("Passed %d * %d = %d\t%b", A, B, Y, Y); else $error("Failed");

	A = 4'd15;
	B = 4'd15;

	#10ps;

	assert (Y == 225) $display("Passed %d * %d = %d\t%b", A, B, Y, Y); else $error("Failed");

end

endmodule