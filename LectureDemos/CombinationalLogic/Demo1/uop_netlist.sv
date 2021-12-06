///////////////////////////////////////////////////////////////
// Design unit: uop_and2
// 
// Filename: uop_netlist.sv
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

/* This is a block comment

There are some primitive gates in system verilog:
	and, nand, or, nor, xor, xnor, not, buf	

As sv is case sensitive, these MUST be lower case.
*/

// Outputs are declared before inputs by convention. You can also have inout
module uop_netlist (output wire y, input wire a, b);
wire nota, notb, node1, node2;

//Wire netlist
not u1 (nota, a);
not u2 (notb, b);
and u3 (node1, a, notb);
and u4 (node2, b, nota);
or u5 (y, node1, node2);

endmodule