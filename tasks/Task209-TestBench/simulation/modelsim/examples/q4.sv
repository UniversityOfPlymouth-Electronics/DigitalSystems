module q4 #(parameter delay = 0)  ( output wire Y, input wire[3:0] X);

wire i0, i1, a0, a1;

not #delay u1 (i0, X[0]);
not #delay u2 (i1, X[2]);

and #delay u3 (a0, X[1], X[3]);
and #delay u4 (a1, i0, i1);

or #delay u5 (Y, a0, a1);

endmodule

