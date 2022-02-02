module dlatch_tb;

logic D,EN,Y1,Y2,notY1,notY2;

dlatch_b u1(Y1,notY1,D,EN);
dlatch_nb u2(Y2,notY2,D,EN);

task check(logic Y_exp, notY_exp);
	#10;

	assert (Y1 === Y_exp) 
		$display("Pass");
	else
		$error("Y1 is incorrect");

	assert (notY1 === notY_exp) 
		$display("Pass");
	else
		$error("~Y1 is incorrect");

	assert (Y2 === Y_exp) 
		$display("Pass");
	else
		$error("Y2 is incorrect");

	assert (notY2 === notY_exp) 
		$display("Pass");
	else
		$error("~Y2 is incorrect");
endtask;

initial
begin
	//Initialise
	D = 0;
	#1 EN = 1;
	#10;
	EN = 0;
	#10;

	//Check latching behaviour
	for (int i=0; i<2; i++) begin
		#1 D = 0;		
		#1 EN = 0;

		check(1'b?,1'b?);
		#1 D = 0;
		#1 EN = 1;
		check(0,1);

		#1 D = 0;
		#1 EN = 0;
		check(0,1);

		#1 D = 1;
		#1 EN = 1;
		check(1,0);

		#1 EN = 0;
		check(1,0);
	end

	//Toggle D while EN is HIGH
	EN = 1;
	check(1,0);
	D = 0;
	check(0,1);
	D = 1;
	check(1,0);
	D = 0;
	check(0,1);
	D = 1;
	
	//Toggle D while EN is LOW
	EN = 0;
	check(1'b?,1'b?);
	D = 0;
	check(1'b?, 1'b?);
	D = 1;
	check(1'b?, 1'b?);
	D = 0;
	check(1'b?, 1'b?);
	D = 1;

end

endmodule
