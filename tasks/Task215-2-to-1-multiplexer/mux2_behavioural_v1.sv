module mux2_behavioural_v1 (output logic out, input logic a, b, s);

always_comb
	if (s == 0)
	   out = a;	//Single line does not need begin
	else
	   out = b;

endmodule