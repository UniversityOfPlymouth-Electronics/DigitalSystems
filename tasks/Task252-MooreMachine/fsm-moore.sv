// SystemVerilog state machine implementation that uses enumerated types.
// Altera recommends using this coding style to describe state machines in SystemVerilog.
// In Quartus Prime integrated synthesis, the enumerated type
// that defines the states for the state machine must be
// of an unsigned integer type. If you do not specify the
// enumerated type as int unsigned, a signed int type is used by default.
// In this case, the Quartus Prime integrated synthesis synthesizes the design, but
// does not infer or optimize the logic as a state machine.
//

module enum_fsm1 (input logic clk, reset, X, output logic Q);

enum int unsigned { S0 = 1, S1 = 2, S2 = 4 } state, next_state;

always_comb begin : next_state_logic
	
	//Default is to stay in the current state
	next_state = state;
	
	//Conditionally update state
	case(state)
		
	S0:	if (X == '1) 
				next_state = S1;
	
	S1: 	next_state = S2;
	
	S2: 	if (X == '0) 
				next_state = S0; 
		
	endcase
end
	
always_ff @(posedge clk or negedge reset) begin

	if (reset == '0)
		state <= S0;
	else
		state <= next_state;
end
	
always_comb begin : output_logic
	case(state)
	S0:	Q = 0;
	S1:	Q = 1;
	S2:	Q = 0;
	endcase
end

	
endmodule





