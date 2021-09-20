module uop_nxor(output wire Y, input wire A, input wire B);

//Internal wires
wire Ainv;
wire Binv;
wire term0;
wire term3;

//Place and connect gates
not u1 (invA, A);
not u2 (invB, B);
and u3 (term0, invA, invB);
and u4 (term3, A, B);
or  u5 (Y, term0, term3);

endmodule