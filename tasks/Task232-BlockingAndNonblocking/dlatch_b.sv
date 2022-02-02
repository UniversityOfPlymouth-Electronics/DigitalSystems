module dlatch_b (output logic Y, notY, input logic D, EN);

always @(D,EN)
begin
	if (EN == 1) begin
		Y    = D;	
		notY = ~Y;
	end 
end

endmodule 
