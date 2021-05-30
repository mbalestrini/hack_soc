`default_nettype none
`timescale 1ns/10ps

module fpga_hack_soc_plus_rom_loader(
	input EXTERNAL_CLK, 
	input RESET_N,

	output ROM_CS_N,
	output ROM_SCK,
	inout ROM_SIO0,
	inout ROM_SIO1,
	inout ROM_SIO2,
	inout ROM_SIO3,

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



// localparam  ROM_FILE = "hack_programs/test_assignment_and_jump.hack";
localparam	FILE_LINES = 24;
localparam  INSTRUCTION_WIDTH = 16;
localparam  ROM_ADDRESS_WIDTH = 16;
localparam HACK_GPIO_WIDTH = 16;


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

// ROM Loading Lines
wire rom_loader_reset;
wire rom_loader_load;
wire [INSTRUCTION_WIDTH-1:0] rom_loader_data;
wire rom_loader_ack;
wire rom_loader_load_received;



reg run_file_to_rom;

wire done_loading_rom;
wire file_to_rom_loader_reset;
wire file_to_rom_loader_load;
wire [INSTRUCTION_WIDTH-1:0] file_to_rom_loader_data;
load_file_to_rom #(
        .BYTE_COUNT(FILE_LINES),
        // .ROM_FILE(ROM_FILE),
        .DATA_WIDTH(INSTRUCTION_WIDTH)
    ) file_to_rom (

    .clk(clk), 
    .reset(reset),

    .run(run_file_to_rom),
    .done_loading(done_loading_rom),

    // Control lines
    .rom_loader_reset(rom_loader_reset),
    .rom_loader_load(rom_loader_load),
    .rom_loader_data(rom_loader_data),
    .rom_loader_ack(rom_loader_ack),
    .rom_loader_load_received(rom_loader_load_received)
);



wire RAM_SCK;
wire RAM_CS_N;
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



wire ROM_SCK;
wire ROM_CS_N;
wire ROM_SIO0;
wire ROM_SIO1;
wire ROM_SIO2;
wire ROM_SIO3;

wire rom_sio_oe;
wire rom_sio0_i;
wire rom_sio1_i;
wire rom_sio2_i;
wire rom_sio3_i;
wire rom_sio0_o;
wire rom_sio1_o;
wire rom_sio2_o;
wire rom_sio3_o;

assign ROM_SIO0 = rom_sio_oe ? rom_sio0_o : 1'bZ;
assign rom_sio0_i = ROM_SIO0;
assign ROM_SIO1 = rom_sio_oe ? rom_sio1_o : 1'bZ;
assign rom_sio1_i = ROM_SIO1;
assign ROM_SIO2 = rom_sio_oe ? rom_sio2_o : 1'bZ;
assign rom_sio2_i = ROM_SIO2;
assign ROM_SIO3 = rom_sio_oe ? rom_sio3_o : 1'bZ;
assign rom_sio3_i = ROM_SIO3;

rom_M23LC1024 ram (
		.SI_SIO0(RAM_SIO0), 
		.SO_SIO1(RAM_SIO1), 
		.SCK(RAM_SCK), 
		.CS_N(RAM_CS_N), 
		.SIO2(ROM_SIO2), 
		.HOLD_N_SIO3(ROM_SIO3), 
		.RESET(reset));


reg hack_external_reset;
wire [HACK_GPIO_WIDTH-1:0] gpio;

hack_soc soc(
	.clk(clk),
	.reset(reset),

	.hack_external_reset(hack_external_reset),

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
	.rom_cs_n(ROM_CS_N),
	.rom_sck(ROM_SCK),
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


	// ROM LOADING LINES
	// inputs
	.rom_loader_reset(rom_loader_reset),
	.rom_loader_load(rom_loader_load),
	.rom_loader_data(rom_loader_data),
	// outputs
	.rom_loader_ack(rom_loader_ack),
	.rom_loader_load_received(rom_loader_load_received),


	// GPIO
	.gpio(gpio)

	);



always @(posedge clk) begin
    if(reset) begin
        run_file_to_rom <= 0;
		hack_external_reset <= 1;
    end else begin
		if(done_loading_rom) begin
			hack_external_reset <= 0;
			run_file_to_rom <= 0;
		end else if(!run_file_to_rom) begin
        	run_file_to_rom <= 1;
		end
    end
    
end

// assign {LED5, LED4, LED3, LED2} = debug_gpio[3:0];
assign {LED5, LED4, LED3, LED2} = gpio[3:0];
assign LEDR_N = ~done_loading_rom;
assign LEDG_N = ~rom_loader_load;
assign LED1 = hack_external_reset;
// assign LED1 = debug_pc[0];
// assign {LED2, LED3, LED4, LED5} = debug_pc[3:0];

endmodule