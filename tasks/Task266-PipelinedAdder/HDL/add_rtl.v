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
// CREATED		"Tue Mar 01 10:31:13 2022"

module add_rtl(
	CLK,
	EN,
	RESET,
	S0,
	S1,
	S2,
	A,
	B,
	C,
	D,
	Y
);


input wire	CLK;
input wire	EN;
input wire	RESET;
input wire	S0;
input wire	S1;
input wire	S2;
input wire	[7:0] A;
input wire	[7:0] B;
input wire	[7:0] C;
input wire	[7:0] D;
output wire	[7:0] Y;

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;

assign	Y = SYNTHESIZED_WIRE_1;




reg8	b2v_inst(
	.clk(CLK),
	.EN(EN),
	.reset(RESET),
	.data(SYNTHESIZED_WIRE_0),
	.out(SYNTHESIZED_WIRE_1));


muxN	b2v_inst1(
	.SEL(S0),
	.X0(SYNTHESIZED_WIRE_1),
	.X1(A),
	.Q(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst1.N = 8;


muxN	b2v_inst2(
	.SEL(S2),
	.X0(C),
	.X1(D),
	.Q(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst2.N = 8;


addN	b2v_inst3(
	.a(SYNTHESIZED_WIRE_2),
	.b(SYNTHESIZED_WIRE_3),
	.result(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst3.N = 8;


muxN	b2v_inst4(
	.SEL(S1),
	.X0(B),
	.X1(SYNTHESIZED_WIRE_4),
	.Q(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst4.N = 8;


endmodule
