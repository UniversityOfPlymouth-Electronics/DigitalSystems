// ADDER - from ch3 Zwolinski
module adder #(parameter N = 4) (output logic [N-1:0] Sum, output logic Cout, input logic [N-1:0] A, B, input logic Cin);

always_comb
	{Cout, Sum} = A + B + Cin;

endmodule

module mul #(parameter N = 4) (output logic [2*N - 1 : 0] Y, input logic [N-1:0] A, B);

	always_comb
	begin
		Y = A*B;
	end
endmodule


// RIPPLE ADDER - from ch3 Zwolinski
module fulladder (output logic sum, cout, input logic a, b, cin);
always_comb
begin
	sum = a ^ b ^ cin;
	cout = a & b | a & cin | b & cin;
end
endmodule

module ripple #(parameter N = 4) (output logic [N-1:0] Sum, output logic Cout, input logic [N-1:0] A, B, input logic Cin);
	logic [N-1:1] Ca;
	
	genvar i;

	//First stage (lsb)
	fulladder f0 (Sum[0], Ca[1], A[0], B[0], Cin);

	generate for (i = 1; i < N-1; i++) 
		begin : f_loop
			fulladder fi (Sum[i], Ca[i+1], A[i], B[i], Ca[i]);
		end
	endgenerate

	//msb
	fulladder fN (Sum[N-1], Cout, A[N-1], B[N-1], Ca[N-1]);
endmodule


// TEST BENCH
module adder_tb;

	logic [3:0] P, Q;
	logic [4:0] SUM;
	logic Cin;
	
	adder u1(SUM[3:0], SUM[4], P, Q, Cin);
	
	initial 
	begin
	  for (int c = 0; c<= 1; c = c + 1) begin
            Cin = c;
	    for (int i=0; i<=7; i = i + 1) begin
              for (int j=i; j<=7; j = j + 1) begin
                P = i;
                Q = j;
                #10ps;
		assert (SUM == (c+i+j)) $display("PASS"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM);
              end
            end
	  end
	end
endmodule


// This example uses a wildcard
module mul_tb;

	parameter N=3;
	logic [N-1:0] A, B;
	logic [2*N-1:0] Y;
	
	//Wildcard can be used if the names match perfectly
	mul #N u1(.*);
	
	initial 
	begin

	    for (int i=0; i<2**N; i = i + 1) begin
              for (int j=i; j<2**N; j = j + 1) begin
                A = i;
                B = j;
                #10ps;
		assert (Y == (i*j)) $display("PASS"); else $display("ERROR %d * %d <> %d", i, j, Y);
              end
            end

	end
endmodule