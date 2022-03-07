module regN_tb;

logic clk, load, reset;
logic [7:0] d,q;

regN u1 (.q(q), .clk(clk), .load(load), .d(d), .reset(reset));

initial begin
	reset = '0;
	#1ps;
	reset = '1;
end

initial begin
	@(posedge reset);
	clk = '0;
	repeat(20) #50ps clk = ~clk;
end

initial begin
	@(posedge clk);
	#6ps 
	d = 8'h00;
	load = '0;
   assert (q===8'd0) $display("PASSED"); else $error("Regster failed to be initialised"); 


	@(posedge clk);
	#6ps 
	d = 8'hFF;
	load = '1;
   assert (q===8'd0) $display("PASSED"); else $error("Regster failed to be initialised"); 

	@(posedge clk);
	#6ps 
	load = '0;
   assert (q===8'hFF) $display("PASSED"); else $error("Regster failed to be write"); 

	@(posedge clk);
	#6ps 
	d = 8'h0;
   assert (q===8'hFF) $display("PASSED"); else $error("Regster failed to be ignore the inputs");

	@(posedge clk);
	@(posedge clk);

	@(posedge clk);
	#6ps 
	d = 8'hAA;
	load = '1;
   assert (q===8'hFF) $display("PASSED"); else $error("Regster failed"); 

	@(posedge clk);
	#6ps 
	load = '0;
   assert (q===8'hAA) $display("PASSED"); else $error("Regster failed to be write"); 

 

end

endmodule




