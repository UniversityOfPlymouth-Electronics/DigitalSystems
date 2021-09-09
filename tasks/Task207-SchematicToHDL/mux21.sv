// 2 to 1 MUX

module mux21( output wire Y, input wire [1:0] D, input wire sel);

	assign Y = D[sel];
	

endmodule
