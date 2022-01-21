module shiftN;

//logic, reg and wire are UNSIGNED by default
logic signed [7:0] X,Y;

//int is signed
int n;

initial
begin
	X = 8'b10100101;

	$display("Logical Shift Left");
	for (n=0; n<=8; n++)
	begin
		Y = (X << n);
		#10ps;
		$display("  %8b << %2d\n= %8b\n",X, n, Y);
	end

	$display("Logical Shift Right");
	for (n=0; n<=8; n++)
	begin
		Y = (X >> n);
		#10ps;
		$display("  %8b >> %2d\n= %8b\n",X, n, Y);
	end

	$display("Arithmetic Shift Left");
	for (n=0; n<=8; n++)
	begin
		Y = (X <<< n);
		#10ps;
		$display("  %8b <<< %2d\n= %8b\n",X, n, Y);
	end

	$display("Arithmetic Shift Right");
	for (n=0; n<=8; n++)
	begin
		Y = (X >>> n);
		#10ps;
		$display("  %8b >>> %2d\n= %8b\n",X, n, Y);
	end

end

endmodule
