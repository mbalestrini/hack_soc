`default_nettype none

module sram_encoder_test_auto #(
	parameter WORD_WIDTH = 16,
	parameter ADDRESS_WIDTH = 16
	)(
	input EXTERNAL_CLK, 
	
	input RESET_N,
	input BTN_REQUEST,
	
	output SRAM_CS_N,
	output SRAM_SCK,
	inout SRAM_SIO0,
	inout SRAM_SIO1,
	inout SRAM_SIO2,
	inout SRAM_SIO3,

	output LEDR_N,
	output LEDG_N

	// output LED1,
	// output LED2,
	// output LED3,
	// output LED4,
	// output LED5

	);

// external request 
wire reset = !RESET_N || !pll_locked;
wire clk;

wire debounced_btn_request;
reg prev_btn_request;


// sram encoder nets
reg request;
wire busy;	
wire initialized;
wire sram_sio_oe;

wire sram_sio0_i;
wire sram_sio1_i;
wire sram_sio2_i;
wire sram_sio3_i;
wire sram_sio0_o;
wire sram_sio1_o;
wire sram_sio2_o;
wire sram_sio3_o;


// hack_cpu simulation nets
reg [ADDRESS_WIDTH-1:0] hack_addressM;
reg hack_writeM;
wire [WORD_WIDTH-1:0] hack_inM;
reg [WORD_WIDTH-1:0] hack_outM;



// slow clock for debounce
reg [13:0] clock_divider;    
wire slow_clk;
always @(posedge clk ) begin
    begin
        clock_divider <= clock_divider + 1;
    end
end
assign slow_clk = clock_divider[13];


wire pll_locked;
pll_12_40 pll_1 (
        .clock_in(EXTERNAL_CLK),
        .clock_out(clk),
        .locked(pll_locked)
        );
// assign pll_locked = 1;
// assign clk = EXTERNAL_CLK;

debounce #(.NUMBER_STABLE_CYCLES(20)) debounce_1 (
	.clk(slow_clk),
    .reset(reset),
    .button(BTN_REQUEST),
    .debounced(debounced_btn_request)
    );


spi_sram_encoder #(	.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH) )
		spi_sram_encoder_1
		(
			.clk(clk),
			.reset(reset), 

			.request(request),
			.busy(busy),
			.initialized(initialized),
			
			.address(hack_addressM),
			.write_enable(hack_writeM),
			.data_in(hack_inM),
			.data_out(hack_outM),

			.sram_cs_n(SRAM_CS_N),
			.sram_sck(SRAM_SCK),

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

assign SRAM_SIO0 = sram_sio_oe ? sram_sio0_o : 1'bZ;
assign sram_sio0_i = SRAM_SIO0;

assign SRAM_SIO1 = sram_sio_oe ? sram_sio1_o : 1'bZ;
assign sram_sio1_i = SRAM_SIO1;

assign SRAM_SIO2 = sram_sio_oe ? sram_sio2_o : 1'bZ;
assign sram_sio2_i = SRAM_SIO2;

assign SRAM_SIO3 = sram_sio_oe ? sram_sio3_o : 1'bZ;
assign sram_sio3_i = SRAM_SIO3;



// assign LED1 = last_operation==op_error;
// assign LED2 = initialized;
// assign LED3 = busy;
// assign LED4 = (hack_outM==hack_inM);
// assign LED5 = hack_addressM[15];

assign LEDR_N = !(last_operation==op_error);
assign LEDG_N = !initialized || hack_addressM[15];

reg tmp;

reg was_busy;
// reg error;

reg [1:0] last_operation;
localparam [1:0]
	op_none		= 2'b00,
	op_write 	= 2'b01,
	op_read		= 2'b10,
	op_error	= 2'b11
	;


always @(posedge clk ) begin
	
	if (reset) begin
		// reset
		// error <= 0;

		tmp <= 0;		
		prev_btn_request <= 0;

		request <= 0;

		hack_addressM <= 16'h1536;
		hack_writeM <= 1'b1;
		hack_outM <= 16'h650F;

		last_operation <= op_none;


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
							last_operation <= op_write;	
							hack_addressM <= hack_addressM + 16'b1;
							hack_writeM <= 1'b1;
							hack_outM <= hack_outM + 1'b1;//16'h6666;
							request <= 1;
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

		
		prev_btn_request <= debounced_btn_request;

		if(debounced_btn_request && prev_btn_request==0) begin
			tmp <= ~tmp;
			last_operation <= op_none;
			request <= 0;

		end	

		
	end
end



endmodule

