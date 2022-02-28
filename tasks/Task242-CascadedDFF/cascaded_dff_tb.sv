module cascaded_dff_tb;

logic CLK, D, N_RESET;
logic [7:0] LED;

//Array of bits (input word)
logic WORD[7:0] = {1, 0, 1, 0, 1, 1, 0, 1};

//Instantiate a cascaded DFF shift register
cascaded_dff u1 (.CLK(CLK), .N_RESET(N_RESET), .DATA_IN(D), .Q(LED)); 

//Power on reset
initial begin
	N_RESET = 0;
	#1ps
	N_RESET = 1;
end

//Clock
initial begin
	CLK = 1;
	repeat(17) 
		#50ps CLK = ~CLK;
end

//Input stimulus
initial begin
	//Wait for reset to clear
	@(posedge N_RESET);

	//Generate a sequence of intput bits
	for (int n=0; n<8; n=n+1)  begin
		//Wait for negative edge to apply the external input D
		@(negedge CLK);
		//Apply the next bit
		D = WORD[n];
	end

	//Wait for rising edge of clock to observe the last bit
	@(posedge CLK);
	//Wait for the Tpd + 1ps
	#11ps;
	
	assert (LED == 8'b10101101) $display("PASSED"); else $error("FAILED");

	//Wait for negative edge so we can see this on the waveform
	@(negedge CLK);
end

endmodule

