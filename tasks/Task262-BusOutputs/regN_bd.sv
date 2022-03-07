module regN_bd #(parameter N=16) (

   inout logic databus,
   input logic clk,
   input logic load,
   input logic reset,
   input logic oe
);

   logic [N-1:0] latched;
   
   // Delay only used for simulation
   assign #(5ps) databus = (oe == '1) ? latched : 'z;
   
   always_ff @(posedge clk, negedge reset) begin
   
      if (reset == 1'b0) begin
         latched <= 'd0;
		end
      else if (clk == '1) begin
         if (load == '1) begin
            latched <= databus;
         end
      end
            
   end
   
endmodule



/*
entity reg8 is
   generic( W	: natural  :=	8 );	
   port ( 
      clk     : in    std_logic;      --Clock
      load    : in    std_logic;      --Clock enable
      reset   : in    std_logic;      --Async reset
      databus : inout std_logic_vector(W-1 downto 0);	
      oe      : in    std_logic       --Output enable
   );
end entity



*/