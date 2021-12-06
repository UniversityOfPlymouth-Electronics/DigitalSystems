///////////////////////////////////////////////////////////////
// Design unit: uop_and2
//
// Filename: uop_and2.sv
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
module uop_and2 (output wire z, notz, input wire x,y);

//Wire assignment
assign z = x & y;    //Operators based on C
assign notz = ~z;

// Later we see the preferred always_comb and always_ff
endmodule
