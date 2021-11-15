module q4r #(parameter delay = 0)  ( output wire Y, input wire[2:0] X);

wire i0, i1, i2, a0, a1;

not #delay u0 (i0, X[0]);
not #delay u1 (i1, X[1]);
not #delay u2 (i2, X[2]);

and #delay u3 (a0, X[0], X[1], X[2]);
and #delay u4 (a1, i0, i1, i2);

or #delay u5 (Y, a0, a1);

endmodule

