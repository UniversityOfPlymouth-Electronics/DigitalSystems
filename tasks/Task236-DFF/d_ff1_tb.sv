module d_ff1_tb;

logic CLK = 0;
logic D, Q, nReset;

//Instantiate a DFF
d_ff1 u1(Q,D,CLK, nReset);

//Generate 5 clock cycles
initial begin
	CLK=0;
     	repeat(20) 
		#50ps CLK = ~CLK;  
end 

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initialise
	D = 0;
	nReset = 1;

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

	//Test for RESET = LOW
	
	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == 1) $display("PASS"); else $error("FAIL");	//Check Q
	nReset = 0;
	#10ps
	assert(Q == 0) $display("PASSED RESET TEST"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;		//Set D = 0
	@(posedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == 0) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for reset pulled low not at a clock edge
	nReset = 1;	

	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	#5ps
	nReset = 0;
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == 0) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;		//Set D = 0
	#5ps
	nReset = 0;
	@(posedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == 0) $display("PASS"); else $error("FAIL");	//Check Q
	
end
endmodule