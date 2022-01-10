module threemux4 (output wire y, input logic a, b, c, d, s0, s1);
	assign y = (~s0  && ~s1) ? a : 'z;
	assign y = ( s0  && ~s1) ? b : 'z;
	assign y = (~s0  &&  s1) ? c : 'z;
	assign y = ( s0  &&  s1) ? d : 'z;
endmodule