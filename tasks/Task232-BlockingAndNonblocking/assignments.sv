module assignments;

logic a,b,c,y;

initial
begin
	//{a,b,c} = 3'b000;
	#10;
	a = 1;
	#10;
	b = a;
	#10;
	c = b;
	#10;	
	a <= 0;
	#10;
	b <= a;
	#10;
	c <= b;
	#10;
end


endmodule 