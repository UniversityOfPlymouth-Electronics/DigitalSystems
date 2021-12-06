///////////////////////////////////////////////////////////////
// Design unit: uop_nand2
// 
// Filename: uop_nand2.sv
//
// Description: 2 input and gate with an additional NOR output
//            : Inputs are of type wire
//
// System: IEEE 1800-2005
//
// Author: Nicholas Outram, University of Plymouth
//
// Revision: 1.0 18/05/2021
///////////////////////////////////////////////////////////////

// Demonstrates "Continuous assignment"

// Outputs are declared before inputs by convention
module uop_nand2 (output wire z, input wire x,y);

//Wire assignment
assign z = ~(x & y);	//Operators based on C

// Later we see the preferred always_comb and always_ff
endmodule


