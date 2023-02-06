module srgate_tb;

logic Q, Qbar, S, R;

//instantiate components
srgate u1 (Q, Qbar, S, R);

initial
begin
	//initial state, unknown output
	{S,R}=2'b00;
	#100ps
	assert ({Q,Qbar} === 2'bx) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q ? Qbar ?", S, R, Q, Qbar);
	else 
	$error("Failed input %b%b\t Q %b Qbar %b, Expected Q 0 Qbar 1", S, R, Q, Qbar);
	
	//Reset
	{S,R}=2'b01;
	#100ps
	assert ({Q,Qbar} == 2'b01) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q 0 Qbar 1", S, R, Q, Qbar);
	else 
	$error("Failed input %b%b\t Q %b Qbar %b, Expected Q 0 Qbar 1", S, R, Q, Qbar);
	
	//Latch
	{S,R}=2'b00;
	#100ps
	assert ({Q,Qbar} == 2'b01) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q 0 Qbar 1", S, R, Q, Qbar);
	else 
	$error("Failed input %b%b\t Q %b Qbar %b, Expected Q 0 Qbar 1", S, R, Q, Qbar);

	//Set
	{S,R}=2'b10;
	#100ps
	assert ({Q,Qbar} == 2'b10) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q 1 Qbar 0", S, R, Q, Qbar);
	else 
	$error("Failed input %b%b\t Q %b Qbar %b, Expected Q 1 Qbar 0", S, R, Q, Qbar);

	//Latch
	{S,R}=2'b00;
	#100ps
	assert ({Q,Qbar} == 2'b10) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q 1 Qbar 0", S, R, Q, Qbar);
	else 
	$error("FAILED input %b%b\t Q %b Qbar %b, Expected Q 1 Qbar 0", S, R, Q, Qbar);

	//Illegal condition
	{S,R}=2'b11;
	#100ps
	assert ({Q,Qbar} === 2'bzz) 
	$display("PASSED input %b%b\t Q %b Qbar %b, Expected Q z Qbar z", S, R, Q, Qbar);
	else 
	$error("FAILED input %b%b\t Q %b Qbar %b, Expected Q z Qbar z", S, R, Q, Qbar);

end


endmodule