`default_nettype none
`timescale 1ns/10ps

module test_hack_soc_with_spi_video (
    input reset,
    input clk,

	output VSYNC,
	output HSYNC, 
	output RGB,

	output DEBUG_VRAM_CS_N
);


wire video_clk_25Mhz = clk;



// localparam  ROM_FILE = "hack_programs/test_assignment_and_jump.hack";
// localparam  ROM_FILE = "video_rom_files/test_values.txt";
localparam  ROM_FILE = "video_rom_files/test_patterns.txt";
localparam	FILE_LINES = 650;
localparam  INSTRUCTION_WIDTH = 16;
localparam  ROM_ADDRESS_WIDTH = 16;



// ROM Loading Lines
wire rom_loader_load;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_data;
wire rom_loader_sck;
wire rom_loader_ack;



reg run_file_to_rom;

// wire done_loading_rom;
// wire file_to_rom_loader_reset;
// wire file_to_rom_loader_load;
// wire [INSTRUCTION_WIDTH-1:0] file_to_rom_loader_data;
// load_file_to_rom #(
//         .BYTE_COUNT(FILE_LINES),
//         .ROM_FILE(ROM_FILE),
//         .DATA_WIDTH(INSTRUCTION_WIDTH)
//     ) file_to_rom (

//     .clk(clk), 
//     .reset(reset),

//     .run(run_file_to_rom),
//     .done_loading(done_loading_rom),

//     // Control lines
//     .rom_loader_reset(rom_loader_reset),
//     .rom_loader_load(rom_loader_load),
//     .rom_loader_data(rom_loader_data),
//     .rom_loader_ack(rom_loader_ack),
//     .rom_loader_load_received(rom_loader_load_received)
// );

wire done_loading_rom;
wire [INSTRUCTION_WIDTH-1:0] file_to_rom_loader_data;
load_pattern_to_rom #(
        .WORDS_TO_LOAD(256),
        .DATA_WIDTH(INSTRUCTION_WIDTH)
    ) file_to_rom (

    .clk(clk), 
    .reset(reset),

    .run(run_file_to_rom),
    .done_loading(done_loading_rom),

    // Control lines
    .rom_loader_load(rom_loader_load),
	.rom_loader_sck(rom_loader_sck),
    .rom_loader_data(rom_loader_data),
    .rom_loader_ack(rom_loader_ack)
);





M23LC1024 ram (
		.SI_SIO0(ram_sio0), 
		.SO_SIO1(ram_sio1), 
		.SCK(ram_sck), 
		.CS_N(ram_cs_n), 
		.SIO2(ram_sio2), 
		.HOLD_N_SIO3(ram_sio3), 
		.RESET(reset));

M23LC1024 rom (
		.SI_SIO0(rom_sio0), 
		.SO_SIO1(rom_sio1), 
		.SCK(rom_sck), 
		.CS_N(rom_cs_n), 
		.SIO2(rom_sio2), 
		.HOLD_N_SIO3(rom_sio3), 
		.RESET(reset));


M23LC1024 vram (
		.SI_SIO0(vram_sio0), 
		.SO_SIO1(vram_sio1), 
		.SCK(vram_sck), 
		.CS_N(vram_cs_n), 
		.SIO2(vram_sio2), 
		.HOLD_N_SIO3(vram_sio3), 
		.RESET(reset));


wire ram_sck;
wire ram_cs_n;
wire ram_sio0;
wire ram_sio1;
wire ram_sio2;
wire ram_sio3;

wire ram_sio_oe;
wire ram_sio0_i;
wire ram_sio1_i;
wire ram_sio2_i;
wire ram_sio3_i;
wire ram_sio0_o;
wire ram_sio1_o;
wire ram_sio2_o;
wire ram_sio3_o;

assign ram_sio0 = ram_sio_oe ? ram_sio0_o : 1'bZ;
assign ram_sio0_i = ram_sio0;
assign ram_sio1 = ram_sio_oe ? ram_sio1_o : 1'bZ;
assign ram_sio1_i = ram_sio1;
assign ram_sio2 = ram_sio_oe ? ram_sio2_o : 1'bZ;
assign ram_sio2_i = ram_sio2;
assign ram_sio3 = ram_sio_oe ? ram_sio3_o : 1'bZ;
assign ram_sio3_i = ram_sio3;

wire rom_sck;
wire rom_cs_n;
wire rom_sio0;
wire rom_sio1;
wire rom_sio2;
wire rom_sio3;

wire rom_sio_oe;
wire rom_sio0_i;
wire rom_sio1_i;
wire rom_sio2_i;
wire rom_sio3_i;
wire rom_sio0_o;
wire rom_sio1_o;
wire rom_sio2_o;
wire rom_sio3_o;

assign rom_sio0 = rom_sio_oe ? rom_sio0_o : 1'bZ;
assign rom_sio0_i = rom_sio0;
assign rom_sio1 = rom_sio_oe ? rom_sio1_o : 1'bZ;
assign rom_sio1_i = rom_sio1;
assign rom_sio2 = rom_sio_oe ? rom_sio2_o : 1'bZ;
assign rom_sio2_i = rom_sio2;
assign rom_sio3 = rom_sio_oe ? rom_sio3_o : 1'bZ;
assign rom_sio3_i = rom_sio3;


wire vram_sck;
wire vram_cs_n;
wire vram_sio0;
wire vram_sio1;
wire vram_sio2;
wire vram_sio3;

