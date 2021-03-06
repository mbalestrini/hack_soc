`default_nettype none
`timescale 1ns/10ps

module hack_soc_serial_rom_loader (
	input EXTERNAL_CLK, 
	input RESET_N,

	input RX, 
	output TX, 

	output ROM_CS_N,
	output ROM_SCK,
	inout ROM_SIO0,
	inout ROM_SIO1,
	inout ROM_SIO2,
	inout ROM_SIO3,

	output RAM_CS_N,
	output RAM_SCK,
	inout RAM_SIO0,
	inout RAM_SIO1,
	inout RAM_SIO2,
	inout RAM_SIO3,


	output VRAM_CS_N,
	output VRAM_SCK,
	inout VRAM_SIO0,
	inout VRAM_SIO1,
	inout VRAM_SIO2,
	inout VRAM_SIO3,

	output HSYNC,
	output VSYNC,
	output RGB,

	// output LED1,
	// output LED2,
	// output LED3,
	// output LED4,
	// output LED5,

	output LEDR_N,
	output LEDG_N,

	input BTN1,
	// input BTN2,
	input BTN3

	);


// RAM temporar;y disabled
wire RAM_CS_N;
wire RAM_SCK;
wire RAM_SIO0;
wire RAM_SIO1;
wire RAM_SIO2;
wire RAM_SIO3;



localparam WORD_WIDTH = 16;
localparam  INSTRUCTION_WIDTH = 16;
localparam  ROM_ADDRESS_WIDTH = 16;
localparam HACK_GPIO_WIDTH = 16;


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


reg [14:0] slow_clock_counter;
reg slow_clock_pause;
always @(posedge clk) begin
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


reg serial_transmit;
wire serial_received;
wire serial_is_receiving;
wire serial_is_transmitting;
wire serial_recv_error;
reg [7:0] serial_tx_byte;
wire [7:0] serial_rx_byte;
uart uart_1 (
    .clk(clk), // The master clock for this module
    .rst(reset), // Synchronous reset.
    .rx(RX), // Incoming serial line
    .tx(TX), // Outgoing serial line
    .transmit(serial_transmit), // Signal to transmit
    .tx_byte(serial_tx_byte), // Byte to transmit
    .received(serial_received), // Indicated that a byte has been received.
    .rx_byte(serial_rx_byte), // Byte received
    .is_receiving(serial_is_receiving), // Low when receive line is idle.
    .is_transmitting(serial_is_transmitting), // Low when transmit line is idle.
    .recv_error(serial_recv_error) // Indicates error in receiving packet.
);







// 25.125 MHz clock
wire clk = video_clk_25Mhz;
wire video_clk = video_clk_25Mhz;
wire video_clk_25Mhz;
wire video_clk_pll_locked;
pll_12___25_125 pll_1 (
        .clock_in(EXTERNAL_CLK),
        .clock_out(video_clk_25Mhz),
        .locked(video_clk_pll_locked)
        );


// // 31.5 MHz clock
// wire clk = video_clk_31Mhz;
// wire video_clk = video_clk_31Mhz;
// wire video_clk_31Mhz;
// wire video_clk_pll_locked;
// pll_12___31_5 pll_1 (
//         .clock_in(EXTERNAL_CLK),
//         .clock_out(video_clk_31Mhz),
//         .locked(video_clk_pll_locked)
//         );

// wire clk;
// wire clk = EXTERNAL_CLK;
// wire clk = (~slow_clock_pause & slow_clock_counter[14]) || debounced_btn3;
// wire reset = ~RESET_N;



// wire done_loading_rom;
// wire file_to_rom_loader_reset;
// wire file_to_rom_loader_load;
// wire [INSTRUCTION_WIDTH-1:0] file_to_rom_loader_data;
// load_pattern_to_rom #(
//         .WORDS_TO_LOAD(2048),
//         .DATA_WIDTH(INSTRUCTION_WIDTH)
//     ) file_to_rom (

//     .clk(clk), 
//     .reset(reset),

//     .run(run_file_to_rom),
//     .done_loading(done_loading_rom),

//     // Control lines
//     .rom_loader_load(rom_loader_load),
//     .rom_loader_data(rom_loader_data),
//     .rom_loader_ack(rom_loader_ack),
// );





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



wire VRAM_SCK;
wire VRAM_CS_N;
wire VRAM_SIO0;
wire VRAM_SIO1;
wire VRAM_SIO2;
wire VRAM_SIO3;

wire vram_sio_oe;
wire vram_sio0_i;
wire vram_sio1_i;
wire vram_sio2_i;
wire vram_sio3_i;
wire vram_sio0_o;
wire vram_sio1_o;
wire vram_sio2_o;
wire vram_sio3_o;

