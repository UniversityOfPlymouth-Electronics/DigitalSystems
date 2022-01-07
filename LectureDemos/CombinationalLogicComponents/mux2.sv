// Two examples of a 2-1 multiplexer

module mux2_behavioural_v1 (output logic y, input logic a, b, s);
always_comb
	if (s)
	   y = b;	//Single line does not need begin
	else
	   y = a;

endmodule

module mux2_behavioural_v2 (output logic y, input logic a, b, s);
always_comb
	if (s) begin
	   y = b;	//Single line does not need begin
	end
	else begin
	   y = a;
        end

endmodule

module mux2_behavioural_v3 (output logic y, input logic a, b, s);
always_comb
	case (s)
		0 : begin
		   y = a;
		end
	
		1 : begin
		   y = b;
		end
	
		default : begin
		   y = 1'b?;
		end
	endcase

endmodule

module mux2_dataflow (output logic y, input logic a, b, s);

assign y = (s == 0) ? a : b;

endmodule


module mux2_tb;

logic y1, y2, y3, ydf, aa, bb, ss;

mux2_behavioural_v1 u1(y1, aa, bb, ss);
mux2_behavioural_v2 u2(y2, aa, bb, ss);
mux2_behavioural_v3 u3(y3, aa, bb, ss);
mux2_dataflow u4(ydf, aa, bb, ss);

initial
begin
	aa = 1'b1;
	bb = 1'b0;
	ss = 1'b0;
	#10ps;
	assert ((y1 == aa) && (y1 == y2) && (y2 == y3) && (y3 == ydf))
		$display("Pass");
	else
		$fatal("Error");

	ss = 1'b1;
	#10ps;
	assert ((y1 == bb) && (y1 == y2) && (y2 == y3) && (y3 == ydf))
		$display("Pass");
	else
		$fatal("Error");

end

endmodule