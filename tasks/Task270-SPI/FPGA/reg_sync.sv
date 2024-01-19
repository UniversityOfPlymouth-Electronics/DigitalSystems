module pulse_controller (
   input logic clk, 
   input logic reset, 
   input logic rx, 
   output logic PULSE_LD,
   output logic START);

   
   typedef enum int unsigned { S0 = 0, S1 = 1, S2 = 2, S3 = 4, S4 = 8 } state_t;

	state_t state = S0;
	state_t next_state = S0;

   always_comb begin : next_state_logic
      next_state = state;
      case(state)
         S0: next_state = (rx == '0) ? S0 : S1;
         S1: next_state = (rx == '1) ? S1 : S2;
         S2: next_state = S3;
			S3: next_state = S4;
         S4: next_state = S0;
      endcase
   end
   
   always_comb begin
      PULSE_LD = '0;
      START = '0;
   
      case(state)
         S0: ;
         S1: ;
         S2: PULSE_LD = '1;
			S3: ;
         S4: START    = '1;
      endcase
   end
   
   
   always_ff@(posedge clk or negedge reset) begin
      if(reset == 1'b0)
         state <= S0;
      else
         state <= next_state;
   end
   
endmodule
