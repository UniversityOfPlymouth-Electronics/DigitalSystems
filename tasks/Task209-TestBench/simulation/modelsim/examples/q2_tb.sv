import uop_utils::*;

module q2_tb;

	logic [3:0] aa;
   logic [3:0] bb;
   logic [7:0] yy;

	//Unit under test
	q2 u1(yy, aa, bb);

	initial
	begin
		logic [7:0] xx;
		TruthTable#(8,8)::writeHeader;
		for (int i=0; i<(2**$size(xx)); i++)
		begin
			xx = i;
			aa = xx[7:4];
			bb = xx[3:0];
   		#5;
			TruthTable#(8,8)::writeRow(.minterm(i), .inputs({aa,bb}), .outputs(yy));
		end
	end
endmodule