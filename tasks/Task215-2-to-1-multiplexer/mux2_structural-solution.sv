module mux2_structural_solution (output logic y, input logic a, b, s);

//Internal wires
wire m1,m2,not_s;

//Instantiate and connect logic gates
not u1(not_s, s);
and u2(m1, not_s, a);
and u3(m2, s, b);
or  u4(y, m1, m2);


//Probably clearer is to use continuous assignment
//assign not_s = ~s;
//assign m1 = not_s & a;
//assign m2 = s & b;
//assign y = m1 | m2;

endmodule