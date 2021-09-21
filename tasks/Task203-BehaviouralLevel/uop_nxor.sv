module uop_nxor(output reg Y, input wire A, input wire B);


//Behavioural
always @(A or B)
begin
	if (A == B)
		Y = 1;
	else
		Y = 0;
end		

endmodule