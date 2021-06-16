module hack_soc_serial_rom_loader_tb;





M23LC1024 ram (
		.SI_SIO0(ram_sio0), 
		.SO_SIO1(ram_sio1), 
		.SCK(ram_sck), 
		.CS_N(ram_cs_n), 
		.SIO2(ram_sio2), 
		.HOLD_N_SIO3(ram_sio3), 
		.RESET(reset));

M23LC1024 rom (
		.SI_SIO0(rom_sio0), 
		.SO_SIO1(rom_sio1), 
		.SCK(rom_sck), 
		.CS_N(rom_cs_n), 
		.SIO2(rom_sio2), 
		.HOLD_N_SIO3(rom_sio3), 
		.RESET(reset));

M23LC1024 vram (
		.SI_SIO0(vram_sio0), 
		.SO_SIO1(vram_sio1), 
		.SCK(vram_sck), 
		.CS_N(vram_cs_n), 
		.SIO2(vram_sio2), 
		.HOLD_N_SIO3(vram_sio3), 
		.RESET(reset));		

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

wire vram_sck;
wire vram_cs_n;
wire vram_sio0;
wire vram_sio1;
wire vram_sio2;
wire vram_sio3;

wire vram_sio_oe;
wire vram_sio0_i;
wire vram_sio1_i;
wire vram_sio2_i;
wire vram_sio3_i;
wire vram_sio0_o;
wire vram_sio1_o;
wire vram_sio2_o;
wire vram_sio3_o;

assign vram_sio0 = vram_sio_oe ? vram_sio0_o : 1'bZ;
assign vram_sio0_i = vram_sio0;
assign vram_sio1 = vram_sio_oe ? vram_sio1_o : 1'bZ;
assign vram_sio1_i = vram_sio1;
assign vram_sio2 = vram_sio_oe ? vram_sio2_o : 1'bZ;
assign vram_sio2_i = vram_sio2;
assign vram_sio3 = vram_sio_oe ? vram_sio3_o : 1'bZ;
assign vram_sio3_i = vram_sio3;



wire clk;
wire reset;
wire reset_n = ~reset;


wire RX;
wire TX;

wire HSYNC;
wire VSYNC;
wire RGB;
wire LEDG_N;
wire LEDR_N;
wire BTN1;
wire BTN3;

hack_soc_serial_rom_loader hack_soc_fpga (
	.EXTERNAL_CLK(clk), 
	.RESET_N(reset_n),

	.RX(RX), 
	 .TX(TX), 

	 .ROM_CS_N(rom_cs_n),
	 .ROM_SCK(rom_sck),
	 .ROM_SIO0(rom_sio0),
	 .ROM_SIO1(rom_sio1),
	 .ROM_SIO2(rom_sio2),
	 .ROM_SIO3(rom_sio3),

	 .RAM_CS_N(ram_cs_n),
	 .RAM_SCK(ram_sck),
	 .RAM_SIO0(ram_sio0),
	 .RAM_SIO1(ram_sio1),
	 .RAM_SIO2(ram_sio2),
	 .RAM_SIO3(ram_sio3),


	 .VRAM_CS_N(vram_cs_n),
	 .VRAM_SCK(vram_sck),
	 .VRAM_SIO0(vram_sio0),
	 .VRAM_SIO1(vram_sio1),
	 .VRAM_SIO2(vram_sio2),
	 .VRAM_SIO3(vram_sio3),

	 .HSYNC(HSYNC),
	 .VSYNC(VSYNC),
	 .RGB(RGB),

	//  .LED1(LED1),
	//  .LED2(LED2),
	//  .LED3(LED3),
	//  .LED4(LED4),
	//  .LED5(LED5),

	 .LEDR_N(LEDR_N),
	 .LEDG_N(LEDG_N),

	.BTN1(BTN1),
	// .BTN2(BTN2),
	.BTN3(BTN3)
);

	

endmodule
