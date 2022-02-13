module SyncRAM #(parameter M = 4, N = 8)(output logic [N-1:0] Qout, input logic [M-1:0] Address, input logic [N-1:0]Data, input logic WE, Clk);

(* ramstyle = "M9K" *) logic [N-1:0] mem [0:(1 << M)-1];


always_comb
	Qout = mem[Address];

always_ff @(posedge Clk)
	if (WE)
		mem[Address] <= Data;

endmodule
