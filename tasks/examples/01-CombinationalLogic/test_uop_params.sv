///////////////////////////////////////////////////////////////
// Design unit: test_uop_params
// 
// Filename: test_uop_params.sv
//
// Description: 2 input and gate with an additional NAND output
//            : Inputs are of type wire
//
// System: IEEE 1800-2005
//
// Author: Nicholas Outram
//
// Revision: 1.0 18/05/2021
///////////////////////////////////////////////////////////////

// Demonstrates "Continuous assignment"

// Outputs are declared before inputs by convention
module test_uop_params;

reg a, b;
wire y;
uop_params #(20ps) u1(y,a,b);

initial
	begin
	a = '0;
	b = '0;
	#100ps 
	a = '1;
	b = '1;
	#100ps	a = '0;
	#100ps  b = '0;
	#100ps  a = '1; b = '1;
	end

// Later we see the preferred always_comb and always_ff
endmodule