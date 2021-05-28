`default_nettype none
`timescale 1ns/1ns
module debounce #(
	parameter NUMBER_STABLE_CYCLES=8
	) (
    input wire clk,
    input wire reset,
    input wire button,
    output reg debounced
);

	reg [NUMBER_STABLE_CYCLES-1:0] button_history;

	always @(posedge clk) begin
		if (reset) begin
			// reset
			debounced <= 0;
			button_history <= 0;
		end
		else begin
			button_history <= (button_history << 1) + button;

			if (button_history=={NUMBER_STABLE_CYCLES{1'b1}}) begin
				debounced <= 1;
			end else if(button_history==0) begin
				debounced <= 0;
			end
			
			
		end
	end

endmodule
