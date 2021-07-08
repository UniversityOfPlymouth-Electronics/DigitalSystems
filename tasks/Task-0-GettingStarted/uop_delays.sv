///////////////////////////////////////////////////////////////
// Design unit: uop_delays
//
// Filename: uop_delays.sv
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

// Demonstrates "Delay and intertial cancellation"

// Outputs are declared before inputs by convention
module uop_delays (output wire z, z_sym, z_asym, input wire x);

//Using assign with a single parameter
assign #50ps z = ~ x;

//Using a netlist with one or two parameters
not #50ps          u1(z_sym,  x);   //50ps for rising and falling output
not #(50ps, 100ps) u2(z_asym, x);   //50ps for rising; 100ps for falling

// Later we see the preferred always_comb and always_ff
endmodule
