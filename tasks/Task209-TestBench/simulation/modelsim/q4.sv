module q4( output wire Y, input wire[3:0] X);

wire i0, i1, a0, a1;

not u1 (i0, X[0]);
not u2 (i1, X[2]);

and u3 (a0, X[1], X[3]);
and u4 (a1, i0, i1);

or u5 (Y, a0, a1);

endmodule

