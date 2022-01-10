
//Example of a function
module MyComponent(output logic [3:0] Y, input logic [3:0] X, logic DIR);

function int inc(int u);
begin
   if (u<15) 
	inc = u + 1;
   else
	inc = 15;
   end
endfunction

function int dec(int u);
begin
   if (u>0)
	dec = u - 1;
   else
	dec = 0;
   end
endfunction

always_comb
	if (DIR == 0)
		Y = dec(X);
	else
		Y = inc(X); 

endmodule


module MyComponent_tb;

logic [3:0] x,y;
logic d = 0;

//Instantiate a component
MyComponent u1 (y,x,d);

task automatic check(logic [3:0] inp, expected);
begin
	x = inp;
	#10ps;
	assert (y == expected)
		$display("PASS");
	else
		$display("FAIL for x=%d. Expected output was %d, actual output was %d", x, expected, y);
end
endtask

initial
begin
	//Decrement
	$display("Testing decrement");
	d = 0;

	//Edge cases
	check(4'd0, 4'd0);
	check(4'd1, 4'd0);
	check(4'd15,4'd14);

	//Midrange
	check(4'd7, 4'd6);

	//Increment
	$display("Testing increment");
	d = 1;

	//Edge cases
	check(4'd14, 4'd15);
	check(4'd15, 4'd15);
	check(4'd0, 4'd1);

	//Midrange
	check(4'd7, 4'd8);
end


endmodule



