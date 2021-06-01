`default_nettype none
`timescale 1ns/10ps

module hack_soc (
	input clk,
	input display_clk,
	input reset,
	input hack_external_reset,

	// ** RAM: qspi serial sram **/
	output ram_cs_n,
	output ram_sck,
	output ram_sio_oe, // output enable the SIO lines
	// SIO as inputs from SRAM	
	input ram_sio0_i, // sram_si_sio0 
	input ram_sio1_i, // sram_so_sio1
	input ram_sio2_i, // sram_sio2
	input ram_sio3_i, // sram_hold_n_sio3
	// SIO as outputs to SRAM
	output ram_sio0_o, // sram_si_sio0
	output ram_sio1_o, // sram_so_sio1
	output ram_sio2_o, // sram_sio2
	output ram_sio3_o, // sram_hold_n_sio3


	// ** ROM: qspi serial sram **/
	output rom_cs_n,
	output rom_sck,
	output rom_sio_oe, // output enable the SIO lines
	// SIO as inputs from SRAM	
	input rom_sio0_i, // sram_si_sio0 
	input rom_sio1_i, // sram_so_sio1
	input rom_sio2_i, // sram_sio2
	input rom_sio3_i, // sram_hold_n_sio3
	// SIO as outputs to SRAM
	output rom_sio0_o, // sram_si_sio0
	output rom_sio1_o, // sram_so_sio1
	output rom_sio2_o, // sram_sio2
	output rom_sio3_o, // sram_hold_n_sio3


	// ** DISPLAY ** //
	output display_hsync,
	output display_vsync,
	output display_rgb,


	// GPIO
	output reg [HACK_GPIO_WIDTH-1:0] gpio,

	// ROM LOADING LINES
	input rom_loader_reset,
	input rom_loader_load,
	input [INSTRUCTION_WIDTH-1:0] rom_loader_data,
	output rom_loader_ack,
	output rom_loader_load_received,

	// DEBUG nets
	output [ROM_ADDRESS_WIDTH-1:0] debug_pc,
	output [RAM_ADDRESS_WIDTH-1:0] debug_addressM,
	output [INSTRUCTION_WIDTH-1:0] debug_instruction,
	output reg [WORD_WIDTH-1:0] debug_gpio

	);

