import uop_utils::*;

module q2_tb;

	logic [3:0] aa, [3:0] bb, [7:0] yy;

	//Unit under test
	q2 u1(yy, aa, bb);

	initial
	begin
		logic [7:0] xx;
		TruthTable#(8,8)::writeHeader;
		for (int i=0; i<4; i++)
		begin
			xx = i;
			aa = xx[3:0];
			bb = xx[1];
   		#5;
			TruthTable#(2,1)::writeRow(.minterm(i), .inputs(xx), .outputs(yy));
		end
	end
endmodule