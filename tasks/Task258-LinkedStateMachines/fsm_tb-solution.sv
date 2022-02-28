module fsm_tb;

logic clk, x, reset, Q_moore, Q_mealy;

//Instantiate both FSM types
fsm_mealy u1(.clk(clk), .reset(reset), .X(x), .Q(Q_mealy));
fsm_moore u2(.clk(clk), .reset(reset), .X(x), .Q(Q_moore));

initial begin
   reset = '0;
   #10ps reset = '1;
end

initial begin

   //Initial value of clock
   clk = '1;

   //Wait to come out of reset
   @(posedge reset);

   //Generate clock
   repeat(20)
      #50ps clk = ~clk;

end

initial begin
   x = 0;
   @(negedge clk);

   @(posedge clk);
   #1ps assert(Q_moore == Q_mealy) $display("Pass"); else $warning("Outputs differ");

   @(negedge clk);
   x = 1;

   @(posedge clk);
   #1ps assert(Q_moore == Q_mealy) $display("Pass"); else $warning("Outputs differ");

   @(posedge clk);
   #1ps assert(Q_moore == Q_mealy) $display("Pass"); else $warning("Outputs differ");

   @(negedge clk);
   x = 0;

   @(posedge clk);
   #1ps assert(Q_moore == Q_mealy) $display("Pass"); else $warning("Outputs differ");

   @(posedge clk);
   #1ps assert(Q_moore == Q_mealy) $display("Pass"); else $warning("Outputs differ");

end

endmodule

