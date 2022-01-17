module mux2_behavioural_v1_tb;

logic y1, aa, bb, ss;

mux2_behavioural_v1 u1(y1, aa, bb, ss);


initial
begin
	//Set the inputs
	aa = 1'b1;
	bb = 1'b0;

	//Select the aa input
	ss = 1'b0;

	//Wait for output to update
	#10ps;

	//Check the output
	assert (y1 == aa)
		$display("Pass");
	else
		$fatal("Error");

	//Select the bb input
	ss = 1'b1;

	//Wait for the output to update
	#10ps;

	//Check the output
	assert (y1 == bb)
		$display("Pass");
	else
		$fatal("Error");

end

endmodule