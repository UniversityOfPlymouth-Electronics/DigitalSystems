import uop_utils::*;


module q4_tb;

logic yy;
logic [3:0] xx;

q4 u1 (yy,xx);

initial 
begin
	TruthTable#($size(xx),1)::writeHeader();
	for (int i=0; i<(2**$size(xx)); i=i+1) 
	begin 
   	xx = i;
   	#5;
		TruthTable#($size(xx),1)::writeRow(.minterm(i), .inputs(xx), .outputs(yy));
	end 
end

endmodule
