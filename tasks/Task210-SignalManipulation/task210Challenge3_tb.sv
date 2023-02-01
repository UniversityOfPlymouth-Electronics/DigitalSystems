module task210Challenge3_tb;

//internal wires
logic A;
logic B;
logic C;
logic Y;

// Used for testing
int testN = 0;

// Tasks to help reduce repetition in the testbench
task passed;
	$display("Passed test %d", testN);
	testN = testN + 1;
endtask : passed

task failed;
	$error("Failed test %d", testN);
	testN = testN + 1;
endtask : failed

//structural
task210Challenge3 u1 (Y,A,B,C);

//challenge 3 test bench
initial
begin

{A,B,C} = 3'b000;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b001;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b010;
#50ps;	assert (Y==1) passed(); else failed();

{A,B,C} = 3'b011;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b100;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b101;
#50ps;	assert (Y==1) passed(); else failed();

{A,B,C} = 3'b110;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b111;
#50ps;	assert (Y==0) passed(); else failed();

{A,B,C} = 3'b010;
#100ps;	assert (Y==1) passed(); else failed();

{A,B,C} = 3'b101;
#100ps;	assert (Y==1) passed(); else failed();

end

endmodule