// ----------------------------------
// Test bench for the uop_nxor module
// ----------------------------------
//
// --------------------------------------------------
// Note the testbench module has no inputs or outputs
// --------------------------------------------------

module uop_nxor_tb2;

//Internal wires
reg aa;
reg bb;
reg yy;

//structural
uop_nxor u1 (yy, aa, bb);

initial
begin

   {aa,bb} = 2'b00;
   #50ps;
   {aa,bb} = 2'b01;
   #50ps;
   {aa,bb} = 2'b10;
   #50ps;
   {aa,bb} = 2'b11;
   #50ps $display("DONE");

end

endmodule