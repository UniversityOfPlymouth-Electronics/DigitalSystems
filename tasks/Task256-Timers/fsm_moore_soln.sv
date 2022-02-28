
module fsm_moore_soln (input logic clk, reset, X, RDY, output logic Q, START);

typedef enum int unsigned { S0 = 1, S1 = 2, S2 = 4, S3 = 8, S4 = 16, S5 = 32 } state_t;
state_t state, next_state;

always_comb begin : next_state_logic

   //Default is to stay in the current state
   next_state = state;

   //Conditionally update state
   case(state)

   S0:   if (X == '1)
            next_state = S1;

   S1:   next_state = S2;

   S2:   if (RDY == '1)
            next_state = S3;
            
   S3:   if (X == '0)
            next_state = S4;
            
   S4:   next_state = S5;
   
   S5:   if (RDY == '1)
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
   S0:   {Q,START} = {'0,'0};
   S1:   {Q,START} = {'1,'1};
   S2:   {Q,START} = {'0,'0};
   S3:   {Q,START} = {'0,'0};
   S4:   {Q,START} = {'0,'1};
   S5:   {Q,START} = {'0,'0};
   default: {Q,START} = {'0,'0};
   endcase
end

endmodule
