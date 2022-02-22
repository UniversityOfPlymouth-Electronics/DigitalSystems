// SystemVerilog state machine implementation that uses enumerated types.
// Altera recommends using this coding style to describe state machines in SystemVerilog.
// In Quartus Prime integrated synthesis, the enumerated type
// that defines the states for the state machine must be
// of an unsigned integer type. If you do not specify the
// enumerated type as int unsigned, a signed int type is used by default.
// In this case, the Quartus Prime integrated synthesis synthesizes the design, but
// does not infer or optimize the logic as a state machine.
//

module led_controller (input logic clk, reset, UP_PULSE, DOWN_PULSE, output logic [7:0] Q);

typedef enum int unsigned { S0 = 32'b00000001, S1 = 32'b00000011, 
                            S2 = 32'b00000111, S3 = 32'b00001111, 
                            S4 = 32'b00011111, S5 = 32'b00111111, 
									 S6 = 32'b01111111, S7 = 32'b11111111 }  STATE_t;
STATE_t state, next_state;

function STATE_t nextState(input STATE_t s);
begin
	if (s == state.last())
		nextState = state.last();
	else
		nextState = s.next();
end
endfunction

function STATE_t prevState(input STATE_t s);
begin
	if (s == state.first())
		prevState = state.first();
	else
		prevState = s.prev();
end
endfunction

initial begin
	state = S0;
end

always_comb begin : next_state_logic
	
	//Default is to stay in the current state
	next_state = state;
	
	//Conditionally update state
	if (UP_PULSE)
		next_state = nextState(state);
	else if (DOWN_PULSE) 
		next_state = prevState(state);
		
	
end
	
always_ff @(posedge clk or negedge reset) begin

	if (reset == '0)
		state <= state.first();
	else
		state <= next_state;
end
	
always_comb begin : output_logic
	Q = state;
end

	
endmodule





