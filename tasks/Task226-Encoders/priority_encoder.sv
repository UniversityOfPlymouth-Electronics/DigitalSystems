module priority_encoder (output logic [1:0] y, logic valid, input logic [3:0]a);

parameter OK = 1'b1;

// There are less output combinations than input
always_comb
	unique casez (a)
		4'b1??? : {y,valid} = {2'd3, OK};
		4'b01?? : {y,valid} = {2'd2, OK};
		4'b001? : {y,valid} = {2'd1, OK};
		4'b0001 : {y,valid} = {2'd0, OK};
		default : {y,valid} = {2'd0, ~OK};
	endcase
endmodule

