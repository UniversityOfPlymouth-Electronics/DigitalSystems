module decoder_N #(parameter N = 8, M = $clog2(N)) (	output logic [N-1:0] Y, input logic [M-1 : 0] SEL);
												
	always_comb
		Y = 1'b1 << SEL;
													
endmodule

module decoder_8 (	output logic [7:0] Y, input logic [2:0] SEL);
												
	always_comb
		case(SEL)
		3'd0 : Y = 8'b00000001;
		3'd1 : Y = 8'b00000010;
		3'd2 : Y = 8'b00000100;
		3'd3 : Y = 8'b00001000;
		3'd4 : Y = 8'b00010000;
		3'd5 : Y = 8'b00100000;
		3'd6 : Y = 8'b01000000;
		3'd7 : Y = 8'b10000000;
		endcase
													
endmodule	

module decoder_dc (	output logic [7:0] Y, input logic [2:0] SEL);
												
	always_comb
		casez(SEL)
		3'b000 : Y = 8'b10101010;
		3'b001 : Y = 8'b01010101;
		3'b010 : Y = 8'b00110011;
		3'b011 : Y = 8'b11001100;
		3'b100 : Y = 8'b11100111;
		3'b101 : Y = 8'b00011000;
		3'b11? : Y = 8'b00000000;
		endcase
													
endmodule										