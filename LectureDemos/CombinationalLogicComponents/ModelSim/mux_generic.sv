
// $clog2 - ceiling of log2
module mux16 (output logic Y, input logic[15:0] X, logic[3:0] sel);

assign Y = X[sel];

endmodule

module muxN #(parameter N = 16) (output logic Y, input logic[N-1:0] X, logic[$clog2(N)-1:0] sel);

assign Y = X[sel];

endmodule


// Testbench
module mux16_tb;

logic Y1, Y2;
logic [15:0] XX;
logic [3:0] S;

mux16 u1(Y1, XX, S);
muxN #(.N (16)) u2(Y2, XX, S); 

initial
begin
	XX = 16'b1100110010101010;
	for (int n=0; n<16; n = n + 1) begin
		S = n;
		#10ps;
	end
end


endmodule