module mux2_structural (output logic y, input logic a, b, s);

/*
|  S  |  A  |  B  |  Y  |	Expression		|
|-------------------------------------------------------|
|  0  | 0  |  0	  |  0  |				|
|  0  |	0  |  1	  |  0  |				|
|  0  |	1  |  0	  |  1  |	~S & A & ~B		|
|  0  |	1  |  1	  |  1  |	~S & A & B		|
|  1  |	0  |  0	  |  0  |				|
|  1  |	0  |  1	  |  1  |	S & ~A & B		|
|  1  |	1  |  0	  |  0  |				|
|  1  |	1  |  1	  |  1  |	S & A & B		|

Expression for Y

Y = (~S & A & ~B) | (~S & A & B) | (S & ~A & B) | (S & A & B)

Simplified

Y = (~S & A) | (S & B)

*/

// Write HDL here

//internal wires
wire invS;
wire term_0;
wire term_1;

not u1 (invS, s);
and u2 (term_0, a, b);
and u3 (term_1, invS, a);
or u4 (y, term_0, term_1);

endmodule