module custom_function_tb;

logic A, B, Y1, Y2, Y3;

custom_function #(.f(0)) u0(Y1, A, B);
custom_function #(.f(1)) u1(Y2, A, B);
custom_function #(.f(2)) u2(Y3, A, B);

initial
begin

	// WRITE YOUR CODE HERE

end

endmodule
