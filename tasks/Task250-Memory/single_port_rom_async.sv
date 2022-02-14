module single_port_rom_async
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=2)
(
	input [(ADDR_WIDTH-1):0] addr,
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

	assign q = rom[addr];

endmodule
