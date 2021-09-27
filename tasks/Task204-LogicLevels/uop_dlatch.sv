module uop_dlatch(
	output reg Y, 	//Output
	input wire A, 	//Data input
	input wire LE, 	//Latch Enable
	input wire OE	//Output Enable
);

//D-Latch, written using Verilog (we will look at SystemVerilog improvements later)

reg yy;				//Note this is type reg

//Continuous Assignment
assign Y = OE ? yy : 1'bz;	// Y is High Impedance is OE == 0

//Behavioural HDL
always @(A, LE)			// Update if A or LE change
begin
	if (LE == 1'b1)		// Set yy to A if LE is equal to 1, otherwise latch (stay unchanged)
		yy <= A;
end

endmodule