`default_nettype none
`timescale 1ns/10ps

module fpga_video_generator_test (
	input EXTERNAL_CLK, 
	input RESET_N,


	output VRAM_SCK, 
	output ROM_SCK,	

	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,

	output LEDR_N,
	output LEDG_N,

	input BTN1,
	input BTN2,
	input BTN3,


	output HSYNC, 
	output VSYNC,
	output RGB

	);



wire debounced_btn1;
wire strobe_btn1;
debounce #(.NUMBER_STABLE_CYCLES(40)) mod_debouncer_btn1 (
	.clk(clk),
    .reset(reset),
    .button(BTN1),
    .debounced(debounced_btn1),
    .strobe(strobe_btn1)
    );

wire debounced_btn2;
wire strobe_btn2;
debounce #(.NUMBER_STABLE_CYCLES(40)) mod_debouncer_btn2 (
	.clk(clk),
    .reset(reset),
    .button(BTN2),
    .debounced(debounced_btn2),
    .strobe(strobe_btn2)
    );



assign VRAM_SCK = 0;
assign ROM_SCK = 0;



// // 25.125 MHz clock
// wire video_clk_25Mhz;
// wire clk = video_clk_25Mhz;
// wire video_clk_pll_locked;
// pll_12___25_125 pll_1 (
//         .clock_in(EXTERNAL_CLK),
//         .clock_out(video_clk_25Mhz),
//         .locked(video_clk_pll_locked)
//         );




// 31.5 MHz clock
wire video_clk_315Mhz;
wire clk = video_clk_315Mhz;
wire video_clk_pll_locked;
pll_12___31_5 pll_1 (
        .clock_in(EXTERNAL_CLK),
        .clock_out(video_clk_315Mhz),
        .locked(video_clk_pll_locked)
        );





// wire clk = EXTERNAL_CLK;
wire reset = ~RESET_N ;//|| !video_clk_pll_locked;


// wire hsync;
// wire vsync;
wire [9:0] hpos;
wire [9:0] vpos;
wire display_active;

wire reset_video = reset || debounced_btn2;

video_generator_640x480 video_generator_1 (

	//i_clk,           // base clock
	.i_pix_stb(clk),       // pixel clock strobe
	.i_rst(reset_video),           // reset: restarts frame

	.o_hs(HSYNC),           // horizontal sync
	.o_vs(VSYNC),           // vertical sync

	// .o_blanking(),     // high during blanking interval
	.o_active(display_active),       // high during active pixel drawing
	// .o_screenend(),    // high for one tick at the end of screen
	// .o_animate(),      // high for one tick at end of active drawing
	.o_x(hpos),      // current pixel x position
	.o_y(vpos)       // current pixel y position
);


wire RGB = ( (hpos[0] & ~BTN1) || (vpos[0] & ~BTN2)) & HSYNC & VSYNC;



// assign {LED5, LED4, LED3, LED2} = debug_gpio[3:0];
assign {LED5, LED4, LED3, LED2, LED1} = {HSYNC, VSYNC, vpos[0], hpos[0],  display_active} ;
assign LEDR_N = some_test;
// assign LEDG_N = ~rom_loader_load;

reg some_test;


// assign FLASH_IO2 = gpio[4];
// assign FLASH_IO3 = gpio[5];

// assign LED1 = debug_pc[0];
// assign {LED2, LED3, LED4, LED5} = debug_pc[3:0];

always @(posedge clk ) begin
	if(strobe_btn1) begin
		some_test = ~some_test;
	end	
end

endmodule