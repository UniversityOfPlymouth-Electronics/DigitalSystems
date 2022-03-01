module reg8(
   output logic [7:0] out,
   input logic clk,
   input logic EN,
   input logic reset,
   input logic [7:0] data);
   
   logic [7:0] latched;
   
   assign #(10ps) out = latched;
   
   always_ff @(posedge clk, negedge reset) begin
   
      if (reset == '0) begin
         latched <= 'd0;
		end
      else if (clk == '1) begin
         if (EN == '1) begin
            $display("reg8: Setting out = %b", data);
            latched <= data;
         end
      end
            
   end
   
endmodule
