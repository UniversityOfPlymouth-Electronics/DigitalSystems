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

   //Generate clock here   

end

initial begin
   x = '0;
   @(negedge clk);
   
   //Write tests here

end

endmodule

