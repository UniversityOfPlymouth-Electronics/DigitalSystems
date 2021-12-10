module highZgate (Y, OE, A);
  input wire A;
  input wire OE;
  output wire Y;
  
  assign Y = OE ? A : 1'bz;
	
endmodule
