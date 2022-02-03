module d_ff_tb;

logic CLK = 0;
logic D, Q;

//Instantiate a DFF
d_ff u1(Q,D,CLK);

//Generate 5 clock cycles
initial begin
	CLK=0;
     	repeat(10) 
		#50ps CLK = ~CLK;  
end 

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initialise
	D = 0;

	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == D) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;		//Set D = 0
	@(posedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == D) $display("PASS"); else $error("FAIL");	//Check Q
end
endmodule