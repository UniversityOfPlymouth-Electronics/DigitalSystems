module mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

//Test task (saves on repetition)
task check(logic [N-1:0] AA, BB, logic [2*N - 1 : 0] Y_expected);

	A = AA;
	B = BB;
	#10ps;
	assert (Y == Y_expected)
		$display("Passed for %d x %d", A, B);
	else
		$error("Failed for case %d x %d. Expected %d, got %d", A, B, Y_expected, Y);
endtask

initial
begin
	check(4'd0,  4'd0,  8'd0);
	check(4'd15, 4'd15, 8'd225);
end

endmodule