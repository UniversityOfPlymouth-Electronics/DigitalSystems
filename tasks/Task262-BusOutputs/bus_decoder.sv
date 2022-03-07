
module bus_decoder #(parameter N=8, parameter B=$clog2(N), parameter WORDSIZE=16) (
   output logic [WORDSIZE-1:0] DOUT,
   output logic [N-1:0] reg_sel,
   input logic [WORDSIZE-1:0] DIN,
   input logic EN,
   input logic [B-1:0] addr,
   input logic clk
   );
   

   typedef enum {OFF=0, NOP=1, ON=2} state_t;
   
   state_t state, next_state;
   
   always_ff @(posedge clk) begin
      state <= next_state;
   end
   
   always_comb begin : next_state_logic
   
      next_state = state;
      
      case (state)
      
         OFF:     next_state = (EN == '1) ? NOP : OFF;
         NOP:     next_state = ON;
         ON:      next_state = (EN == '0) ? OFF : ON;
         
      endcase
   end
   

      always_comb begin : output_logic
   
      DOUT = 'z;
      reg_sel = 'z;
      
      case (state)
      
         OFF:     ; 
         NOP:     begin reg_sel[addr] = 1'b1; DOUT = DIN; end
         ON:      ;
      endcase
   end

   
   
endmodule
   