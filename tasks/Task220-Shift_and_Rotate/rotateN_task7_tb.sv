module rotateN_task7_tb;

parameter N = 8;
logic [N-1:0] X,Y;
logic DIR;

//instantiate object

rotateN #(.N(N)) u1 (Y, X, DIR);

initial
begin

	X = 8'b10101100;
	
	//rotate right
	$display("ROTATE RIGHT");
	$display("DIR = 1");
	DIR = 1;
	for (int n=0; n<N; n = n + 1)
	begin
	#10ps
	X = Y;
		
	$display("X = %b", X);
	end

	//rotate left
	$display("ROTATE LEFT");
	$display("DIR = 0");
	DIR = 0;
	for (int n=0; n<N; n = n + 1)
	begin
	#10ps
	X = Y;
		
	$display("X = %b", X);
	end

end



endmodule