`default_nettype none
`timescale 1ns/1ns
module debounce #(
	parameter NUMBER_STABLE_CYCLES=8
	) (
    input wire clk,
    input wire reset,
    input wire button,
    output reg debounced,
    output reg strobe
);

	reg [NUMBER_STABLE_CYCLES-1:0] button_history;

	always @(posedge clk) begin
		if (reset) begin
			// reset
			debounced <= 0;
			button_history <= 0;
			strobe <= 0;
		end
		else begin
			button_history <= (button_history << 1) + button;
			strobe <= 0;

			if (button_history=={NUMBER_STABLE_CYCLES{1'b1}}) begin
				debounced <= 1;
				if(debounced==0) begin
					strobe <= 1;
				end
				
			end else if(button_history==0) begin				
				debounced <= 0;
				if(debounced==1) begin
					strobe <= 1;
				end
			end
			
			
		end
	end

endmodule
