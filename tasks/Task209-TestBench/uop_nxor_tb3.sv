// ----------------------------------
// Test bench for the uop_nxor module
// ----------------------------------
//
// --------------------------------------------------
// Note the testbench module has no inputs or outputs
// --------------------------------------------------

module uop_nxor_tb3;

//Internal wires
reg aa;
reg bb;
reg yy;

reg [1:0] mt; //Minterm mt is a 2-bit value

//structural
uop_nxor u1 (yy,aa,bb);

initial
begin

	//Now using concatination
   assign {aa,bb} = mt;		//Any change to mt will have an immediate effect on aa and bb
	
	mt = 0;
   #50ps;
	mt = 1;
   #50ps;
   mt = 2;
	#50ps;
   mt = 3;	
	#50ps;


end

endmodule