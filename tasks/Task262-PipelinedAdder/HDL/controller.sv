module controller (
   output logic EN,
   output logic S0,
   output logic S1,
   output logic S2,
   input logic clk,
   input logic GO,
   input logic reset
);

   typedef enum {A, B, C, D} state_t;
   state_t state, next_state;
   
   //Update state
   always_ff @(posedge clk, negedge reset) begin
      if (reset == '0) begin
         state <= D;
      end
      else
         state <= next_state;
   end
   
   //Next state logic
   always_comb begin
   
      //Default to self
      next_state = state;
      
      case (state)
      A: next_state = B;
      B: next_state = C;
      C: next_state = D;
      D: next_state = (GO == '1) ? A : D;
      default: next_state = D;
      endcase
   
   end
   
   //Output Logic
   always_comb begin
   
      //Default output
      {EN, S0, S1, S2} = 4'd0;
      
      //Assert high conditionally
      case (state)
      A: {S0,EN} = 'b11;
      B: {S1,EN} = 'b11;
      C: {S1,S2,EN} = 'b111;
      D: ;
      default: ;
      endcase
      
   end

endmodule
