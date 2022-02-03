module srgate_tb;

//Internal signals
logic Q, notQ, S, R, nReset;

//Instantiate and connect
srgate u1 (Q, notQ, S,R,nReset);

initial

begin
	// Initial state with reset
	nReset = 0;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");

	{S,R} = 2'b10;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");

	{S,R} = 2'b00;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");

	nReset = 1;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");

	//Inputs both zero - initial state
	{S,R} = 2'b00;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");

	//S=1
	{S,R} = 2'b10;
	#10;
	assert (Q === 1'b1) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");	
	
	//Latched HIGH
	{S,R} = 2'b00;
	#10;
	assert (Q === 1'b1) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b0) $display("Pass"); else $error("Fail");	

	//R=1
	{S,R} = 2'b01;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b1) $display("Pass"); else $error("Fail");	
	
	//Latched HIGH
	{S,R} = 2'b00;
	#10;
	assert (Q === 1'b0) $display("Pass"); else $error("Fail");
	assert (notQ === 1'b1) $display("Pass"); else $error("Fail");	

	//Illegal Condition
	{S,R} = 2'b11;
	#10;
	assert (Q === 1'bz) $display("Pass"); else $error("Fail");
	assert (notQ === 1'bz) $display("Pass"); else $error("Fail");		
end

//This block only runs when S or R **change**
always @(S,R)
begin
	$display("{S,R}={%b,%b}", S, R);
end

//This block only runs when Q changes
always @(Q)
begin
	$display("Q => %b", Q);
end

endmodule