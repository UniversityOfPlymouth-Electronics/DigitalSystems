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
// CREATED		"Thu Feb 10 11:25:11 2022"

module cascaded_dff(
	CLK,
	N_RESET,
	DATA_IN,
	Q
);


input wire	CLK;
input wire	N_RESET;
input wire	DATA_IN;
output wire	[7:0] Q;

wire	ares;
wire	ck;
wire	D;
wire	[7:0] led;





d_ff	b2v_inst11(
	.D(D),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[7]));


d_ff	b2v_inst12(
	.D(led[7]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[6]));


d_ff	b2v_inst13(
	.D(led[6]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[5]));


d_ff	b2v_inst14(
	.D(led[4]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[3]));


d_ff	b2v_inst15(
	.D(led[3]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[2]));


d_ff	b2v_inst16(
	.D(led[2]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[1]));


d_ff	b2v_inst17(
	.D(led[1]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[0]));


d_ff	b2v_inst18(
	.D(led[5]),
	.CLK(ck),
	.n_Reset(ares),
	.Q(led[4]));

assign	Q = led;
assign	D = DATA_IN;
assign	ck = CLK;
assign	ares = N_RESET;

endmodule
