`default_nettype none

module spi_video_ram_test #(
	parameter WORD_WIDTH = 16,
	parameter ADDRESS_WIDTH = 16
	)(
	input EXTERNAL_CLK, 	
	input RESET_N,
	
	
	output SRAM_CS_N,
	output SRAM_SCK,
	inout SRAM_SIO0,
	inout SRAM_SIO1,
	inout SRAM_SIO2,
	inout SRAM_SIO3,


	output HSYNC,
	output VSYNC,
	output RGB,


	output LEDR_N,
	output LEDG_N,

	input BTN1,
	input BTN3

	// output LED1,
	// output LED2,
	// output LED3,
	// output LED4,
	// output LED5

	);

// external request 
wire reset = !RESET_N || !pll_locked;
wire clk;



// sram encoder nets
reg request;
wire busy;	
wire initialized;
// wire sram_sio_oe;

wire sram_sio0_i;
wire sram_sio1_i;
wire sram_sio2_i;
wire sram_sio3_i;
// wire sram_sio0_o;
// wire sram_sio1_o;
// wire sram_sio2_o;
// wire sram_sio3_o;


// hack_cpu simulation nets
reg [ADDRESS_WIDTH-1:0] hack_addressM;
reg hack_writeM;
wire [WORD_WIDTH-1:0] hack_inM;
reg [WORD_WIDTH-1:0] hack_outM;




// wire pll_locked;
// pll_12_40 pll_1 (
//         .clock_in(EXTERNAL_CLK),
//         .clock_out(clk),
//         .locked(pll_locked)
//         );

wire pll_locked;
`ifndef SIM	
	pll_12___25_125 pll_1 (
        .clock_in(EXTERNAL_CLK),
        .clock_out(clk),
        .locked(pll_locked)
        );	
`else
	assign clk = EXTERNAL_CLK;
	assign pll_locked = 1;
`endif

// assign pll_locked = 1;
// assign clk = EXTERNAL_CLK;



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


wire encoder_sram_cs_n;
wire encoder_sram_sck;
wire encoder_sram_sio_oe;
wire encoder_sram_sio0_o;
wire encoder_sram_sio1_o;
wire encoder_sram_sio2_o;
wire encoder_sram_sio3_o;

spi_sram_encoder #(	.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH) )
		spi_sram_encoder_1
		(
			.clk(clk),
			.reset(reset ||  !writing_to_vram_mode), 

			.request(request),
			.busy(busy),
			.initialized(initialized),
			
			.address(hack_addressM),
			.write_enable(hack_writeM),
			.data_in(hack_inM),
			.data_out(hack_outM),

			.sram_cs_n(encoder_sram_cs_n),
			.sram_sck(encoder_sram_sck),

			.sram_sio_oe(encoder_sram_sio_oe),
			.sram_sio0_i(sram_sio0_i), 
			.sram_sio1_i(sram_sio1_i), 
			.sram_sio2_i(sram_sio2_i), 
			.sram_sio3_i(sram_sio3_i), 

			.sram_sio0_o(encoder_sram_sio0_o), 
			.sram_sio1_o(encoder_sram_sio1_o), 
			.sram_sio2_o(encoder_sram_sio2_o), 
			.sram_sio3_o(encoder_sram_sio3_o) 
		);


assign SRAM_CS_N = writing_to_vram_mode ? encoder_sram_cs_n : vram_cs_n;
assign SRAM_SCK = writing_to_vram_mode ? encoder_sram_sck : vram_sck;

wire sram_sio0_o = writing_to_vram_mode ? encoder_sram_sio0_o : vram_sio0_o;
wire sram_sio1_o = writing_to_vram_mode ? encoder_sram_sio1_o : vram_sio1_o;
wire sram_sio2_o = writing_to_vram_mode ? encoder_sram_sio2_o : vram_sio2_o;
wire sram_sio3_o = writing_to_vram_mode ? encoder_sram_sio3_o : vram_sio3_o;
wire sram_sio_oe = writing_to_vram_mode ? encoder_sram_sio_oe : vram_sio_oe;

assign SRAM_SIO0 = sram_sio_oe ? sram_sio0_o : 1'bZ;
assign sram_sio0_i = SRAM_SIO0;

assign SRAM_SIO1 = sram_sio_oe ? sram_sio1_o : 1'bZ;
assign sram_sio1_i = SRAM_SIO1;

assign SRAM_SIO2 = sram_sio_oe ? sram_sio2_o : 1'bZ;
assign sram_sio2_i = SRAM_SIO2;

assign SRAM_SIO3 = sram_sio_oe ? sram_sio3_o : 1'bZ;
assign sram_sio3_i = SRAM_SIO3;



wire [9:0] display_hpos;
wire [9:0] display_vpos;
wire display_active;
wire display_trigger_read;

wire display_clk = clk;
wire reset_display = reset || !vram_initialized;

