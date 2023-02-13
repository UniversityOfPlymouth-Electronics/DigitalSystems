module srgate_tb;

logic Q, Qbar, S, R, nReset;



//instantiate component
srgate u1 (Q, Qbar, S, R, nReset);



initial
begin

	#100ps
	assert ({Q, Qbar}=== 2'bxx)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");
	
	//RESET
	nReset = 1'b0;

	//nReset
	{S, R} = 2'b00;
	#100ps
	assert ({Q, Qbar}=== 2'b00)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

	//nReset
	{S, R} = 2'b01;
	#100ps
	assert ({Q, Qbar}=== 2'b00)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

	//Latch
	{S, R} = 2'b10;
	#100ps
	assert ({Q, Qbar}=== 2'b00)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");
	
	//NOT RESET
	nReset = 1'b1;

	//Reset
	{S, R} = 2'b01;
	#100ps
	assert ({Q, Qbar}=== 2'b01)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

	//Latch
	{S, R} = 2'b00;
	#100ps
	assert ({Q, Qbar}=== 2'b01)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

	//Set
	{S, R} = 2'b10;
	#100ps
	assert ({Q, Qbar}=== 2'b10)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

	//Latch
	{S, R} = 3'b00;
	#100ps
	assert ({Q, Qbar}=== 2'b10)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");


	//Illegal Condition
	{S, R} = 2'b11;
	#100ps
	assert ({Q, Qbar}=== 2'bzz)
	$display("PASSED - Input S%b R%b, Output Q%b, Qbar%b, nRST%b", S, R, Q, Qbar, nReset);
	else
	$display("FAILED");

end



endmodule