// Include main project parameters
`include "includes/params.v"


`define ADDRESS_KEYBOARD 'h6000
`define ADDRESS_GPIO 'h6001


reg [1:0] hack_wait_clocks;
wire rom_loading_process;

wire hack_clk_strobe;


hack_clock hack_clock_0(
	.clk(clk),
	.reset(reset),
	.hack_clk(hack_clk),
	.strobe(hack_clk_strobe)
);


wire hack_clk;
wire hack_reset;
wire [RAM_ADDRESS_WIDTH-1:0] hack_addressM;
wire hack_writeM;
wire [WORD_WIDTH-1:0] hack_inM;
wire [WORD_WIDTH-1:0] hack_outM;
wire [INSTRUCTION_WIDTH-1:0] hack_instruction;
wire [ROM_ADDRESS_WIDTH-1:0] hack_pc;
wire hack_rom_request;
hack_cpu cpu(
		.clk(hack_clk), 
		.inM(hack_inM), 
		.instruction(hack_instruction), 
		.reset(hack_reset),
		.outM(hack_outM), 
		.writeM(hack_writeM), 
		.addressM(hack_addressM), 
		.pc(hack_pc)
		);



wire rom_loader_reset;
wire rom_loader_load;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_data;
wire rom_loader_ack;
wire rom_loader_load_received;
wire rom_loader_request;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_output_data;
wire [ROM_ADDRESS_WIDTH-1:0] rom_loader_output_address;
rom_stream_loader #(.DATA_WIDTH(INSTRUCTION_WIDTH), .ADDRESS_WIDTH(ROM_ADDRESS_WIDTH)) 
	rom_loader(
		.clk(clk),
		.reset(rom_loader_reset),
		// Loader nets
		.load(rom_loader_load),
		.input_data(rom_loader_data),
		.ack(rom_loader_ack),
		.load_recevied(rom_loader_load_received),
		// ROM nets
		.rom_busy(rom_busy),
		.rom_initialized(rom_initialized),
		.rom_request(rom_loader_request),
		.output_data(rom_loader_output_data),
		.output_address(rom_loader_output_address)				
);



// inputs to spi_sram_encoder
wire ram_request;
// outputs from spi_sram_encoder
wire ram_busy;
wire ram_initialized;
wire [WORD_WIDTH-1:0] ram_data_out;
spi_sram_encoder #(	.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(RAM_ADDRESS_WIDTH) )
		ram_encoder_0
		(
			.clk(clk),
			.reset(reset), 

			.request(ram_request),
			.busy(ram_busy),
			.initialized(ram_initialized),
			
			.address(hack_addressM),
			.write_enable(hack_writeM),
			.data_in(ram_data_out),
			.data_out(hack_outM),

			.sram_cs_n(ram_cs_n),
			.sram_sck(ram_sck),

			.sram_sio_oe(ram_sio_oe),

			.sram_sio0_i(ram_sio0_i), 
			.sram_sio1_i(ram_sio1_i), 
			.sram_sio2_i(ram_sio2_i), 
			.sram_sio3_i(ram_sio3_i), 

			.sram_sio0_o(ram_sio0_o), 
			.sram_sio1_o(ram_sio1_o), 
			.sram_sio2_o(ram_sio2_o), 
			.sram_sio3_o(ram_sio3_o) 
		);


// inputs to spi_sram_encoder
wire rom_request;
wire [ROM_ADDRESS_WIDTH-1:0] rom_address;
// outputs from spi_sram_encoder
wire rom_busy;
wire rom_initialized;
wire rom_write_enable;
// wire [INSTRUCTION_WIDTH-1:0] rom_data_out = {INSTRUCTION_WIDTH{1'b0}};
spi_sram_encoder #(	.WORD_WIDTH(INSTRUCTION_WIDTH), .ADDRESS_WIDTH(ROM_ADDRESS_WIDTH) )
		rom_encoder_0
		(
			.clk(clk),
			.reset(reset), 

			.request(rom_request),
			.busy(rom_busy),
			.initialized(rom_initialized),
			
			.address(rom_address),
			.write_enable(rom_write_enable), 
			.data_in(hack_instruction),
			.data_out(rom_loader_output_data),

			.sram_cs_n(rom_cs_n),
			.sram_sck(rom_sck),

			.sram_sio_oe(rom_sio_oe),

			.sram_sio0_i(rom_sio0_i), 
			.sram_sio1_i(rom_sio1_i), 
			.sram_sio2_i(rom_sio2_i), 
			.sram_sio3_i(rom_sio3_i), 

			.sram_sio0_o(rom_sio0_o), 
			.sram_sio1_o(rom_sio1_o), 
			.sram_sio2_o(rom_sio2_o), 
			.sram_sio3_o(rom_sio3_o) 
		);



// VIDEO GENERATOR
wire [9:0] display_hpos;
wire [9:0] display_vpos;
wire display_active;
wire reset_display = reset;
// assign display_rgb = display_hpos[2] || display_vpos[2];
assign display_rgb = (display_hpos[2] || display_vpos[2]) && gpio[8];
video_signal_generator_640x480 video_generator_1 (
	//i_clk,           // base clock
	.i_pix_stb(display_clk),       // pixel clock strobe
	.i_rst(reset_display),           // reset: restarts frame
	.o_hs(display_hsync),           // horizontal sync
	.o_vs(display_vsync),           // vertical sync
	// .o_blanking(),     // high during blanking interval
	.o_active(display_active),       // high during active pixel drawing
	// .o_screenend(),    // high for one tick at the end of screen
	// .o_animate(),      // high for one tick at end of active drawing
	.o_x(display_hpos),      // current pixel x position
	.o_y(display_vpos)       // current pixel y position
);






assign rom_loading_process = rom_loader_load;
assign hack_reset = hack_external_reset || (hack_wait_clocks!=0) || reset || !ram_initialized || !rom_initialized;
assign ram_request = !hack_reset && !ram_busy && hack_clk && hack_clk_strobe;
assign hack_rom_request = !rom_busy && hack_clk && hack_clk_strobe;
assign rom_request = rom_loading_process ? rom_loader_request : hack_rom_request;
assign rom_address = rom_loading_process ? rom_loader_output_address : hack_pc;
assign rom_write_enable = (rom_loading_process);// && rom_loader_request);



always @(posedge clk ) begin
	if(reset) begin
		hack_wait_clocks <= 2;
	end else begin

		if(hack_external_reset) begin
			hack_wait_clocks <= 2;
		end else if(hack_wait_clocks!=0 && hack_clk_strobe && hack_clk) begin 
			hack_wait_clocks <= hack_wait_clocks - 2'b1;
		end
	end
	
end



// Memory mapping
// assign ram_load = (write_memory && cpu_addressM<'h4000) ? 1 : 0;
// assign vram_load = (write_memory && cpu_addressM>='h4000 && cpu_addressM<'h6000) ? 1 : 0;
// Translate cpu address to vram address:
// assign cpu_vram_address = (cpu_addressM - 'h4000);

// assign cpu_inM = (cpu_addressM < 'h4000) ? ram_data_out : ((cpu_addressM < 'h6000) ? vram_data_to_cpu : keyboardCode); 
assign hack_inM = (hack_addressM < 'h4000) ? ram_data_out :
					(hack_addressM < 'h6000) ? ram_data_out /*VRAM en realidad*/ :
					(hack_addressM == `ADDRESS_KEYBOARD) ? 0 /*keyboard*/ :
					(hack_addressM == `ADDRESS_GPIO) ? gpio :
					0;


// GPIO
always @(posedge hack_clk) begin
	if(hack_reset) begin
		gpio <= 0;
	end else begin
		if(hack_addressM==`ADDRESS_GPIO && hack_writeM) begin
			gpio <= hack_outM;
		end
	end
