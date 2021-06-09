`default_nettype none
`timescale 1ns/10ps

module rom_stream_loader#(
    parameter DATA_WIDTH=16,
	parameter ADDRESS_WIDTH = 16
    )(
    input clk,
	input reset,

	// Loader nets
	input load,
    input [DATA_WIDTH-1:0] input_data,
	output load_recevied,
	output ack,


	// ROM nets
	input rom_busy,
	input rom_initialized,
	output reg rom_request,
	output reg [DATA_WIDTH-1:0] output_data,
	output [ADDRESS_WIDTH-1:0] output_address

);

reg writing;
reg [ADDRESS_WIDTH-1:0] current_address;
reg ack;
reg load_recevied;
wire rom_receive_ready;


assign output_address = current_address;
assign rom_receive_ready = !rom_busy && rom_initialized;

always @(posedge clk) begin

	if(reset) begin
		current_address <= {ADDRESS_WIDTH{1'b0}};
		ack <= 1'b0;
		rom_request <= 1'b0;
		writing <= 1'b0;
		load_recevied <= 1'b0;
	end else begin

		ack <= 1'b0;
		load_recevied <= 1'b0;
		

		if(rom_request) begin
			if(rom_busy) begin
				rom_request <= 1'b0;
				writing <= 1'b1;				
			end 
		end else if(writing) begin
			if(!rom_busy) begin
				// Finished writing to ROM
				writing <= 1'b0;
				ack <= 1'b1;
				// Advance ROM address
				current_address <= current_address + 1'b1;
			end
		end else if(load && rom_receive_ready) begin
			output_data <= input_data;
			rom_request <= 1'b1;	
			load_recevied <= 1'b1;		
		end
	end
	

end


`ifdef FORMAL
    // register for knowing if we have just started
    reg f_past_valid = 0;
    // start in reset
    initial assume(reset);
    initial assume(current_address==0);
    always @(posedge clk) begin 

		
    	f_past_valid <= 1;

		if(f_past_valid) begin
			
			COVER_WRITING: cover(writing);
			COVER_REQUEST: cover(rom_request);
			COVER_ACK: cover(ack);
			COVER_LOAD_RECEIVED: cover(load_recevied);

			COVER_FEW_WRITES: cover(current_address == 'h7);

			//COVER_RESTART_ADDRESS: cover($past(current_address)!=0 && $rose(reset) && rom_busy);
			COVER_RESTART_ADDRESS: cover($past(current_address)!=0 && current_address==0);
			
			if($past(rom_initialized)) 
				assume(rom_initialized);

			if(load_recevied) begin
				ASSERT_LOAD_RECEVIED: assert($past(rom_receive_ready));
			end
			
			if($past(ack) && !ack) begin
				assume($changed(input_data));//!=$past(input_data));
			end
			
			if(rom_request) begin
				assume(rom_request && rom_busy);
			end

			
			//if(!rom_busy && $past(rom_busy)) begin
			if($fell(rom_busy)) begin
				assume($past(rom_busy,2) && $past(rom_busy,3) && $past(rom_busy,4) && $past(rom_busy,5));
			end

			if(!$past(reset) && !reset && ($past(current_address)!='hffff) && $changed(current_address)) begin
				ASSERT_ADDRESS_INCREMENT: assert(current_address == ($past(current_address)+1));
			end

			if($rose(rom_request)) begin
				ASSERT_REQUEST_WHEN_BUSY: assert($past(!rom_busy));	
			end

			if(!rom_initialized) begin
				ASSERT_ROM_NOT_INITIALIZED: assert(!writing && !rom_request && !ack);
			end

			if(writing || rom_request || ack) begin
				ASSERT_ROM_INITIALIZED: assert(rom_initialized);
			end
			
			if(ack) begin
				ASSERT_ACK: assert($fell(writing));
			end

			if(writing) begin
				ASSERT_REQUEST_WHILE_WRITING: assert(!rom_request);
			end
			
		end


    end

`endif    


endmodule