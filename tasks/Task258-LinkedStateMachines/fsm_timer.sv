module fsm_timer #(parameter int unsigned N=256) (output logic READY, input logic CLK, START, RESET, N_RESET);

   typedef int unsigned state_t;

   state_t state;
   state_t next_state;
   
   //Next state logic
   always_comb begin : next_state_logic

      //Default - stay put
      next_state = state;

      //Update state - COMPLETE THIS
      case (state)
      0:       next_state = ;       //First state
      (N-1):   next_state = ;       //End state
      default: next_state = ;       //Intermediate states
      endcase
   end

   //Output logic -  COMPLETE THIS
   always_comb begin : output_logic
      case (state)
      (N-1):   ;
      default: ;
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
