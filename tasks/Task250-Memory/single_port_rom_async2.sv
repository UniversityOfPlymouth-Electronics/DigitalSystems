module single_port_rom_async2
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=3)
(
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0] = '{
	
		8'b10101010, 8'b11110000, 8'b00001111, 8'b11001100,
		8'b11100111, 8'b00011000, 8'b10110111, 8'b11101101
		
		}; /* synthesis romstyle = "M9K" */

	assign q = rom[addr];

endmodule
