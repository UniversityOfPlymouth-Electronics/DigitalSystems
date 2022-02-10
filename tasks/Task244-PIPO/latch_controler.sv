module latch_controler(output logic Y, input logic CLK, input logic N_RESET);

logic [3:0] count;

always_ff @(posedge CLK, negedge N_RESET) begin
	if (N_RESET==0) begin
		count = 0;
		Y <= 0;
	end
	else begin
		count <= count + 1;
		if (count == 7)
			Y <= 1;
		else
			Y <= 0;
	end

end

endmodule
