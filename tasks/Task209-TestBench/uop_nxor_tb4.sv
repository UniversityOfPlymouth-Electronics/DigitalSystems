// ----------------------------------
// Test bench for the uop_nxor module
// ----------------------------------
//
// --------------------------------------------------
// Note the testbench module has no inputs or outputs
// --------------------------------------------------

module uop_nxor_tb4;

//Internal wires
reg aa;
reg bb;
reg yy;

reg [1:0] mt; //Minterm mt is a 2-bit value

//structural
uop_nxor u1 (yy,aa,bb);

initial
begin

	//Now using another style
   assign {aa,bb} = mt;		//Any change to mt will have an immediate effect on aa and bb
	
	//Add automatic checking of the outputs using assert
	mt = 0;
   #50ps assert (yy==1) $display("Passed %b", mt); else $error("Failed for %b", mt);
	mt = 1;
   #50ps assert (yy==0) $display("Passed %b", mt); else $error("Failed for %b", mt);
   mt = 2;
	#50ps assert (yy==0) $display("Passed %b", mt); else $error("Failed for %b", mt);
   mt = 3;	
	#50ps assert (yy==1) $display("Passed %b", mt); else $error("Failed for %b", mt);
	#50ps;

	//If we expand the last one, it might be clearer
	/*
	#50ps;
   assert (yy==1) 
		$display("Passed %b", mt); 
	else 
		begin		// For multiline, you need a begin and end
		$error("Failed for %b", mt);
		$display("Please check uop_nxor.sv");
		end
	*/
	
end

endmodule