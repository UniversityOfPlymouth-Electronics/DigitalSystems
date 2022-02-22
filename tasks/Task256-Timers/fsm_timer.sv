module fsm_timer #(parameter int unsigned N=4) (output logic RDY, input logic CLK, START, N_RESET);

   typedef enum int unsigned {READY='b001, STARTED='b010, STOPPED='b100} state_t;

   state_t state, next_state;
   int unsigned count=N-1;

   //Next state logic
   always_comb begin : next_state_logic

      //Default - stay put
      next_state = state;

      //Update state
      case (state)
      READY:   next_state = (START == 1) ? STARTED : READY;
      STARTED: next_state = (count == 1) ? STOPPED : STARTED;
      STOPPED: next_state = READY;
      default: next_state = READY;
      endcase
   end

   //Output logic
   always_comb begin : output_logic
      case (state)
      READY:   RDY = '0;
      STARTED: RDY = '0;
      STOPPED: RDY = '1;
      default: RDY = '0;
      endcase
   end

   //Update state
   always_ff @(posedge CLK or negedge N_RESET) begin : update_state
   if(~N_RESET) 
      state <= READY;
   else
      state <= next_state;
   end

   //Update count
   always_ff @(posedge CLK or negedge N_RESET) begin : update_count
	if(~N_RESET) 
	   count <= N-1;
	else
	   case (state)
	   READY:   count <= N-1;
	   STARTED: count <= count - 1;
	   STOPPED: ;
	   default: count <= N-1; 
           endcase
   end
endmodule
