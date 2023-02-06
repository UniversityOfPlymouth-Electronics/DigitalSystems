module demux_tb;

logic [7:0] YY, Y_Exp;
logic DD;
logic [2:0] SELSEL;

//instantiate element
demux u1(YY, DD, SELSEL);

//Test task (saves on repetition)
task check(logic [2:0] sel, logic d, logic [7 : 0] Y_exp);

	SELSEL = sel;
	DD = d;
	#10ps;
	assert (YY == Y_exp)
		$display("Passed for select line %b with input %b", sel, d);
	else
		$error("Failed for case select line %b with input %b. Expected %b, got %b", sel, d, Y_exp, YY);
endtask

initial
begin
	//set input
	check(3'd0, 1'b0, 8'b00000000);
	check(3'd1, 1'b0, 8'b00000000);
	check(3'd2, 1'b0, 8'b00000000);
	check(3'd3, 1'b0, 8'b00000000);
	check(3'd4, 1'b0, 8'b00000000);
	check(3'd5, 1'b0, 8'b00000000);
	check(3'd6, 1'b0, 8'b00000000);
	check(3'd7, 1'b0, 8'b00000000);

	//set input
	check(3'd0, 1'b1, 8'b00000001);
	check(3'd1, 1'b1, 8'b00000010);
	check(3'd2, 1'b1, 8'b00000100);
	check(3'd3, 1'b1, 8'b00001000);
	check(3'd4, 1'b1, 8'b00010000);
	check(3'd5, 1'b1, 8'b00100000);
	check(3'd6, 1'b1, 8'b01000000);
	check(3'd7, 1'b1, 8'b10000000);
	
	/*SELSEL = 3'b000;
	DD = 1'b0;
	Y_Exp = 8'b00000000;
	
	#10ps;
	assert (YY == Y_Exp)
		$display("Passed for select line %b with input %b", SELSEL, DD);
	else
		$error("Failed for case select line %d with input %d. Expected %b, got %b", SELSEL, DD, Y_Exp, YY);

	SELSEL = 3'b001;
	DD = 1'b1;
	Y_Exp = 8'b00000010;
	
	#10ps;
	assert (YY == Y_Exp)
		$display("Passed for select line %b with input %b", SELSEL, DD);
	else
		$error("Failed for case select line %b with input %b. Expected %b, got %b", SELSEL, DD, Y_Exp, YY);
*/

end

endmodule