module lookup(output logic [7:0] Q, input logic A, input logic B);

//Tag this on the end
/* synthesis ram_init_file = " my_init_file.mif" */
	
(* ram_init_file = "romvals.hex" *) logic [7:0] rom[0:3];	
	
logic [1:0] addr;

assign addr = {A, B};

always_comb
	Q = rom[addr];
endmodule