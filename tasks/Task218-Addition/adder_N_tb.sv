module adder_N_tb;

	parameter N = 3;

	logic [N-1:0] P, Q, P2, Q2;
	logic [N-1:0] SUM1, SUM2;
	logic Cout1, Cout2;
	logic Cin1, Cin2;
	
	//Most significant bit of SUM = Cout
	adder_N #(.N(N)) u1(SUM1, Cout1, P, Q, Cin1);
	ripple_adder #(.N(N)) u2(SUM2, Cout2, P2, Q2, Cin2);

	initial 
	begin
	  automatic int S;
	  for (int c = 0; c<= 1; c = c + 1) begin
            Cin1 = c;
		Cin2 = Cin1;
	    for (int i=0; i<2**N; i = i + 1) begin
              for (int j=i; j<2**N; j = j + 1) begin
                P = i;
		P2 = P;
                Q = j;
		Q2 = Q;
		S = c + i + j;	//Integer summation
                #10ps;
		assert ({Cout1,SUM1} == S) $display("PASS - Adder_N"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM1);
		assert ({Cout2,SUM2} == S) $display("PASS - Ripple Adder"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM2);
              end
            end
	  end
	end
endmodule
