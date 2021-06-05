`default_nettype none
`timescale 1ns/10ps

module test_spi_video_2_with_23LC1024 (
    input clk,
    input reset,

    output display_hsync, 
    output display_vsync, 
    output pixel_value,

    output display_active
);




wire display_clk = clk;


// VIDEO GENERATOR
wire [9:0] display_hpos;
wire [9:0] display_vpos;
wire display_active;
wire reset_display = reset;
wire display_trigger_read;
// assign display_rgb = display_hpos[2] || display_vpos[2];
video_signal_generator_640x480 #(.READ_TRIGGER_BEFORE_ACTIVE_CLKS(42 /*26*/)) 
    video_generator_1 (
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
        .o_y(display_vpos)  ,     // current pixel y position

        .o_trigger_read(display_trigger_read)
);





wire sram_cs_n;
wire sram_sck;	
wire sram_sio_oe;


wire sram_sio0;
wire sram_sio1;
wire sram_sio2;
wire sram_sio3;

wire sram_sio0_i;
wire sram_sio1_i;
wire sram_sio2_i;
wire sram_sio3_i;

wire sram_sio0_o;
wire sram_sio1_o;
wire sram_sio2_o;
wire sram_sio3_o;

assign sram_sio0 = sram_sio_oe ? sram_sio0_o : 1'bZ;
assign sram_sio0_i = sram_sio0;

assign sram_sio1 = sram_sio_oe ? sram_sio1_o : 1'bZ;
assign sram_sio1_i = sram_sio1;

assign sram_sio2 = sram_sio_oe ? sram_sio2_o : 1'bZ;
assign sram_sio2_i = sram_sio2;

assign sram_sio3 = sram_sio_oe ? sram_sio3_o : 1'bZ;
assign sram_sio3_i = sram_sio3;

// Tristate buffers:
// bufif1  b1 (sram_sio0_i, sram_sio0_o, sram_sio_oe);
// bufif1  b2 (sram_sio1_i, sram_sio1_o, sram_sio_oe);
// bufif1  b3 (sram_sio2_i, sram_sio2_o, sram_sio_oe);
// bufif1  b4 (sram_sio3_i, sram_sio3_o, sram_sio_oe);


// rom_M23LC1024 #(.ROM_FILE("video_rom_files/test_values.txt")) ram (
M23LC1024 ram (
    .SI_SIO0(sram_sio0), 
    .SO_SIO1(sram_sio1), 
    .SCK(sram_sck), 
    .CS_N(sram_cs_n), 
    .SIO2(sram_sio2), 
    .HOLD_N_SIO3(sram_sio3), 
    .RESET(reset));





wire pixel_value;
spi_video_ram_2 spi_video_ram_1 (
    .clk(clk),
	.reset(reset), 	


    .display_trigger_read(display_trigger_read),
    .display_active(display_active),
    .display_hpos(display_hpos),
    .display_vpos(display_vpos),
	.pixel_out(pixel_value),
	

    // Serial SRAM nets 
	.sram_cs_n(sram_cs_n),
	.sram_sck(sram_sck),

	.sram_sio_oe(sram_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.sram_sio0_i(sram_sio0_i), // sram_si_sio0 
	.sram_sio1_i(sram_sio1_i), // sram_so_sio1
	.sram_sio2_i(sram_sio2_i), // sram_sio2
	.sram_sio3_i(sram_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.sram_sio0_o(sram_sio0_o), // sram_si_sio0
	.sram_sio1_o(sram_sio1_o), // sram_so_sio1
	.sram_sio2_o(sram_sio2_o), // sram_sio2
	.sram_sio3_o(sram_sio3_o) // sram_hold_n_sio3

);



endmodule