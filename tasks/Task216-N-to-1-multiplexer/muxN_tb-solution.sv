module muxN_tb;

//Internal signals for testing
logic y;
logic [7:0] x;
logic [2:0] ss; //2 bit signal

//Instantiate the component under test
muxN #(.N(8)) u1(y, x, ss);


initial
begin
	//Unpacked array of expected (correct) outputs. Automatic means this has local scope
	automatic logic expected[8] = {0,0,1,1,0,1,0,1};

	//Set inputs (note the direction)
	x = 8'b10101100;

	//Iterate over all input sequences
	for (int n=0; n<8; n = n + 1) begin
		//Set the select line
		ss = n;

		//Add a delay so that the outputs update
		#10ps;

	        //Check output is the expected value
    	        assert (y == expected[n])
                  //Note how $display and $error can be used much like printf in C
                  $display("Passed test %d, output=%d, expected=%d", n, y, expected[n]);
                else
                   $error("Error for test %d: expected %d and got %d", n, expected[n], y);		
	end
end

endmodule