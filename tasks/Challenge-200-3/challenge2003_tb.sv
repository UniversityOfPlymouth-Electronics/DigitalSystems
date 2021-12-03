module challenge2003(output logic Y, input logic A, B, C);

	not #5ps u1(notA, A);
	not #5ps u2(notB, B);
	not #5ps u3(notC, C);
	
	and #5ps u4(mt2, notA, B, notC);
	and #5ps u5(mt5, A, notB, C);

	or #5ps u6(Y, mt2, mt5);

endmodule 
