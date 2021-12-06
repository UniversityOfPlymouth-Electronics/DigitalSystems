///////////////////////////////////////////////////////////////
// Design unit: uop_and2
//
// Filename: uop_and2_en.sv
//
// Description: 2 input and gate with an additional NAND output and enable pin
//            : Inputs are of type wire
//            : if en is low, then the output is high impedance
//
// System: IEEE 1800-2005
//
// Author: Nicholas Outram
//
// Revision: 1.0 18/05/2021
///////////////////////////////////////////////////////////////

// Demonstrates "Continuous assignment"

// Outputs are declared before inputs by convention
module uop_and2_en (output wire z, notz, input wire x,y,en);

// Wire assignment
assign z = en ? x & y : 'z;    //Operators based on C
assign notz = en ? ~z : 'z;

// Later we see the preferred always_comb and always_ff
endmodule
