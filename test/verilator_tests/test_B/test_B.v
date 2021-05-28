`default_nettype none
`timescale 1ns / 1ps



module test_B (
	input clk,
	input reset,


	output ram_sck,
	output ram_cs_n,
	inout ram_sio0,
	inout ram_sio1,
	inout ram_sio2,
	inout ram_sio3,

	output rom_sck,
	output rom_cs_n,
	inout rom_sio0,
	inout rom_sio1,
	inout rom_sio2,
	inout rom_sio3

);




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


/* verilator lint_off UNUSED */
wire [14:0] debug_pc;
wire [14:0] debug_addressM;
wire [15:0] debug_instruction;
wire [15:0] debug_gpio;
/* verilator lint_on UNUSED */	


hack_soc soc(
	.clk(clk),
	.reset(reset),

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


	.debug_pc(debug_pc),
	.debug_addressM(debug_addressM),
	.debug_instruction(debug_instruction),
	.debug_gpio(debug_gpio)

);




`define CONSOLE_OUTPUT_RED "\033[0;31m"
`define CONSOLE_OUTPUT_LIGHT_BLUE "\033[1;34m"
`define CONSOLE_NO_COLOR "\033[0m"


initial begin

	$display(`CONSOLE_OUTPUT_LIGHT_BLUE);
	$display("test module starting"); 
	$display(`CONSOLE_NO_COLOR);
	// $finish; 
end



// reg [31:0] internal_reg;

// assign data_out = internal_reg[0];


// always @(posedge clk) begin
// 	if (reset) begin
// 		// reset
// 		internal_reg <= 0;		
// 	end
// 	else begin
// 		internal_reg <= internal_reg + {31'b0, data_in};


// 		// $display("data_in:%0h data_out:%0h internal_reg: %0h", data_in, data_out, internal_reg); 

// 	end
// end



endmodule