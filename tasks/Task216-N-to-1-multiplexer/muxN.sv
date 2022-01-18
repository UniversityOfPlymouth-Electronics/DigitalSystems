module muxN #(parameter N=4) (output logic out, input logic [N-1:0] x, logic [$clog2(N)-1:0] s);

 assign out = x[s];

endmodule