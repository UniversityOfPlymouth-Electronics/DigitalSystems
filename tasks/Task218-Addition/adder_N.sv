//module adder_N #(parameter N = 4) (output logic [N-1:0] Sum, logic Cout, input logic [N-1:0] A, B, logic Cin);

module adder_N #(parameter N = 4) (Sum, Cout, A, B, Cin);

//Use the more 'vertical' syntax to fit on the page
output logic [N-1:0] Sum;
output logic Cout;
input logic [N-1:0] A, B;
input logic Cin;

always_comb
	{Cout, Sum} = A + B + Cin;

endmodule