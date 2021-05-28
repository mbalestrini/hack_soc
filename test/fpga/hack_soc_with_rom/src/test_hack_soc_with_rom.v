`default_nettype none
`timescale 1ns/10ps

module test_hack_soc_with_rom(
	input EXTERNAL_CLK, 
	input RESET_N,

	output RAM_CS_N,
	output RAM_SCK,
	inout RAM_SIO0,
	inout RAM_SIO1,
	inout RAM_SIO2,
	inout RAM_SIO3,

	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,

	output LEDR_N,
	output LEDG_N,

	input BTN1,
	input BTN2,
	input BTN3

	);

parameter WORD_WIDTH = 16;
parameter ADDRESS_WIDTH = 16;
// parameter ROM_FILE = "hack_programs/counter_loop.hack";
parameter ROM_FILE = "hack_programs/led_loop.hack";
// parameter ROM_FILE = "hack_programs/zero_op.hack";




wire debounced_btn1;
wire strobe_btn1;
debounce #(.NUMBER_STABLE_CYCLES(40)) mod_debouncer_btn1 (
	.clk(EXTERNAL_CLK),
    .reset(reset),
    .button(BTN1),
    .debounced(debounced_btn1),
    .strobe(strobe_btn1)
    );

wire debounced_btn2;
wire strobe_btn2;
debounce #(.NUMBER_STABLE_CYCLES(40)) mod_debouncer_btn2 (
	.clk(EXTERNAL_CLK),
    .reset(reset),
    .button(BTN2),
    .debounced(debounced_btn2),
    .strobe(strobe_btn2)
    );


reg [14:0] slow_clock_counter;
reg slow_clock_pause;
always @(posedge EXTERNAL_CLK) begin
	slow_clock_counter <= slow_clock_counter + 1;

	if(reset) begin
		slow_clock_pause <= 0;
	end else begin
		//if(!slow_clock_pause) 
			

		if(strobe_btn1 && debounced_btn1) begin
			slow_clock_pause <= ~slow_clock_pause;
		end
	end

end

// wire clk = EXTERNAL_CLK;
wire clk = (~slow_clock_pause & slow_clock_counter[14]) || debounced_btn2;
wire reset = ~RESET_N;



rom_M23LC1024 #(.ROM_FILE(ROM_FILE)) rom (
		.SI_SIO0(rom_sio0), 
		.SO_SIO1(rom_sio1), 
		.SCK(rom_sck), 
		.CS_N(rom_cs_n), 
		.SIO2(rom_sio2), 
		.HOLD_N_SIO3(rom_sio3), 
		.RESET(reset));


wire RAM_SIO0;
wire RAM_SIO1;
wire RAM_SIO2;
wire RAM_SIO3;

wire ram_sio_oe;
wire ram_sio0_i;
wire ram_sio1_i;
wire ram_sio2_i;
wire ram_sio3_i;
wire ram_sio0_o;
wire ram_sio1_o;
wire ram_sio2_o;
wire ram_sio3_o;

assign RAM_SIO0 = ram_sio_oe ? ram_sio0_o : 1'bZ;
assign ram_sio0_i = RAM_SIO0;

assign RAM_SIO1 = ram_sio_oe ? ram_sio1_o : 1'bZ;
assign ram_sio1_i = RAM_SIO1;

assign RAM_SIO2 = ram_sio_oe ? ram_sio2_o : 1'bZ;
assign ram_sio2_i = RAM_SIO2;

assign RAM_SIO3 = ram_sio_oe ? ram_sio3_o : 1'bZ;
assign ram_sio3_i = RAM_SIO3;

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




hack_soc soc(
	.clk(clk),
	.reset(reset),

	/** RAM: qspi serial sram **/
	.ram_cs_n(RAM_CS_N),
	.ram_sck(RAM_SCK),
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

	// DEBUG nets
	.debug_pc(debug_pc),
	.debug_addressM(debug_addressM),
	.debug_instruction(debug_instruction),
	.debug_gpio(debug_gpio)
	);



// DEBUG
wire [15:0] debug_pc;
wire [15:0] debug_addressM;
wire [15:0] debug_instruction;
wire [15:0] debug_gpio;

// assign {LED5, LED4, LED3, LED2} = debug_gpio[3:0];
assign {LED5, LED4, LED3, LED2} = debug_pc[3:0];
assign LEDR_N = ~debug_instruction[0];
assign LEDG_N = ~debug_instruction[1];
assign LED1 = debug_pc[0];
// assign LED1 = debug_pc[0];
// assign {LED2, LED3, LED4, LED5} = debug_pc[3:0];

endmodule