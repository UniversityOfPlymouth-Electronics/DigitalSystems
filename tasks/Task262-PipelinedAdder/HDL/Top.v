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
// CREATED		"Tue Mar 01 07:59:08 2022"

module Top(
	CLK,
	RESET,
	DOADD,
	A,
	B,
	C,
	D,
	Y
);


input wire	CLK;
input wire	RESET;
input wire	DOADD;
input wire	[7:0] A;
input wire	[7:0] B;
input wire	[7:0] C;
input wire	[7:0] D;
output wire	[7:0] Y;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;


always @(A or B or C or D) begin
	$display("top:");
	$display("A=%b",A);
	$display("B=%b",B);
	$display("C=%b",C);
	$display("D=%b",D);
end


add_rtl	b2v_inst(
	.EN(SYNTHESIZED_WIRE_0),
	.S0(SYNTHESIZED_WIRE_1),
	.S1(SYNTHESIZED_WIRE_2),
	.CLK(CLK),
	.S2(SYNTHESIZED_WIRE_3),
	.RESET(RESET),
	.A(A),
	.B(B),
	.C(C),
	.D(D),
	.Y(Y));


controller	b2v_inst2(
	.clk(CLK),
	.GO(DOADD),
	.reset(RESET),
	.EN(SYNTHESIZED_WIRE_0),
	.S0(SYNTHESIZED_WIRE_1),
	.S1(SYNTHESIZED_WIRE_2),
	.S2(SYNTHESIZED_WIRE_3));


endmodule