video_signal_generator_640x480 #(.READ_TRIGGER_BEFORE_ACTIVE_CLKS(42 /*26 */)) 
    video_generator_1 (
        //i_clk,           // base clock
        .i_pix_stb(display_clk),       // pixel clock strobe
        .i_rst(reset_display),           // reset: restarts frame
        .o_hs(HSYNC),           // horizontal sync
        .o_vs(VSYNC),           // vertical sync
        // .o_blanking(),     // high during blanking interval
        .o_active(display_active),       // high during active pixel drawing
        // .o_screenend(),    // high for one tick at the end of screen
        // .o_animate(),      // high for one tick at end of active drawing
        .o_x(display_hpos),      // current pixel x position
        .o_y(display_vpos)  ,     // current pixel y position

        .o_trigger_read(display_trigger_read)
);


wire vram_cs_n;
wire vram_sck;
wire vram_sio_oe;
wire vram_sio0_o;
wire vram_sio1_o;
wire vram_sio2_o;
wire vram_sio3_o;

wire vram_initialized;
wire pixel_value;
spi_video_ram_2 spi_video_ram_1 (
    .clk(clk),
	.reset(reset || writing_to_vram_mode), 	

	.initialized(vram_initialized),

    .display_trigger_read(display_trigger_read),
    .display_active(display_active),
    .display_hpos(display_hpos),
    .display_vpos(display_vpos),
	.pixel_out(pixel_value),
	

    // Serial SRAM nets 
	.sram_cs_n(vram_cs_n),
	.sram_sck(vram_sck),

	.sram_sio_oe(vram_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.sram_sio0_i(sram_sio0_i), // sram_si_sio0 
	.sram_sio1_i(sram_sio1_i), // sram_so_sio1
	.sram_sio2_i(sram_sio2_i), // sram_sio2
	.sram_sio3_i(sram_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.sram_sio0_o(vram_sio0_o), // sram_si_sio0
	.sram_sio1_o(vram_sio1_o), // sram_so_sio1
	.sram_sio2_o(vram_sio2_o), // sram_sio2
	.sram_sio3_o(vram_sio3_o) // sram_hold_n_sio3

);




assign RGB = pixel_value;

assign LEDR_N = !(last_operation==op_error);
assign LEDG_N = !initialized || hack_addressM[15];

reg tmp;

reg was_busy;
// reg error;


reg [2:0] last_operation;
localparam [2:0]
	op_none			= 3'b000,
	op_write 		= 3'b001,
	op_read			= 3'b010,
	op_error		= 3'b011,
	op_vram_reads 	= 3'b100
	;

reg [$clog2(8192):0] writes_left;

reg writing_to_vram_mode;

reg prev_btn_request;

always @(posedge clk ) begin
	
	if (reset) begin
		// reset
		// error <= 0;

		tmp <= 0;		
		prev_btn_request <= 0;

		request <= 0;

		hack_addressM <= 16'h0;
		hack_writeM <= 1'b1;
		hack_outM <= 16'hFF00; //16'h650F;

		last_operation <= op_none;

		writing_to_vram_mode <= 1;
		`ifndef SIM
		writes_left <= 8192;
		`else
		writes_left <= 10;
		`endif

	end	else begin

		was_busy<=busy;

		if(!busy && was_busy && request)
			request <= 0;

		if(initialized && !busy && !request) begin

			case(last_operation)
				op_none:
					begin
						// Prepare next write
						last_operation <= op_write;	
						// hack_addressM <= hack_addressM + 16'b1;
						hack_writeM <= 1'b1;
						// hack_outM <= hack_outM + 1'b1;//16'h6666;
						request <= 1;
					end

				op_read:
					begin
						if(/*was_busy &&*/ hack_outM!=hack_inM) begin
							last_operation <= op_error;
							request <= 0;
						end else begin
							// Prepare next write
							if(writes_left>0) begin
								writes_left <= writes_left - 1;
								last_operation <= op_write;	
								hack_addressM <= hack_addressM + 16'b1;
								hack_writeM <= 1'b1;
								hack_outM <= ~hack_outM; //hack_outM + 1'b1;//16'h6666;
								request <= 1;
							end else begin
								last_operation <= op_vram_reads;		
								writing_to_vram_mode <= 0;						
							end
						end
					end

				op_write:
					begin
						// Prepare read
						last_operation <= op_read;				
						// hack_addressM <= 16'h5555;
						hack_writeM <= 1'b0;
						//hack_outM <= 1
						request <= 1;
					end

				default:
					begin
						request <= 0;
					end

			endcase
		end

		
		prev_btn_request <= debounced_btn1;

		if(debounced_btn1 && prev_btn_request==0) begin
			tmp <= ~tmp;
			last_operation <= op_none;
			request <= 0;

		end	

		
	end
end



endmodule

