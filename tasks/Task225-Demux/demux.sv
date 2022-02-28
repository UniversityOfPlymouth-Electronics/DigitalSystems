module demux (output logic [7:0] Y, input logic D, input logic [2:0] SEL);

always_comb
	unique casez ({D,SEL})
		4'b0??? : Y = 8'd0;
		4'b1000 : Y = 8'b00000001;
		4'b1001 : Y = 8'b00000010;
		4'b1010 : Y = 8'b00000100;
		4'b1011 : Y = 8'b00001000;
		4'b1100 : Y = 8'b00010000;
		4'b1101 : Y = 8'b00100000;
		4'b1110 : Y = 8'b01000000;
		4'b1111 : Y = 8'b10000000;

	endcase

endmodule

