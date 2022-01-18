module mux4_behavioural_v1 (output logic out, input logic a, b, c, d, logic [1:0] s);

always_comb
	if (s == 0)
	   out = a;	//Single line does not need begin
	else if (s == 1)
	   out = b;
	else if (s == 2)
	   out = c;
	else
	   out = d;

endmodule


