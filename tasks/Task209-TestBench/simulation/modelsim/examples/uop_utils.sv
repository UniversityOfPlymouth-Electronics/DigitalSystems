// Various utility functions / classes / datatypes

package uop_utils;

	// This parameterised class is used to displaying truth tables
	// Parameter: Nip -> number of input bits; Nop -> number of output bits
	class TruthTable #(int Nip, int Nop);
	
	// -------------------------------------------------------------------------------
	// writeRow: Write a row of a truth table
	// -------------------------------------------------------------------------------
	// The minterm is an integer (row number) displayed in the first column
	// inputs is a packed array of inputs, size Nip
	// outputs is a packed array of outputs, size Nop
	// 
	// Example:
	// TruthTable#($size(xx),1)::writeRow(.minterm(i), .inputs(xx), .outputs(yy));
	// -------------------------------------------------------------------------------

	static function void writeRow (input int minterm, input logic[Nip] inputs, input logic [Nop] outputs);
		   $write("%4d | ", minterm);	                                         //Minterm
	      for (int n=0; n<$size(inputs); n++) $write("%b ", inputs[n]);      //Each bit of the minterm
			$write("| ");
			for (int n=0; n<$size(outputs); n++) $write("%b ", outputs[n]);      //Each bit of the output
		   $display("");	
	endfunction : writeRow



	// ------------------------PrimaryworkVlPackageuop_utils-------------------------------------------------------
	// writeRow: Write a header row for a truth table
	// -------------------------------------------------------------------------------
	// 
	// Example:
	// TruthTable#($size(xx),1)::writeHeader();
	// -------------------------------------------------------------------------------

	static function void writeHeader();
		$write("term | ");
		for (int i=Nip-1; i>=0; i--) $write("%1d ", i);
		$write("| ");
		for (int i=Nop-1; i>=0; i--) $write("%1d ", i);
		$display("");
	endfunction : writeHeader


	endclass


endpackage