module mux21(output logic Q, input logic X0, X1, SEL);

assign Q = (SEL==0) ? X0 : X1;

endmodule