end


always @(posedge hack_clk ) begin
	if(hack_reset) begin
		debug_gpio <= 0;	
	end else begin
		if(hack_addressM==1 && hack_writeM) begin
			debug_gpio <= hack_outM;
		end
	end
	
end


// TEST
// assign hack_instruction = hack_pc==0 ? 16'b0000000000000000 :
// 						hack_pc==1 ? 16'b1111110111010000 :
// 						hack_pc==2 ? 16'b1110001100001000 :
// 						16'b1110101010000111;


// DEBUG
assign debug_pc = hack_pc;
assign debug_addressM = hack_addressM;
assign debug_instruction = hack_instruction;

/*
device_mgr hack_device_mgr
spi_sram_encoder ram
spi_sram_encoder rom
spi_sram_encoder vram

*/





`ifdef FORMAL
    // register for knowing if we have just started
    reg f_past_valid = 0;
	reg initial_reset_passed = 0;

    // start in reset
    initial assume(reset);

    always @(posedge clk) begin 
    	f_past_valid <= 1;

		if($fell(reset)) begin
			initial_reset_passed <= 1;
		end

		if(initial_reset_passed) begin

			COVER_RAM_INIT: cover(ram_initialized);

			ASSERT_WAIT_CLOCK_BOUNDARIES: assert(hack_wait_clocks<=2);	

			if(!ram_initialized) begin
				ASSERT_RAM_REQUESTS_ON_INIT: assert(ram_request==0);
			end

			if($past(ram_request) && !hack_reset && $rose(hack_clk)) begin
				ASSERT_RAM_CLK_SYNCHRO: assert($rose(ram_sck));
			end
		end
	
		if(f_past_valid) begin
			COVER_HACK_CLOCK_START: cover($rose(hack_clk));	
		end
		

		

    end

`endif   		

endmodule