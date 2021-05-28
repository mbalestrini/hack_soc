`default_nettype none
`timescale 1ns/10ps

module encoder_with_23LC2014_tb #(
	parameter WORD_WIDTH = 16,
	parameter ADDRESS_WIDTH = 16
	) (

	input wire clk,
	input wire reset,

	input wire request,
	input wire [ADDRESS_WIDTH-1:0] hack_addressM,
	input wire hack_writeM, 
	input wire [WORD_WIDTH-1:0] hack_outM,
	output wire [WORD_WIDTH-1:0] hack_inM

	// output sram_cs_n,	
	// inout sram_sio0,
	// inout sram_sio1,
	// inout sram_sio2,
	// inout sram_sio3
	
	);

	reg tmp;

	wire busy;	
	wire initialized;

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

	
	spi_sram_encoder #(	.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH) )
		_spi_sram_encoder 		
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


	M23LC1024 _23ml1024 (
		.SI_SIO0(sram_sio0), 
		.SO_SIO1(sram_sio1), 
		.SCK(sram_sck), 
		.CS_N(sram_cs_n), 
		.SIO2(sram_sio2), 
		.HOLD_N_SIO3(sram_sio3), 
		.RESET(reset));


	always @(posedge clk) begin
		if (reset) begin
			// reset
			tmp <= 0;
		end
		else begin
			tmp <= ~tmp;
		end
	end

endmodule

