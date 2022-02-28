
module fsm_moore_soln (input logic CLK, N_RESET, X, READY, output logic RESET, START, Y);

typedef enum int unsigned { IDLE = 1, ST = 2, HD = 4, DT=8 } state_t;
state_t state, next_state;

always_comb begin : next_state_logic

   //Default is to stay in the current state
   next_state = state;

   //Conditionally update state
   case(state)

   IDLE:   if (X == '1)
            next_state = ST;

   ST:   next_state = HD;

   HD:   if (X == '0)
            next_state = IDLE;
         else if (READY == '1) 
            next_state = DT;
            
   DT:   if (X == '0)
            next_state = IDLE;
            
   default:
         next_state = IDLE; 
        

   endcase
end

always_ff @(posedge CLK or negedge N_RESET) begin

   if (N_RESET == '0)
      state <= IDLE;
   else
      state <= next_state;
end

always_comb begin : output_logic
   case(state)
   IDLE:    {RESET,START,Y} = {'1, '0,'0};
   ST:      {RESET,START,Y} = {'0, '1,'0};
   HD:      {RESET,START,Y} = {'0, '0,'0};
   DT:      {RESET,START,Y} = {'0, '0,'1};   
   default: {RESET,START,Y} = {'1, '0,'0};
   endcase
end

endmodule
