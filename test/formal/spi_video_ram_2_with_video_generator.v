module spi_video_ram_2_with_video_generator (
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
video_signal_generator_640x480 #(.READ_TRIGGER_BEFORE_ACTIVE_CLKS(26 /*42*/)) 
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



wire pixel_value;
wire initialized;
spi_video_ram_2 spi_video_ram_1 (
    .clk(clk),
	.reset(reset), 	

    .initialized(vram_initialized),


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


`ifdef FORMAL
    reg f_past_valid = 0;
    reg read_trigger_passed = 0;

    initial begin
        assume(reset);
        assume(vram_initialized==0);
        assume(display_active==0);
        // assume(display_hpos==0);
        // assume(display_vpos==0);
    end

    reg last_clk = 1'b0;
    always @($global_clock) begin
        assume (clk == !last_clk);
        last_clk <= clk;        
    end
    

    always @(negedge clk) begin
        if(f_past_valid) begin
            if(initial_reset_passed) begin
                assume(reset==0);
            end
        end
    end

    always @(posedge clk) begin 
        f_past_valid <= 1;

        if(f_past_valid) begin
            
            

            cover(display_trigger_read);

            // cover(display_active);

            cover(!$past(reset) && display_active && display_hpos==10);

            if(read_trigger_passed && vram_initialized && !$past(reset) && display_active && display_vpos<HACK_SCREEN_HEIGHT) begin
                assert(sram_sio_oe==0);
            end

            if($past(vram_initialized) && $rose(display_trigger_read)) begin
                read_trigger_passed <= 1;
            end

             if(initial_reset_passed) begin
                assume(reset==0);
            end

            // cover(!$past(reset) && $changed(display_hpos) && display_hpos==0);
        end
    end
`endif 

endmodule