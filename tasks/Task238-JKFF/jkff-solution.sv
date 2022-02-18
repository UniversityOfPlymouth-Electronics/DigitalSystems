// JK Flip-Flop
module jkff(output logic Q, input logic J, K, CLK);

always @(negedge CLK) begin

	case({J,K})
		2'b10 : Q <= 1'b1;
		2'b01 : Q <= 1'b0;
		2'b11 : Q <= ~Q;
	endcase
end

endmodule

