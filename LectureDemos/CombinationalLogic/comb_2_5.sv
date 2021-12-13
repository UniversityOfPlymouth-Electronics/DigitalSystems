module comb_2_5 (output wire Y, input wire A, B, C);

	wire m2, m5, notA, notB, notC;

	not #5ps u1 (notA, A);
	not #5ps u2 (notB, B);
	not #5ps u3 (notC, C);

	and #5ps u4(m2, notA, B, notC);
	and #5ps u5(m5, A, notB, C);

	or #5ps u6(Y, m2, m5);

endmodule