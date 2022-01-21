module custom_function_tb;

logic A, B, Y1, Y2, Y3;

custom_function #(.f(0)) u0(Y1, A, B);
custom_function #(.f(1)) u1(Y2, A, B);
custom_function #(.f(2)) u2(Y3, A, B);

initial
begin

	{A, B} = 2'b00;
	#10ps;
	assert (Y1 == (A & B)) $display("Passed AND: A=%d, B=%d, Y=%d", A, B, Y1); else $error("Failed AND: A=%d, B=%d, Y=%d", A, B, Y1);
	assert (Y2 == (A | B)) $display("Passed OR:  A=%d, B=%d, Y=%d", A, B, Y2); else $error("Failed OR:  A=%d, B=%d, Y=%d", A, B, Y2);
	assert (Y3 == (A ^ B)) $display("Passed XOR: A=%d, B=%d, Y=%d", A, B, Y3); else $error("Failed XOR: A=%d, B=%d, Y=%d", A, B, Y3);

	{A, B} = 2'b01;
	#10ps;
	assert (Y1 == (A & B)) $display("Passed AND: A=%d, B=%d, Y=%d", A, B, Y1); else $error("Failed AND: A=%d, B=%d, Y=%d", A, B, Y1);
	assert (Y2 == (A | B)) $display("Passed OR:  A=%d, B=%d, Y=%d", A, B, Y2); else $error("Failed OR:  A=%d, B=%d, Y=%d", A, B, Y2);
	assert (Y3 == (A ^ B)) $display("Passed XOR: A=%d, B=%d, Y=%d", A, B, Y3); else $error("Failed XOR: A=%d, B=%d, Y=%d", A, B, Y3);

	{A, B} = 2'b10;
	#10ps;
	assert (Y1 == (A & B)) $display("Passed AND: A=%d, B=%d, Y=%d", A, B, Y1); else $error("Failed AND: A=%d, B=%d, Y=%d", A, B, Y1);
	assert (Y2 == (A | B)) $display("Passed OR:  A=%d, B=%d, Y=%d", A, B, Y2); else $error("Failed OR:  A=%d, B=%d, Y=%d", A, B, Y2);
	assert (Y3 == (A ^ B)) $display("Passed XOR: A=%d, B=%d, Y=%d", A, B, Y3); else $error("Failed XOR: A=%d, B=%d, Y=%d", A, B, Y3);

	{A, B} = 2'b11;
	#10ps;	
	assert (Y1 == (A & B)) $display("Passed AND: A=%d, B=%d, Y=%d", A, B, Y1); else $error("Failed AND: A=%d, B=%d, Y=%d", A, B, Y1);
	assert (Y2 == (A | B)) $display("Passed OR:  A=%d, B=%d, Y=%d", A, B, Y2); else $error("Failed OR:  A=%d, B=%d, Y=%d", A, B, Y2);
	assert (Y3 == (A ^ B)) $display("Passed XOR: A=%d, B=%d, Y=%d", A, B, Y3); else $error("Failed XOR: A=%d, B=%d, Y=%d", A, B, Y3);

end

endmodule
