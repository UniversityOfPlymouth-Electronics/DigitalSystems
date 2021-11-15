import uop_utils::*;


module q4r_tb;

logic yy;
logic [2:0] xx;

q4r #(5ps) u1 (yy,xx);

initial 
begin
	TruthTable#($size(xx),1)::writeHeader();
	for (int i=0; i<(2**$size(xx)); i=i+1) 
	begin 
   	xx = i;
   	#25ps;
		TruthTable#($size(xx),1)::writeRow(.minterm(i), .inputs(xx), .outputs(yy));
	end 

	//Demonstration of a hazzard
	xx = 3'b000;
	#25ps;
	xx = 3'b111;
	#25ps;
	xx = 3'b000;
	#25ps;
end

endmodule
