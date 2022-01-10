module priority_encoder (output logic [1:0] y, logic valid, input logic [3:0]a);

parameter OK = 1'b1;

// There are less output combinations and input
always_comb
	unique casez (a)
		4'b1??? : {y,valid} = {2'd3, OK};
		4'b01?? : {y,valid} = {2'd2, OK};
		4'b001? : {y,valid} = {2'd1, OK};
		4'b0001 : {y,valid} = {2'd0, OK};
		default : {y,valid} = {2'd0, ~OK};
	endcase
endmodule

module priority_encoder_tb;

logic [1:0] y;
logic valid;
logic [3:0] a;

priority_encoder u1(y, valid, a);

initial
begin
	for (int n=0; n<100; n=n+1) begin
		a = $urandom_range(15,0);
		#10ps;
	end
end

endmodule