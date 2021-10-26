import uop_utils::*;

module q6_tb;

logic yy;
logic [2:0] xx;

q6 u1 (yy,xx[2], xx[1], xx[0]);

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
	xx = 2;
	#25ps;
	xx = 5;
	#25ps;
end

endmodule


/*

| A | B | C | | Y |
| - | - | - | - | - |
| 0 | 0 | 0 | | 0 |
| 0 | 0 | 1 | | 0 |
| 0 | 1 | 0 | | 1 |
| 0 | 1 | 1 | | 0 |
| 1 | 0 | 0 | | 0 |
| 1 | 0 | 1 | | 1 |
| 1 | 1 | 0 | | 0 |
| 1 | 1 | 1 | | 0 |

*/