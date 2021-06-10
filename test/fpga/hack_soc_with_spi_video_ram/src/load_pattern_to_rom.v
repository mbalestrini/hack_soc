`default_nettype none
`timescale 1ns/10ps

module load_pattern_to_rom
    #(
        parameter WORDS_TO_LOAD = 1024,
        parameter DATA_WIDTH = 16
    )(
    input clk, 
    input reset,

    input run,
    output reg done_loading,

    // Control lines
    output reg rom_loader_load,
    output reg [DATA_WIDTH-1:0] rom_loader_data,
    output reg rom_loader_sck,
    input rom_loader_ack

);




localparam index_width = $clog2(WORDS_TO_LOAD+1);


reg [index_width-1:0] words_left;
reg [index_width-1:0] counter;
reg was_running;

// '0000000000000000
// '1110101010000111
always @(posedge clk ) begin
    if(reset) begin
        was_running <= 0;
        rom_loader_load <= 0;
        rom_loader_data <= 'h0000;
        words_left <= WORDS_TO_LOAD;
        counter <= 0;
        done_loading <= 0;
        rom_loader_sck <= 0;
    end else begin
        was_running <= run;
        
        if(run) begin
            if(!was_running) begin
                // reset rom loader
                done_loading <= 0;
                rom_loader_load <= 1;
                rom_loader_data <= 'h0000;
                rom_loader_sck <= 1;
            end else begin
                
                if(!done_loading) begin
                    rom_loader_sck <= 1;

                    if(words_left>0) begin
                        words_left <= words_left - 1;
                        counter <= counter + 1;
                        if((counter+1)==1) begin
                            rom_loader_data <= 'b11101010_10000111;
                        end else begin
                            rom_loader_data <= words_left[0] ? {DATA_WIDTH{1'b1}} : {DATA_WIDTH{1'b0}};
                        end
                    end else begin
                        // Stop sending data after this one
                        rom_loader_load <= 0;
                        done_loading <= 1;
                    end
                    
                end

            end        
        end
    end

end

endmodule


