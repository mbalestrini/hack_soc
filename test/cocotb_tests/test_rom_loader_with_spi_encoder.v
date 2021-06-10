`default_nettype none
`timescale 1ns/10ps

//testear spi_sram_enconder y rom_stream_loader
module test_rom_loader_with_spi_encoder(
    input reset,
    input clk,

    input manual_rom_loader_load,
    input manual_rom_loader_sck,
    input [INSTRUCTION_WIDTH-1:0] manual_rom_loader_data,
    output rom_loader_ack,

    input manual_test

);

parameter INSTRUCTION_WIDTH = 16;
parameter ROM_ADDRESS_WIDTH = 16;


// Control lines
wire rom_loader_sck;
wire rom_loader_load;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_data;
wire rom_loader_ack;



reg rom_loading_process;


wire run_file_to_rom;
wire file_to_rom_done;
wire file_to_rom_loader_load;
wire file_to_rom_loader_sck;
wire [INSTRUCTION_WIDTH-1:0] file_to_rom_loader_data;


load_file_to_rom #(
        .BYTE_COUNT(50),
        .ROM_FILE("hack_programs/test_assignment_and_jump.hack"),
        .DATA_WIDTH(INSTRUCTION_WIDTH)
    ) file_to_rom (

    .clk(clk), 
    .reset(reset),

    .run(run_file_to_rom),
    .done_loading(file_to_rom_done),

    // Control lines
    .rom_loader_load(file_to_rom_loader_load),
    .rom_loader_data(file_to_rom_loader_data),
    .rom_loader_sck(file_to_rom_loader_sck),
    .rom_loader_ack(rom_loader_ack)
);





wire rom_loader_request;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_output_data;
wire [ROM_ADDRESS_WIDTH-1:0] rom_loader_output_address;
rom_stream_loader #(.DATA_WIDTH(INSTRUCTION_WIDTH), .ADDRESS_WIDTH(ROM_ADDRESS_WIDTH)) 
	rom_loader(
		.clk(clk),
		.reset(reset),
		// Loader nets
		.load(rom_loader_load),
		.input_data(rom_loader_data),
        .sck(rom_loader_sck),
		.ack(rom_loader_ack),

		// ROM nets
		.rom_busy(rom_busy),
		.rom_initialized(rom_initialized),
		.rom_request(rom_loader_request),
		.output_data(rom_loader_output_data),
		.output_address(rom_loader_output_address)				
);




wire rom_busy;	
wire rom_initialized;
wire rom_request;

wire sram_cs_n;
wire sram_sck;	
wire sram_sio_oe;

wire sram_sio0_i;
wire sram_sio1_i;
wire sram_sio2_i;
wire sram_sio3_i;

wire sram_sio0_o;
wire sram_sio1_o;
wire sram_sio2_o;
wire sram_sio3_o;

wire rom_write_enable;

reg [INSTRUCTION_WIDTH-1:0] rom_read_data;

spi_sram_encoder #(	.WORD_WIDTH(INSTRUCTION_WIDTH), .ADDRESS_WIDTH(ROM_ADDRESS_WIDTH) )
    _spi_sram_encoder 		
    (
        .clk(clk),
        .reset(reset), 

        .request(rom_loader_request),
        .busy(rom_busy),
        .initialized(rom_initialized),
        
        .address(rom_loader_output_address),
        .write_enable(rom_write_enable),
        .data_in(rom_read_data),
        .data_out(rom_loader_output_data),
        .sram_cs_n(sram_cs_n),
        .sram_sck(sram_sck),

        .sram_sio_oe(sram_sio_oe),
        .sram_sio0_i(sram_sio0_i), 
        .sram_sio1_i(sram_sio1_i), 
        .sram_sio2_i(sram_sio2_i), 
        .sram_sio3_i(sram_sio3_i), 

        .sram_sio0_o(sram_sio0_o), 
        .sram_sio1_o(sram_sio1_o), 
        .sram_sio2_o(sram_sio2_o), 
        .sram_sio3_o(sram_sio3_o) 
    );



wire sram_sio0;
wire sram_sio1;
wire sram_sio2;
wire sram_sio3;

assign sram_sio0 = sram_sio_oe ? sram_sio0_o : 1'bZ;
assign sram_sio0_i = sram_sio0;

assign sram_sio1 = sram_sio_oe ? sram_sio1_o : 1'bZ;
assign sram_sio1_i = sram_sio1;

assign sram_sio2 = sram_sio_oe ? sram_sio2_o : 1'bZ;
assign sram_sio2_i = sram_sio2;

assign sram_sio3 = sram_sio_oe ? sram_sio3_o : 1'bZ;
assign sram_sio3_i = sram_sio3;

M23LC1024 rom (
    .SI_SIO0(sram_sio0), 
    .SO_SIO1(sram_sio1), 
    .SCK(sram_sck), 
    .CS_N(sram_cs_n), 
    .SIO2(sram_sio2), 
    .HOLD_N_SIO3(sram_sio3), 
    .RESET(reset));
    

assign rom_loader_load =  manual_test ? manual_rom_loader_load : file_to_rom_loader_load;
assign rom_loader_data = manual_test ? manual_rom_loader_data : file_to_rom_loader_data;
assign rom_loader_sck = manual_test ? manual_rom_loader_sck : file_to_rom_loader_sck;

assign rom_write_enable = (rom_loading_process);// && rom_loader_request);
assign run_file_to_rom = !manual_test && rom_loading_process ;

always @(posedge clk) begin
    if(reset) begin
        rom_loading_process <= 0;
    end else begin
        rom_loading_process <= 1;
    end
    
end

endmodule

