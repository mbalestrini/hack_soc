`default_nettype none
`timescale 1ns/10ps

module hack_soc (
	input clk,
	input reset,

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


	// DEBUG nets
	output [ROM_ADDRESS_WIDTH-1:0] debug_pc,
	output [RAM_ADDRESS_WIDTH-1:0] debug_addressM,
	output [INSTRUCTION_WIDTH-1:0] debug_instruction,
	output reg [WORD_WIDTH-1:0] debug_gpio

	);

// Include main project parameters
`include "includes/params.v"

reg [1:0] hack_wait_clocks;
wire hack_clk_strobe;

wire hack_clk;
wire hack_reset;
wire [RAM_ADDRESS_WIDTH-1:0] hack_addressM;
wire hack_writeM;
wire [WORD_WIDTH-1:0] hack_inM;
wire [WORD_WIDTH-1:0] hack_outM;
wire [INSTRUCTION_WIDTH-1:0] hack_instruction;
wire [ROM_ADDRESS_WIDTH-1:0] hack_pc;

hack_clock hack_clock_0(
	.clk(clk),
	.reset(reset),
	.hack_clk(hack_clk),
	.strobe(hack_clk_strobe)
);


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



// inputs to spi_sram_encoder
wire ram_request;
// outputs from spi_sram_encoder
wire ram_busy;
wire ram_initialized;
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
			.data_in(hack_inM),
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
// outputs from spi_sram_encoder
wire rom_busy;
wire rom_initialized;
wire [WORD_WIDTH-1:0] rom_data_out = {WORD_WIDTH{1'b0}};
spi_sram_encoder #(	.WORD_WIDTH(INSTRUCTION_WIDTH), .ADDRESS_WIDTH(ROM_ADDRESS_WIDTH) )
		rom_encoder_0
		(
			.clk(clk),
			.reset(reset), 

			.request(rom_request),
			.busy(rom_busy),
			.initialized(rom_initialized),
			
			.address(hack_pc),
			.write_enable(1'b0), // Cant write from HACK_CPU
			.data_in(hack_instruction),
			.data_out(rom_data_out),

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



always @(posedge clk ) begin
	if(reset) begin
		hack_wait_clocks <= 2;		
	end else begin
		if(hack_wait_clocks!=0 && hack_clk_strobe && hack_clk) begin 
			hack_wait_clocks <= hack_wait_clocks - 2'b1;
		end
	end
	
end


assign hack_reset = (hack_wait_clocks!=0) || reset || !ram_initialized || !rom_initialized;
assign ram_request = !ram_busy && hack_clk && hack_clk_strobe;
assign rom_request = !rom_busy && hack_clk && hack_clk_strobe;





always @(posedge hack_clk ) begin
	if(hack_reset) begin
		debug_gpio <= 0;	
	end else begin
		if(hack_addressM==0 && hack_writeM) begin
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


endmodule