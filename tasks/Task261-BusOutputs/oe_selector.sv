module oe_selector (
   output logic [1:0] oe,
   input logic clk,
   input logic sel);
  
   typedef enum {A=0, B=1, C=2, D=4} state_t;
   state_t state = A;
   state_t next_state;
   
   always_ff @(posedge clk) begin
      state <= next_state;
   end
   
   
   always_comb begin : output_logic
      case (state) 
      A: oe = 2'b01;
      B: oe = 2'b00;
      C: oe = 2'b10;
      D: oe = 2'b00;
      endcase
   end
   
   always_comb begin : next_state_logic
      
      next_state = state;
      
      case (state) 
      A: next_state = (sel == '1) ? B : A;
      B: next_state = C;
      C: next_state = (sel == '0) ? D : C;
      D: next_state = A;
      endcase
    
   end
   
endmodule
   