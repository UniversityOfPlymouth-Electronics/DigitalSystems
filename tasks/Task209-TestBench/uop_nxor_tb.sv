module uop_nxor_tb;

//Internal wires
reg a;
reg b;
reg y;

//structural
uop_nxor u1 (y,a,b);

//Here we go!
initial
begin

   a = 1'b0;
   b = 1'b0;
   #50ps assert (y==1'b1) else $error("Failed for 0,0");
   a = 1'b0;
   b = 1'b1;
   #50ps assert (y==1'b0) else $error("Failed for 0,1");
   a = 1'b1;
   b = 1'b0;
   #50ps assert (y==1'b0) else $error("Failed for 0,1");
   a = 1'b1;
   b = 1'b1;
   #50ps assert (y==1'b1) else $error("Failed for 1,1");
   $display("DONE");

   {a,b} = 2'b00;
   #50ps;

end

endmodule