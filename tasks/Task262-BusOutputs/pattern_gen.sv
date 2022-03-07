module pattern_gen(
   output logic [7:0] Q1,
   output logic [7:0] Q2,
   input logic clk,
   input logic areset);

logic [7:0] p1 = 8'd1;
logic [7:0] p2 = 8'h66;

assign Q1 = p1;
assign Q2 = p2;

always_ff @(posedge clk, negedge areset) begin
   if (areset == '0) begin
        p1 <= 8'd1;
        p2 <= 8'h66; 
   end else begin
      p1 <= {p1[6:0], p1[7]};
      p2 <= {p2[6:0], p2[7]};
   end
end


endmodule

