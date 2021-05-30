`default_nettype none
`timescale 1ns/10ps

module load_file_to_rom
    #(
        parameter BYTE_COUNT = 24,
        parameter ROM_FILE = "hack_programs/gpio_counter.hack",        
        parameter DATA_WIDTH = 16
    )(
    input clk, 
    input reset,

    input run,
    output reg done_loading,

    // Control lines
    output reg rom_loader_reset,
    output reg rom_loader_load,
    output [DATA_WIDTH-1:0] rom_loader_data,
    input rom_loader_ack, 
    input rom_loader_load_received

);

// Por ahora solo sirve para achivos que tienen un byte por linea
localparam FILE_DATA_WIDTH = 8;
localparam index_width = $clog2(BYTE_COUNT);


reg [index_width-1:0] file_idx;
reg [FILE_DATA_WIDTH-1:0] file_data [0:BYTE_COUNT-1];


wire [DATA_WIDTH-1:0] merged_output_data = {file_data[file_idx], file_data[file_idx+1]};

// wire memdata0 = mem_struct_data[0];
// wire memdata1 = mem_struct_data[1];

assign rom_loader_data = merged_output_data;

reg was_running;
initial begin
    // if(ROM_FILE!="")
         $readmemb(ROM_FILE, file_data);               
end

always @(posedge clk ) begin
    if(reset) begin
        was_running <= 0;
        rom_loader_reset <= 0;
        rom_loader_load <= 0;
        file_idx <= 0;
        done_loading <= 0;
    end else begin
        was_running <= run;
        
        if(run) begin
            if(!was_running) begin
                // reset rom loader
                rom_loader_reset <= 1;
                done_loading <= 0;
                
                rom_loader_load <= 1;

            end else begin
                rom_loader_reset <= 0;
                
                // rom_loader_load <= 1;

                if(!done_loading) begin
                    
                    if(rom_loader_load_received) begin
                        // Prepare next byte    
                        if(file_idx<BYTE_COUNT) begin
                            // rom_loader_data <= merged_output_data;//file_data[file_idx];                            
                            file_idx <= file_idx + 2;
                        end else begin
                            // Stop sending data after this one
                            rom_loader_load <= 0;
                        end
                    end else if(rom_loader_ack && file_idx>=BYTE_COUNT) begin
                        done_loading <= 1;
                        rom_loader_load <= 0;
                    end
                
                    
                end

            end        
        end
    end

end

endmodule


