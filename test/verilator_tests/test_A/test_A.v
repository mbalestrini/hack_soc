`default_nettype none
`timescale 1ns / 1ps

module test_A (
	input clk,
	input reset,

	input data_in,
	output data_out
	);


 	initial begin

 		$display("test module starting"); 
 		$finish; 
 	end



	reg [31:0] internal_reg;

	assign data_out = internal_reg[0];
	

	always @(posedge clk) begin
		if (reset) begin
			// reset
			internal_reg <= 0;		
		end
		else begin
			internal_reg <= internal_reg + {31'b0, data_in};


			// $display("data_in:%0h data_out:%0h internal_reg: %0h", data_in, data_out, internal_reg); 

		end
	end
endmodule