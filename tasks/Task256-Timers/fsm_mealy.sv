module fsm_mealy (input logic clk, reset, X, RDY, output logic Q, START);

typedef enum int unsigned { S0 = 1, S1 = 2} state_t;
state_t state, next_state;

always_comb begin : next_state_logic

   //Default is to stay in the current state
   next_state = state;

   //Conditionally update state
   case(state)

   S0:   if (X == '1)
            next_state = S1;

   S1:   if (X == '0)
            next_state = S0;
   default:
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
   S0:   Q = (X == 0) ? 0 : 1;
   S1:   Q = 0;
   default: Q = 0;
   endcase
end

endmodule
