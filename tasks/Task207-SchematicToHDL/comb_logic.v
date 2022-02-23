// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed Feb 23 14:01:06 2022"

module comb_logic(
	KEY0,
	KEY1,
	MODE,
	LED0
);


input wire	KEY0;
input wire	KEY1;
input wire	MODE;
output wire	LED0;

wire	[1:0] data;





mux21	b2v_inst(
	.sel(MODE),
	.D(data),
	.Y(LED0));

assign	data[1] = KEY1;
assign	data[0] = KEY0;

endmodule