assign VRAM_SIO0 = (vram_sio_oe ? vram_sio0_o : 1'bZ);
assign vram_sio0_i = VRAM_SIO0;
assign VRAM_SIO1 = (vram_sio_oe ? vram_sio1_o : 1'bZ);
assign vram_sio1_i = VRAM_SIO1;
assign VRAM_SIO2 = (vram_sio_oe ? vram_sio2_o : 1'bZ);
assign vram_sio2_i = VRAM_SIO2;
assign VRAM_SIO3 = (vram_sio_oe ? vram_sio3_o : 1'bZ);
assign vram_sio3_i = VRAM_SIO3;






wire reset;
reg hack_external_reset;
wire [HACK_GPIO_WIDTH-1:0] gpio;
// wire [15:0] debug_pc;
wire keycode;


hack_soc soc(
	.clk(clk),
	.display_clk(video_clk),
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


	/** VRAM: qspi serial sram **/
	.vram_cs_n(VRAM_CS_N),
	.vram_sck(VRAM_SCK),
	.vram_sio_oe(vram_sio_oe), // output enable the SIO lines
	// SIO as inputs from SRAM	
	.vram_sio0_i(vram_sio0_i), // sram_si_sio0 
	.vram_sio1_i(vram_sio1_i), // sram_so_sio1
	.vram_sio2_i(vram_sio2_i), // sram_sio2
	.vram_sio3_i(vram_sio3_i), // sram_hold_n_sio3
	// SIO as outputs to SRAM
	.vram_sio0_o(vram_sio0_o), // sram_si_sio0
	.vram_sio1_o(vram_sio1_o), // sram_so_sio1
	.vram_sio2_o(vram_sio2_o), // sram_sio2
	.vram_sio3_o(vram_sio3_o), // sram_hold_n_sio3



	// ** DISPLAY ** //
	.display_hsync(HSYNC),
	.display_vsync(VSYNC),
	.display_rgb(display_rgb),


	// ROM LOADING LINES
	// inputs
	.rom_loader_load(rom_loader_load),
	.rom_loader_sck(rom_loader_sck),
	.rom_loader_data(rom_loader_data),
	// outputs
	.rom_loader_ack(rom_loader_ack),


	// Keyboard
	.keycode(keycode),

	// GPIO
	.gpio(gpio)


	// DEBUG	
	// .debug_pc(debug_pc)


	);







// ROM Loading Lines
reg rom_loader_load;
reg [INSTRUCTION_WIDTH-1:0] rom_loader_data;
reg rom_loader_sck;
wire rom_loader_ack;

reg [7:0] serial_first_byte;
reg serial_word_idx;

wire display_rgb;

assign RGB = display_rgb;
assign reset = !RESET_N || !video_clk_pll_locked;
//assign hack_external_reset = rom_loader_load | debounced_btn3;

always @(posedge clk ) begin
	if(reset) begin
		hack_external_reset <= 1;		
	end else begin
		hack_external_reset <= rom_loader_load;		
	end
end

always @(posedge clk ) begin
    if(reset) begin
        serial_transmit <= 0;
        serial_tx_byte <= 0;
		serial_first_byte <= 8'b0;
		serial_word_idx <= 0;		

		rom_loader_load <= 0;
		rom_loader_sck <= 0;


    end else begin
        serial_transmit <= 0;
        if(serial_received) begin
			if(rom_loader_load==0) begin
				rom_loader_load <= 1;
			end

			if(serial_word_idx==0) begin
				serial_first_byte <= serial_rx_byte;
				serial_word_idx <= 1;
			end else  begin
				rom_loader_data <= {serial_first_byte, serial_rx_byte};
				rom_loader_sck <= 1;
				serial_word_idx <= 0;
			end
            //serial_tx_byte <= serial_rx_byte;
            //serial_transmit <= 1;
        end 

		if(rom_loader_ack) begin
			rom_loader_sck <= 0;
			serial_transmit <= 1;
			serial_tx_byte <= {rom_loader_data[15:12], rom_loader_data[3:0]};
		end

		if(strobe_btn1) begin
			rom_loader_load <= 0;
		end
    end
end






assign keycode = TEST_KEYBOARD[7:0];

reg [WORD_WIDTH-1:0] TEST_KEYBOARD;
always @(posedge clk) begin
	if(reset) begin
		TEST_KEYBOARD <= 97;
	end else begin
		if(strobe_btn1) begin
			TEST_KEYBOARD <= TEST_KEYBOARD + 1;
			if(TEST_KEYBOARD>98) begin
				TEST_KEYBOARD <= 97;
			end	
		end
	end
end



// assign {LED5, LED4, LED3, LED2} = debug_gpio[3:0];
// assign {LED5, LED4, LED3, LED2} = gpio[3:0];

assign LEDR_N = ~gpio[0];
assign LEDG_N = ~gpio[1];
// assign LED1 = !ready_to_start | debug_pc[0];

// assign FLASH_SSB = gpio[0];
// assign FLASH_SCK = gpio[1];
// assign FLASH_IO0 = gpio[2];
// assign FLASH_IO1 = gpio[3];
// assign FLASH_IO2 = gpio[4];
// assign FLASH_IO3 = gpio[5];

// assign LED1 = debug_pc[0];
// assign {LED2, LED3, LED4, LED5} = debug_pc[3:0];



`ifdef FORMAL

	
	reg f_past_valid = 0;
	reg [9:0] counter;
	
	initial assume(reset);

	always @(posedge clk ) begin
		counter <= counter + 1;

		f_past_valid <= 1;

		// if(counter<10)
			// assume();
		if(f_past_valid)
			cover(rom_loader_load);
	end

`endif 



endmodule