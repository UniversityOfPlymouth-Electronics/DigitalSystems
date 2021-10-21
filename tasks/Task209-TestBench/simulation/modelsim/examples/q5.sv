module q5 (output wire Y, input wire [3:0] D, input wire [1:0] S);

int sel;

assign sel = S;
assign Y = D[sel];

endmodule
