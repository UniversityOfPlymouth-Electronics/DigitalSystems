module rotateN #(parameter N=8) (output logic[N-1:0] Y, input logic[N-1:0] X, logic DIR);

//Rotate right when DIR == 1
assign Y = (DIR == 1) ? { X[0], X[N-1:1] } : { X[N-2:0], X[N-1] };

endmodule

