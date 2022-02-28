module d_ff_tb_solution;

logic CLK = 0;
logic D, n_res, Q;

//Instantiate a DFF
d_ff1 u1(Q,D,CLK,n_res);

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
	n_res = 0;
	#10ps;
	n_res = 1;

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

	//Test reset when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == D) $display("PASS"); else $error("FAIL");	//Check Q
	#10ps;	
	n_res = 0;
	#15ps;
	n_res = 1;
	#1 assert(Q == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q

	//Test D is ignored when reset
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	n_res = 0;
	D = 1;
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	@(negedge CLK);	//Wait for negative edge of clock
	n_res = 1;
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock

end

always @(negedge n_res) begin
	#1 assert(Q == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	
end

endmodule
