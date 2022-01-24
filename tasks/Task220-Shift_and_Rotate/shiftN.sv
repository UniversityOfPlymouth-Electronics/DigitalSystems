module shiftN;

//logic, reg and wire are UNSIGNED by default
logic signed [7:0] X;
logic signed [7:0] Y;

//int is signed
int n;
int xx,yy;

initial
begin
	xx = -16;
	X = xx;
	
	$display("Logical Shift Left");
	for (n=0; n<=8; n++)
	begin
		Y = (X << n);
		#10ps;
		$display("  %8b << %2d\n= %8b",X, n, Y);
		$display("%2d * 2^%1d = %4d", X, n, Y);
		yy = xx * 2**n;
		assert (Y == yy) $display("OK\n"); else begin $warning("Incorrect\n"); $display("\n\n"); end
	end

	$display("Logical Shift Right");
	for (n=0; n<=8; n++)
	begin
		Y = (X >> n);
		#10ps;
		$display("  %8b >> %2d= %8b\n",X, n, Y);
		$display("%2d * 2^-%1d = %4d", X, n, Y);
		yy = xx / 2**n;
		assert (Y == yy) $display("OK\n"); else begin $warning("Incorrect\n"); $display("\n\n"); end
	end

	$display("Arithmetic Shift Left");
	for (n=0; n<=8; n++)
	begin
		Y = (X <<< n);
		#10ps;
		$display("  %8b <<< %2d= %8b\n",X, n, Y);
		$display("%2d * 2^%1d = %4d", X, n, Y);
		yy = xx * 2**n;
		assert (Y == yy) $display("OK\n"); else begin $warning("Incorrect\n"); $display("\n\n"); end
	end

	$display("Arithmetic Shift Right");
	for (n=0; n<=8; n++)
	begin
		Y = (X >>> n);
		#10ps;
		$display("  %8b >>> %2d\n= %8b",X, n, Y);
		$display("%2d * 2^-%1d = %4d", X, n, Y);		
		yy = xx / 2**n;
		assert (Y == yy) $display("OK\n"); else begin $warning("Incorrect\n"); $display("\n\n"); end

	end

end

endmodule