wire vram_sio_oe;
wire vram_sio0_i;
wire vram_sio1_i;
wire vram_sio2_i;
wire vram_sio3_i;
wire vram_sio0_o;
wire vram_sio1_o;
wire vram_sio2_o;
wire vram_sio3_o;



assign vram_sio0 =  ~done_loading_rom ? rom_sio0 : (vram_sio_oe ? vram_sio0_o : 1'bZ);
assign vram_sio0_i = ~done_loading_rom ? rom_sio0 : vram_sio0;
assign vram_sio1 = ~done_loading_rom ? rom_sio1 : (vram_sio_oe ? vram_sio1_o : 1'bZ);
assign vram_sio1_i = ~done_loading_rom ? rom_sio1 : vram_sio1;
assign vram_sio2 = ~done_loading_rom ? rom_sio2 : (vram_sio_oe ? vram_sio2_o : 1'bZ);
assign vram_sio2_i = ~done_loading_rom ? rom_sio2 : vram_sio2;
assign vram_sio3 = ~done_loading_rom ? rom_sio3 : (vram_sio_oe ? vram_sio3_o : 1'bZ);
assign vram_sio3_i = ~done_loading_rom ? rom_sio3 : vram_sio3;


wire hack_vram_cs_n;
wire hack_vram_sck;

assign vram_cs_n = ~done_loading_rom ? rom_cs_n : hack_vram_cs_n;
assign vram_sck = ~done_loading_rom ? rom_sck : hack_vram_sck;

assign DEBUG_VRAM_CS_N = vram_cs_n;

// assign vram_sio0 = vram_sio_oe ? vram_sio0_o : 1'bZ;
// assign vram_sio0_i = vram_sio0;
// assign vram_sio1 = vram_sio_oe ? vram_sio1_o : 1'bZ;
// assign vram_sio1_i = vram_sio1;
// assign vram_sio2 = vram_sio_oe ? vram_sio2_o : 1'bZ;
// assign vram_sio2_i = vram_sio2;
// assign vram_sio3 = vram_sio_oe ? vram_sio3_o : 1'bZ;
// assign vram_sio3_i = vram_sio3;


reg hack_external_reset;

hack_soc soc(
	.clk(clk),
	.display_clk(video_clk_25Mhz),
	.reset(reset),

	.hack_external_reset(hack_external_reset),

	/** RAM: qspi serial sram **/
	.ram_cs_n(ram_cs_n),
	.ram_sck(ram_sck),
	.ram_sio_oe(ram_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.ram_sio0_i(ram_sio0_i), // sram_si_sio0 
	.ram_sio1_i(ram_sio1_i), // sram_so_sio1
	.ram_sio2_i(ram_sio2_i), // sram_sio2
	.ram_sio3_i(ram_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.ram_sio0_o(ram_sio0_o), // sram_si_sio0
	.ram_sio1_o(ram_sio1_o), // sram_so_sio1
	.ram_sio2_o(ram_sio2_o), // sram_sio2
	.ram_sio3_o(ram_sio3_o), // sram_hold_n_sio3

	/** ROM: qspi serial sram **/
	.rom_cs_n(rom_cs_n),
	.rom_sck(rom_sck),
	.rom_sio_oe(rom_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.rom_sio0_i(rom_sio0_i), // sram_si_sio0 
	.rom_sio1_i(rom_sio1_i), // sram_so_sio1
	.rom_sio2_i(rom_sio2_i), // sram_sio2
	.rom_sio3_i(rom_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.rom_sio0_o(rom_sio0_o), // sram_si_sio0
	.rom_sio1_o(rom_sio1_o), // sram_so_sio1
	.rom_sio2_o(rom_sio2_o), // sram_sio2
	.rom_sio3_o(rom_sio3_o), // sram_hold_n_sio3


	/** RAM: qspi serial sram **/
	.vram_cs_n(hack_vram_cs_n),
	.vram_sck(hack_vram_sck),
	.vram_sio_oe(vram_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.vram_sio0_i(vram_sio0_i), // sram_si_sio0 
	.vram_sio1_i(vram_sio1_i), // sram_so_sio1
	.vram_sio2_i(vram_sio2_i), // sram_sio2
	.vram_sio3_i(vram_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.vram_sio0_o(vram_sio0_o), // sram_si_sio0
	.vram_sio1_o(vram_sio1_o), // sram_so_sio1
	.vram_sio2_o(vram_sio2_o), // sram_sio2
	.vram_sio3_o(vram_sio3_o), // sram_hold_n_sio3



	// ** DISPLAY ** //
	.display_hsync(HSYNC),
	.display_vsync(VSYNC),
	.display_rgb(RGB),



	// ROM LOADING LINES
	// inputs
	.rom_loader_load(rom_loader_load),
	.rom_loader_sck(rom_loader_sck),
	.rom_loader_data(rom_loader_data),
	// outputs
	.rom_loader_ack(rom_loader_ack)
	
	);



always @(posedge clk) begin
    if(reset) begin
        run_file_to_rom <= 0;
		hack_external_reset <= 1;
    end else begin
		if(done_loading_rom) begin
			hack_external_reset <= 0;
			run_file_to_rom <= 0;
		end else if(!run_file_to_rom) begin
        	run_file_to_rom <= 1;
		end
    end
    
end


endmodule