module lookup(output logic [7:0] Q, input logic A, input logic B);

//Tag this on the end
/* synthesis ram_init_file = " my_init_file.mif" */
	
(* ram_init_file = "romvals.hex", romstyle = "M9K" *) logic [7:0] rom[0:3];	

logic [6:0] rom2[0:1] = {
	7'b0010010, 
	7'b1010111
};
	
	
	
logic [1:0] addr;

assign addr = {A, B};

always_comb
	Q = rom[addr];
endmodule