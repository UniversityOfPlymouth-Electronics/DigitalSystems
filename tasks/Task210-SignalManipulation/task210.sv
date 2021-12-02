module task210;

//Internal wires
logic aa;
logic bb;
logic yy;

//Packed arrays
logic [7:0] databyte; 				//Packed Array 
logic [3:0] datanibble;				//Packed array

// Unpacked arrays
logic arrayOfBits [7:0];			//Unpacked Packed array of bits
logic [3:0] arrayOfNibbles[7:0];	//Unpacked array of 4-bit values

// Used for testing
int testN = 0;

// Tasks to help reduce repetition in the testbench
task passed;
	$display("Passed test %d", testN);
	testN = testN + 1;
endtask : passed

task failed;
	$display("Failed test %d", testN);
	testN = testN + 1;
endtask : failed

// ************************************************************
// * Test bench - statements in an initial block are sequential
// ************************************************************

// See solution.sv for the solutions

initial
begin
	
	// PACKED ARRAYS

	// 0 - Set aa to binary 1 (this one is done for you)
	aa = 1'b1;
	#10ps assert (aa==1) passed(); else failed();
	
	// 1 - Set bb to binary 0 using a decimal literal
	// WRITE SOLUTION HERE
	#10ps assert (bb==1) passed(); else failed();

	// 2 - Set databyte to binary 10101111 using a binary literal
	// WRITE SOLUTION HERE
	#10ps assert (databyte==8'hAF) passed(); else failed();

	// 3 - Set bit 6 of databyte to 1
	// WRITE SOLUTION HERE
	#10ps assert ((databyte & 8'b01000000) != 8'd0) passed(); else failed();

	// 4 - Set bits 3..0 of databyte to binary 0000
	// WRITE SOLUTION HERE
	#10ps assert ((databyte & 8'h0F) == 4'h0) passed(); else failed();

	// 5 - Set datanibble to equal the most significant bits of databyte
	// WRITE SOLUTION HERE
	#10ps assert (datanibble == 4'b1110) passed(); else failed();

	// 6 - Using a single statement (concatenation), set aa, bb and yy to bits 2,1 and 0 of datanibble
	// WRITE SOLUTION HERE
	#10ps assert ((aa == 1) && (bb == 1) && (yy == 0))  passed(); else failed();

	// 7 - Set the most significant 4 bits of databyte to datanibble, and the least significant 4 bits to the inverse of datanibble
	// WRITE SOLUTION HERE
	#10ps assert (databyte == 8'b1110_0001)  passed(); else failed();

	// UNPACKED ARRAYS

	// 8 - Initialise arrayOfBits so that all values are equal to 0 - do not use the for-loop
   // WRITE SOLUTION HERE
	// Test - write above this line
	for (int n=0; n<8; n = n+1)
	begin
		#10ps assert (arrayOfBits[n] == 1'b0)  passed(); else failed();
	end

	// 9 - Set elements 1 and 0 to binary 1 using a single statement
	// WRITE SOLUTION HERE
	#10ps assert ((arrayOfBits[1] == 1) &&  (arrayOfBits[0] == 1))  passed(); else failed();

	// 10 -In one statement, initialise all elements in arrayOfNibbles with the binary value 1010
	// WRITE SOLUTION HERE
	// Test - only write above
	for (int n=0; n<8; n = n+1)
	begin
		#10ps assert (arrayOfNibbles[n] == 4'b1010)  passed(); else failed();
	end	 
end



endmodule