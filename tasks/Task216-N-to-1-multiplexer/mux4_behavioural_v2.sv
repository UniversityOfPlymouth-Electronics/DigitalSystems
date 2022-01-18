module mux4_behavioural_v2 (output logic out, input logic [3:0] x, logic [1:0] s);

always_comb
	if (s == 0)
	   out = x[0];	//Single line does not need begin
	else if (s == 1)
	   out = x[1];
	else if (s == 2)
	   out = x[2];
	else
	   out = x[3];
endmodule