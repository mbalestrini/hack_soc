`default_nettype none
`timescale 1ns/10ps

module boot_screen_test (
   	input EXTERNAL_CLK, 
	input RESET_N,

	output HSYNC,
	output VSYNC,
	output RGB,

	input BTN1,
	input BTN3

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

wire debounced_btn3;
wire strobe_btn3;
debounce #(.NUMBER_STABLE_CYCLES(40)) mod_debouncer_btn3 (
	.clk(clk),
    .reset(reset),
    .button(BTN3),
    .debounced(debounced_btn3),
    .strobe(strobe_btn3)
    );




// 25.125 MHz clock
wire video_clk_25Mhz;
wire video_clk_pll_locked;
pll_12___25_125 pll_1 (
        .clock_in(EXTERNAL_CLK),
        .clock_out(video_clk_25Mhz),
        .locked(video_clk_pll_locked)
        );
		

wire clk = video_clk_25Mhz;
wire reset = !RESET_N || !video_clk_pll_locked;

wire display_active;
wire [9:0] hpos;
wire [9:0] vpos;
wire [9:0] display_clks_before_active;

wire RGB = pixel_logo & display_active;


wire pixel_logo;
boot_logo logo (
	.hpos(hpos),
	.vpos(vpos),
	.pixel(pixel_logo)
);

video_signal_generator_640x480 video_generator_1 (
	//i_clk,           // base clock
	.i_pix_stb(video_clk_25Mhz),       // pixel clock strobe
	.i_rst(reset),           // reset: restarts frame
	.o_hs(HSYNC),           // horizontal sync
	.o_vs(VSYNC),           // vertical sync
	// .o_blanking(),     // high during blanking interval
	.o_active(display_active),       // high during active pixel drawing
	// .o_screenend(),    // high for one tick at the end of screen
	// .o_animate(),      // high for one tick at end of active drawing
	.o_x(hpos),      // current pixel x position
	.o_y(vpos),       // current pixel y position
	.o_clks_before_active(display_clks_before_active)
);




// always @(posedge clk ) begin
// 	if(debounced_btn1) begin
		
// 	end
// end



endmodule


module boot_logo(
	input [9:0] hpos,
	input [9:0] vpos,
	output pixel
);

localparam SCALE = 1;
localparam LOGO_WIDTH = 16*SCALE;
localparam LOGO_HEIGHT = 19*SCALE;
localparam LOGO_START_H = (640-LOGO_WIDTH)/2;
localparam LOGO_START_V = (480-LOGO_HEIGHT)/2;

wire [9:0] hlogo = (hpos - LOGO_START_H)/SCALE;
wire [9:0] vlogo = (vpos - LOGO_START_V)/SCALE;
wire pixel = (hpos >= LOGO_START_H) & (hpos < (LOGO_START_H+LOGO_WIDTH)) & (vpos >= LOGO_START_V) & (vpos < (LOGO_START_V+LOGO_HEIGHT))  ? 
			// hlogo[0] | vlogo[0] :
			// (LOGO[vlogo]>>(LOGO_WIDTH-hlogo)) & 16'h0001 :
			~LOGO[ ( ((LOGO_HEIGHT/SCALE-vlogo)<<4) - hlogo)] :
			1;

// reg [15:0] logo [0:17] = {
parameter LOGO = {
	16'b0111111111111110,
	16'b0100000000000010,
	16'b0101111101000010,
	16'b0100000000000010,
	16'b0101010111001010,
	16'b0100000000000010,
	16'b0101011000011010,
	16'b0100000000000010,
	16'b0111111111111110,
	16'b0000111111110000,
	16'b0111111111111110,
	16'b0111111111111010,
	16'b0111111111111110,
	16'b0111111111111110,	
	16'b0000000000000000,
	16'b0101011101101010,
	16'b0101010101001100,
	16'b0111011101001010,
	16'b0101010101101010
	};


// wire index = 
endmodule
/*



*/