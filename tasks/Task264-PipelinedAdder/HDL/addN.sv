module addN #(parameter N = 8) (
   output logic[N-1:0] result,
   input logic [N-1:0] a,
   input logic [N-1:0] b
);

assign result = a + b;

endmodule

