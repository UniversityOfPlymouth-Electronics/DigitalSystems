import uop_utils::*;


module q5_tb;

logic yy;
logic [3:0] xx;
logic [1:0] sel;

q5 u1 (.Y(yy), .D(xx), .S(sel));

initial 
begin
	TruthTable#($size({xx,sel}),1)::writeHeader();
	
	//Asymmetic test
	xx = 4'b1011;

	//Iterate the select input
	for (int i=0; i<(2**$size(sel)); i=i+1) 
	begin 
   	sel = i;
   	#5;
		TruthTable#($size(xx)+$size(sel),1)::writeRow(.minterm(i), .inputs({sel, xx}), .outputs(yy));
	end 
end

endmodule
