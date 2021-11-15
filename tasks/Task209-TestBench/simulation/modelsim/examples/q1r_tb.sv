import uop_utils::*;

module q1r_tb;

	logic aa, bb, yy;

	//Unit under test
	q1r u1(yy, aa, bb);

	initial
	begin
		logic [1:0] xx;
		TruthTable#(2,1)::writeHeader;
		for (int i=0; i<4; i++)
		begin
			xx = i;
			aa = xx[0];
			bb = xx[1];
   		#5;
			TruthTable#(2,1)::writeRow(.minterm(i), .inputs(xx), .outputs(yy));
		end
	end
endmodule