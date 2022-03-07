module por (
   output logic reset,
   input logic clk
   );
   
  logic[2:0] count = '0;

  always_ff @(posedge clk) begin
	reset <= '0;
   if (count == 'b111)
      reset <= '1;
   else
      count <= count + 3'b001;
   
  end
  
endmodule
  