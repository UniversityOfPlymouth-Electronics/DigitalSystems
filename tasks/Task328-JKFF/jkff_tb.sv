module jkff_tb;

logic J,K,CLK,Q;

//Instantiate Unit Under Test (UUT)
jkff u1(Q,J,K,CLK);

initial
begin
	repeat(20) #50ps CLK = ~CLK;
end

initial begin
	{J,K} = 2'b00;

	@(posedge CLK);
	@(negedge CLK);
	
	// Set Q HIGH
	@(posedge CLK);
	{J,K} = 2'b10;
	@(negedge CLK);
	
	// Latch
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);	

	// Set Q LOW
	@(posedge CLK);
	{J,K} = 2'b01;
	@(negedge CLK);
	
	// Latch
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);	


endmodule

