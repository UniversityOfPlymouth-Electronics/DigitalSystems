module uop_nxor_tb1;

//Internal wires
reg aa;
reg bb;
reg yy;

//structural
uop_nxor u1 (yy, aa, bb);

//Here we go!
initial
begin

   aa = 1'b0;
   bb = 1'b0;
   #50ps;
   aa = 1'b0;
   bb = 1'b1;
   #50ps;
   aa = 1'b1;
   bb = 1'b0;
   #50ps;
   aa = 1'b1;
   bb = 1'b1;
   #50ps;
   $display("DONE");

end

endmodule