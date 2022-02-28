module reset_block(output logic n_reset, input logic clk, locked);

int counter = 0;

always_ff @(negedge clk)
begin
	if (locked == 0)
		n_reset = 0;
	else begin
			if (counter<65535) begin
				n_reset <= 0;
				counter <= counter + 1;
			end
			else
				n_reset <= 1;
	end 
	
end

endmodule
