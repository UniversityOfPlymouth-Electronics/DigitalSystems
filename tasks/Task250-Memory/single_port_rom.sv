module single_port_rom
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=3)
(
	input [(ADDR_WIDTH-1):0] addr,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0]; 

	// for *some* FPGAs, the following will sythesize. 
	// See Quartus II Handbook, Vol I, "Integrated Synthesis"
	initial
	begin
		$readmemb("single_port_rom_init.txt", rom);
	end

	always @ (posedge clk)
	begin
		q <= rom[addr];
	end

endmodule
	
	
