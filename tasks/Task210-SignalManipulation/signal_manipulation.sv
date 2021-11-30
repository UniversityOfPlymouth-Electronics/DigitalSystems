// ----------------------------------
// Test bench for the uop_nxor module
// ----------------------------------
//
// --------------------------------------------------
// Note the testbench module has no inputs or outputs
// --------------------------------------------------

module signal_manipulation;

//Internal wires
logic aa;
logic bb;
logic yy;

logic [7:0] data; 					//Packed Array 
logic arrayOfBits [7:0];			//Unpacked Packed array of bits
logic [3:0] arrayOfNibbles[7:0];	//Unpacked array of 4-bit values

initial
begin

	data = 8'b10101100;
	#50ps;

	for (int n=0; n<7; n=n+1)
	begin
		arrayOfBits[n] = 0;				//Unpacked array of single bits
		arrayOfNibbles[n] = 4'b0000;	//Unpacked array of 4-bit values
		data[n] = 0;						//Packed array (Bit wise access)
	end

	#20ps;

   data = 8'b10101111;					//Packed array
	//arrayOfBits = 8'b11111111;			//Illegal

	#20ps;

	//Concatination
	data = {4'b1111, 4'b0101};
	{aa,bb,data} = 10'b1010101010;


end

endmodule