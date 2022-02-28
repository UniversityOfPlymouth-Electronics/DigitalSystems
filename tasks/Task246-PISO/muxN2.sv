module muxN2 #(parameter N = 4) (output logic [N-1:0] Q, input logic [N-1:0] X0, input logic [N-1:0] X1, input logic SEL);

assign Q = (SEL==0) ? X0 : X1;

endmodule
