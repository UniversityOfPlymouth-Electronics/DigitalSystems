module regN #(parameter N=8) (
   output logic [N-1:0] q,
   input logic clk,
   input logic load,
   input logic reset,
   input logic [N-1:0] d,
   input logic oe);
   
   // Internal storage
   logic [N-1:0] latched;
   
   // Delay only used for simulation
   assign #(5ps) q = (oe == '1) ? latched : 'z;
   
   always_ff @(posedge clk, negedge reset) begin
   
      if (reset == 1'b0) begin
         latched <= 'dz;
		end
      else if (clk == '1) begin
         if (load == '1) begin
            latched <= d;
         end
      end
            
   end
   
endmodule

