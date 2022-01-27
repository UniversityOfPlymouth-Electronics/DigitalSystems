module mux2_tb;

logic y1, y2, y3, ydf, ystr, aa, bb, ss;

mux2_behavioural_v1 u1(y1, aa, bb, ss);
mux2_behavioural_v2 u2(y2, aa, bb, ss);
mux2_behavioural_v3 u3(y3, aa, bb, ss);
mux2_dataflow u4(ydf, aa, bb, ss);
mux2_structural u5(ystr, aa, bb, ss);

initial
begin
	//Set inputs
	aa = 1'b1;
	bb = 1'b0;

	//Select input 0 (aa)
	ss = 1'b0;
	#10ps;

	//Check all outputs are equal and equal to aa
	assert ((y1 == aa) && (y1 == y2) && (y2 == y3) && (y3 == ydf) && (ydf == ystr))
		$display("Pass");
	else
		$error("Error");

	//Select input 1 (bb)
	ss = 1'b1;
	#10ps;

	//Check all outputs are equal and equal to bb
	assert ((y1 == bb) && (y1 == y2) && (y2 == y3) && (y3 == ydf) && (ydf == ystr))
		$display("Pass");
	else
		$error("Error");

end

endmodule