module led_controller (input logic clk, reset, UP_PULSE, DOWN_PULSE, output logic [7:0] Q);

typedef enum int unsigned { S0 = 'b00000001, S1 = 'b00000011,
                            S2 = 'b00000111, S3 = 'b00001111,
                            S4 = 'b00011111, S5 = 'b00111111,
                            S6 = 'b01111111, S7 = 'b11111111 }  state_t;
state_t state, next_state;

function automatic state_t nextState(input state_t s);
begin
   if (s == state.last())
      nextState = state.last();
   else
      nextState = s.next();
end
endfunction

function automatic state_t prevState(input state_t s);
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
