module addr_counter #(parameter N=8) (output logic [N-1:0] Q, output logic RW, input logic CLK);

logic [N-1:0] count_reg = 0;
assign Q = count_reg;

logic rw = 1;
assign RW = rw;

always_ff @(posedge CLK) begin
	if (count_reg == '1)
		rw = ~rw;
		
	count_reg <= count_reg + 1;
	
end


endmodule
