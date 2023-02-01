module task210Challenge3 #(parameter delay=5ps)(output wire Y, input wire A, input wire B, input wire C);

//internal wires
wire term0;
wire term1;

//Challenge 3
not #delay u1 (notA, A);
not #delay u2 (notB, B);
not #delay u3 (notC, C);
and #delay u4 (term0, notA, B, notC);
and #delay u5 (term1, A, notB, C);
or #delay u6 (Y, term0, term1);

endmodule