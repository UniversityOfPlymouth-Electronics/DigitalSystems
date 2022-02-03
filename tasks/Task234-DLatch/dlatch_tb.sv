module dlatch_tb;

logic Q, D, EN, R;

dlatch u1(Q, D, EN, R);

task check(logic expected);
	#10;
	assert (Q == expected)
		$display("Passed for D=%d, EN=%d", D, EN);
	else
		$error("Failed for D=%d, EN=%d", D, EN);
endtask

initial
begin
	//Reset condition
	R = 0;
	EN = 1;
	D = 0;
	check(0);

	D = 1;
	check(0);

	D = 0;
	check(0);

	EN = 0;
	check(0);

	//Initial condition
	R = 1;
	check(0);

	//Ignores input when EN is low
	D = 1;
	check(0);
	D = 0;
	check(0);

	//Latching high : with input D HIGH, pull EN HIGH then LOW - Q should remain HIGH
	D = 1;		//Set D HIGH
	check(0);	
	EN=1;		//Enable HIGH (should latch a HIGH)
	check(1);
	EN=0;		//Enable LOW
	check(1);
	D = 0;		//Set D LOW (output should not change)
	check(1);

	//Latching low : with input D LOW, pull EN HIGH then LOW - Q should remain LOW
	// Write code below

end
	


endmodule