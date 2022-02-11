module parallel_to_serial #(parameter N=8) (output logic SOUT, input logic CLK, EN, SHIFT, N_RESET, logic [N-1:0] DATAW);

logic [N-1:0] sr;

//Output is the lsb of the shift register
assign SOUT = sr[0];

always_ff @(posedge CLK, negedge N_RESET) begin
	//Asynchronous Reset should take priotity
	if (N_RESET == 0) begin
		sr = '0;
	end 
	else begin
		//Do nothing unless enabled (simply latch)
		if (EN == 1) begin
			case (SHIFT) 
				0 : sr <= DATAW;			//Load
				1 : sr <= {1'b0 , sr[N-1 : 1]};		//Shift
			endcase
		end
	end
end

endmodule

