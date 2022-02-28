module fsm_timer_soln #(parameter int unsigned N=256) (output logic READY, input logic CLK, START, RESET, N_RESET);

   typedef int unsigned state_t;

   state_t state=N-2;
   state_t next_state;
   
   //Next state logic
   always_comb begin : next_state_logic

      //Default - stay put
      next_state = state;

      //Update state
      case (state)
      0:       next_state = (START == 1) ? 1 : 0;           //First state
      (N-1):   next_state = (RESET == 1) ? 0 : (N-1);       //End state
      default: next_state = (RESET == 1) ? 0 : (state + 1); //Intermediate states
      endcase
   end

   //Output logic
   always_comb begin : output_logic
      case (state)
      (N-1):   READY = '1;
      default: READY = '0;
      endcase
   end

   //Update state
   always_ff @(posedge CLK or negedge N_RESET) begin : update_state
   if(~N_RESET) 
      state <= 0;
   else
      state <= next_state;
   end


endmodule
