
//Active LOW output enable
module triz_buffer(output logic y, input logic x, OE);

assign y = OE ? 'z : x;

endmodule


// From Zwolinski - look closely in Quartus. Note that y is type wire
module threemux4 (output wire y, input logic a, b, c, d, s0, s1);
	assign y = (~s0  && ~s1) ? a : 'z;
	assign y = ( s0  && ~s1) ? b : 'z;
	assign y = (~s0  &&  s1) ? c : 'z;
	assign y = ( s0  &&  s1) ? d : 'z;
endmodule


module triz_buffer_tb(output logic y, input logic x, OE);

logic yy, xx, oe;

triz_buffer u1 (yy,xx,oe);

initial
begin
	//OE = 0 (enabled)
	oe = 0;
	
	xx = 0;
	#10ps;
	assert (yy === 0) $display("PASS"); else $display("FAIL");

	xx = 1;
	#10ps;
	assert (yy === 1) $display("PASS"); else $display("FAIL");
	
	//OE = 1 (disabled)
	oe = 1;
	
	xx = 0;
	#10ps;
	assert (yy === 1'bz) $display("PASS"); else $display("FAIL");

	xx = 1;
	#10ps;
	assert (yy === 1'bz) $display("PASS"); else $display("FAIL");
	
end
endmodule


