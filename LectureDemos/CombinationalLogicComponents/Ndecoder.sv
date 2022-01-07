module decoderN #(parameter N = 3) (output logic [N-1:0] Y, input logic [$clog2(N)-1:0] S);

always_comb
	Y = 1'b1 << S;

endmodule

module dev_decoder (output logic CS_ADC, CS_DAC, CS_RAM, CS_SPI, input logic [2:0] ADDR);

always_comb
begin
  unique casez (ADDR)
    3'b000 : {CS_ADC, CS_DAC, CS_RAM, CS_SPI} = 4'b1000;
    3'b001 : {CS_ADC, CS_DAC, CS_RAM, CS_SPI} = 4'b0100;
    3'b010 : {CS_ADC, CS_DAC, CS_RAM, CS_SPI} = 4'b0010;
    3'b011 : {CS_ADC, CS_DAC, CS_RAM, CS_SPI} = 4'b0001;
    3'b1?? : {CS_ADC, CS_DAC, CS_RAM, CS_SPI} = 4'b0000; 
  endcase
end
endmodule

module decoderN_tb;

logic [15:0] YY;
logic [3:0]  SS;

decoderN #(.N(16)) u1(YY, SS);

	initial 
	begin
		for (int n=0; n<16; n = n+1) begin
			SS = n;
			#10ps;
		end
	end
endmodule

module dev_decoder_tb;

logic [2:0] ADDR;
logic CS_ADC, CS_DAC, CS_RAM, CS_SPI;

dev_decoder u1(CS_ADC, CS_DAC, CS_RAM, CS_SPI, ADDR);

	initial
	begin
		for (int n=0; n<8; n=n+1) begin
			ADDR = n;
			#10ps;
		end
	end

endmodule
 
