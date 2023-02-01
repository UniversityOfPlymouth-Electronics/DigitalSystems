module mux4_behavioural_v2_task7 (output logic out, input logic [3:0] x, logic [1:0] s);
   assign out = x[s];
endmodule