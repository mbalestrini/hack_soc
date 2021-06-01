`default_nettype none
`timescale 1ns/10ps

// Boceto:

 // Entrada de escrituras (que vienen de HACK)

// Entradas de indices y marcadores de video para saber cuando empezar a leer una linea?

// Inicializar modo QSI

// Buffer FIFO de escritura (8 registros? [16 bits de address + 16 bits de data])

// Mienstras no esta leyendo la linea puede escribir. deberia cortas a tiempos para empezar antes que se necesite el primer dato

// Sincronizacion de tiempos entre lectura de la memoria y salida del video?
//     (Correr al RAM con clock de video / 4? en modo QSI eso haria que fueran a la misma velocidad el video y los bits que van saliendo)
//     (La memoria deberia leer asi los proximos 4 bits)

// Podria hacer que lea a clock de video / 4 y que escriba a clock de video / 2 (no puedo /1 porque 25.1MHz es mucho para la 23lc1024)
//                                 ~6.2MHz                                  ~12.5MHz





// Lectura 
//     instruccion lectura
//     address de inicio de linea
//     1 dummy bytes
//     128 lecturas de 4 bits cada una

// Que trigger iniciaria la Lectura?


// Escritura
//     Si no se dan las condiciones para el trigger de lectura:
//         Recorre la FIFO
//             Escritura de data 16 bits en address



module spi_video_ram (
    input wire clk,
	input wire reset, 	


    input display_trigger_read,
    input display_active,
    input [9:0] display_hpos,
    input [9:0] display_vpos,
	output  pixel_out,
	

    // Serial SRAM nets 
	output reg sram_cs_n,
	output wire sram_sck,

	output reg sram_sio_oe, // output enable the SIO lines
	// SIO as inputs from SRAM	
	input wire sram_sio0_i, // sram_si_sio0 
	input wire sram_sio1_i, // sram_so_sio1
	input wire sram_sio2_i, // sram_sio2
	input wire sram_sio3_i, // sram_hold_n_sio3
	// SIO as outputs to SRAM
	output wire sram_sio0_o, // sram_si_sio0
	output wire sram_sio1_o, // sram_so_sio1
	output wire sram_sio2_o, // sram_sio2
	output wire sram_sio3_o // sram_hold_n_sio3

);

// 23LC1024 Instruction codes
`define INS_READ      8'b0000_0011                          // Read instruction
`define INS_WRMR      8'b0000_0001                          // Write Mode Register instruction
`define INS_WRITE     8'b0000_0010                          // Write instruction
`define INS_RDMR      8'b0000_0101                          // Read Mode Register instruction
`define INS_EDIO      8'b0011_1011                          // Enter Dual I/O instruction
`define INS_EQIO      8'b0011_1000                          // Enter Quad I/O instruction
`define INS_RSTIO     8'b1111_1111                          // Reset Dual and Quad I/O instruction

`define BYTEMODE  2'b00                                 // Byte operation mode
`define PAGEMODE  2'b10                                 // Page operation mode
`define SEQMODE   2'b01                                 // Sequential operation mode

`define SPIMODE   2'b00                                 // SPI I/O mode
`define SDIMODE   2'b01                                 // SDI I/O mode
`define SQIMODE   2'b10                                 // SQI I/O mode 


// 23LC1024 Address width
localparam SRAM_ADDRESS_WIDTH = 24;
localparam HACK_SCREEN_WIDTH = 512;
localparam HACK_SCREEN_HEIGHT = 256;
localparam OUTPUT_BUFFER_WIDTH = SRAM_ADDRESS_WIDTH;
localparam INPUT_BUFFER_WIDTH = 4;
localparam SRAM_INSTRUCTION_WIDTH = 8;
localparam BITS_PER_CLK = 4;
`ifndef FORMAL
localparam INPUT_NIBBLES_PER_LINE = (HACK_SCREEN_WIDTH/4);
`else
localparam INPUT_NIBBLES_PER_LINE = (HACK_SCREEN_WIDTH/4); //24;
`endif

// states
localparam [2:0]
	state_idle 			= 3'b000,
	state_start_read_line			= 3'b001,
	state_read_instruction 	= 3'b010,
	state_read_address 		= 3'b011,
	state_read_line		= 3'b100,
	state_read_dummy_bytes 		= 3'b101,	
	state_reset 		= 3'b110,
	state_set_SQI_mode 	= 3'b111
	;


wire busy;
reg initialized;
reg [2:0] current_state;
reg [4:0] initializing_step;
reg [SRAM_ADDRESS_WIDTH-1:0] line_read_address;
reg [OUTPUT_BUFFER_WIDTH-1:0] output_buffer;
reg [$clog2(OUTPUT_BUFFER_WIDTH)-1:0] output_bits_left;
reg [INPUT_BUFFER_WIDTH-1:0] input_buffer;
reg [$clog2(INPUT_NIBBLES_PER_LINE):0] input_nibbles_left;


reg start_read;


reg half_freq_clk;
reg quarter_freq_clk;
reg quarter_freq_clk_hist;

wire quarter_freq_clk_rise_edge = half_freq_clk & quarter_freq_clk;
wire quarter_freq_clk_fall_edge = half_freq_clk & ~quarter_freq_clk;
wire quarter_x = ~half_freq_clk & quarter_freq_clk;

always @(posedge clk) begin
    if(reset) begin
        half_freq_clk <= 0;
        start_read <= 0;
    end else begin

        // Start read a reset clock for synchronization
        if(display_trigger_read && !busy && display_vpos<HACK_SCREEN_HEIGHT) begin
            start_read <= 1;    
            half_freq_clk <= 0;
            quarter_freq_clk <= 0;            
        end else begin
            if(current_state==state_start_read_line) begin
                start_read <= 0;
            end            
            half_freq_clk <= ~half_freq_clk;
            if(~half_freq_clk) begin
                quarter_freq_clk <= ~quarter_freq_clk;
            end
        end  
        
    end
end



assign {sram_sio3_o, sram_sio2_o, sram_sio1_o, sram_sio0_o} = output_buffer[OUTPUT_BUFFER_WIDTH-1:OUTPUT_BUFFER_WIDTH-4];
assign busy = (current_state!=state_idle);


assign sram_sck = current_state!=state_read_line ? half_freq_clk : quarter_freq_clk;
// always @(posedge clk ) begin
//     if(current_state!=state_read_line) begin
//         sram_sck <= ~half_freq_clk;        
//     end else begin        
//         sram_sck <= ~quarter_freq_clk;
//     end    
// end

// always @(posedge clk ) begin
//     if(reset) begin
//         start_read <= 0;
//     end else begin
//         if(display_trigger_read && !busy && display_vpos<HACK_SCREEN_HEIGHT) begin
//             start_read <= 1;    
//         end else if(current_state==state_start_read_line) begin
//             start_read <= 0;
//         end        
//     end
// end

wire [1:0] temp_pixel_index = ~(display_hpos[1:0]);
wire pixel_out = input_buffer[temp_pixel_index];
// always @(posedge clk ) begin
//     pixel_out <= input_buffer[temp_pixel_index];
// end


always @(posedge clk ) begin
    if(reset) begin

        current_state <= state_set_SQI_mode;
        
        initialized <= 1'b0;
		sram_cs_n <= 1'b1;				
		sram_sio_oe <= 1'b1;
        
        // Keep HOLD_N high during initialization
        // sram_sio3_o <= 1'b1;
		output_buffer[OUTPUT_BUFFER_WIDTH-1:OUTPUT_BUFFER_WIDTH-4] <= 4'b1111;


        initializing_step <= 0;

        line_read_address <= 0;
        
    end else begin
       if(half_freq_clk) begin
			/* verilator lint_off CASEINCOMPLETE */
           case(current_state)
            state_set_SQI_mode: begin
                // Enable device
                if(sram_cs_n==1'b1)
                    sram_cs_n <= 1'b0;		
                
                initializing_step <= initializing_step + 1;

                // Output INS_EQIO (8'b0011_1000): Enter Quad I/O instruction
                case (initializing_step)
                    0: output_buffer[20] <= 0;
                    1: output_buffer[20] <= 0;
                    2: output_buffer[20] <= 1;
                    3: output_buffer[20] <= 1;
                    4: output_buffer[20] <= 1;
                    5: output_buffer[20] <= 0;
                    6: output_buffer[20] <= 0;
                    7: output_buffer[20] <= 0;
                    8: 	begin
                            current_state <= state_idle;
                            sram_cs_n <= 1'b1;	
                            initialized <= 1'b1;								
                        end
                endcase
                
            end

            state_idle: begin
                if(!busy && start_read) begin                    
                    current_state <= state_start_read_line;                        
                    // Enable output GPIO
                    sram_sio_oe <= 1'b1;                    
                end
            end

            state_start_read_line: begin
                current_state <= state_read_instruction;
                
                // Enable device
                sram_cs_n <= 1'b0;		
                
                // fill the buffer with the instruction data
                output_buffer <= {`INS_READ,  {(OUTPUT_BUFFER_WIDTH-SRAM_INSTRUCTION_WIDTH){1'b0}}};
                output_bits_left <= SRAM_INSTRUCTION_WIDTH;					
            end
            
            state_read_instruction: begin                
                // Last bits of instruction?
                if(output_bits_left == BITS_PER_CLK) begin
                    current_state <= state_read_address;			
                    // Load Address
                    output_buffer <= { {(OUTPUT_BUFFER_WIDTH-SRAM_ADDRESS_WIDTH){1'b0}}, line_read_address};
                    output_bits_left <= SRAM_ADDRESS_WIDTH;
                end else begin
                    // Output next bits
                    output_buffer <= output_buffer << BITS_PER_CLK;
                    output_bits_left <= output_bits_left - BITS_PER_CLK;							
                end					                
            end

            state_read_address: begin                
                // Last bits of address?
                if(output_bits_left == BITS_PER_CLK) begin
                    current_state <= state_read_dummy_bytes;
                    
                    // Enable input GPIO
                    sram_sio_oe <= 1'b0;
                    // DUMMY BYTES:
                    input_nibbles_left <= 2;

                    
                end else begin
                    // Output next bits
                    output_buffer <= output_buffer << BITS_PER_CLK;
                    output_bits_left <= output_bits_left - BITS_PER_CLK;							
                end		            
            end

            // state_read_dummy_bytes: begin

            //     if(input_nibbles_left == 1) begin                    
            //         current_state = state_read_line;
            //         input_buffer <= {sram_sio3_i, sram_sio2_i, sram_sio1_i, sram_sio0_i};
            //         input_nibbles_left <= INPUT_NIBBLES_PER_LINE;    
            //     end else begin
            //         input_nibbles_left <= input_nibbles_left - 1;
            //     end                
            // end

            
            // state_read_line: begin
            //     if(quarter_freq_clk_rise_edge) begin
            //         input_buffer <= {sram_sio3_i, sram_sio2_i, sram_sio1_i, sram_sio0_i};

            //         // Last bits of data?
            //         if(input_nibbles_left == 1) begin
            //             current_state <= state_idle;
            //             // sram deselected
            //             sram_cs_n <= 1'b1;

            //             // Prepare address for next read
            //             // line_read_address = line_read_address + bytes_per_line (64)
            //             line_read_address <= line_read_address + 'h40;
            //             // Restart addresses after last hask screen line
            //             if(display_vpos==HACK_SCREEN_HEIGHT) begin
            //                 line_read_address <= 0;
            //             end
                        
            //         end else begin
            //             input_nibbles_left <= input_nibbles_left - 1;
            //         end
            //     end
            // end
            
			/* verilator lint_on CASEINCOMPLETE */
        endcase


       end else begin
           case (current_state)
                state_read_dummy_bytes: begin

                    if(input_nibbles_left == 1) begin                    
                        current_state = state_read_line;
                        input_buffer <= {sram_sio3_i, sram_sio2_i, sram_sio1_i, sram_sio0_i};
                        input_nibbles_left <= INPUT_NIBBLES_PER_LINE;    
                    end else begin
                        input_nibbles_left <= input_nibbles_left - 1;
                    end                
                end

                
                state_read_line: begin
                    input_buffer <= {sram_sio3_i, sram_sio2_i, sram_sio1_i, sram_sio0_i};

                    if(quarter_x) begin
                        
                        // Last bits of data?
                        if(input_nibbles_left == 1) begin
                            current_state <= state_idle;
                            // sram deselected
                            sram_cs_n <= 1'b1;

                            // Prepare address for next read
                            // line_read_address = line_read_address + bytes_per_line (64)
                            line_read_address <= line_read_address + 'h40;
                            // Restart addresses after last hask screen line
                            if(display_vpos==HACK_SCREEN_HEIGHT) begin
                                line_read_address <= 0;
                            end
                            
                        end else begin
                            input_nibbles_left <= input_nibbles_left - 1;
                        end
                    end
                end
                
           endcase
       end

    end    
end    






`ifdef FORMAL

    localparam READ_TRIGGER_BEFORE_ACTIVE_CLKS = 24;

    //*
    //Full 640x480 data
    localparam ACTIVE_LINES = 480;
    localparam VA_END  = ACTIVE_LINES;
    localparam HCOUNT_MAX = 800;
    localparam VCOUNT_MAX = 525;
    localparam HA_STA = 160;    
    
    /*/

    // Smaller values for testing
    localparam ACTIVE_LINES = 480;
    localparam VA_END  = ACTIVE_LINES;
    localparam HCOUNT_MAX = 126;
    localparam VCOUNT_MAX = 2;
    localparam HA_STA = 30;
    //*/    




    // register for knowing if we have just started
    reg f_past_valid = 0;
    reg initial_reset_passed = 0;
    reg first_read_done = 0;
    reg [3:0] some_input_data = 'b1010;

    wire sio_o = {sram_sio3_o, sram_sio2_o, sram_sio1_o, sram_sio0_o};

    reg [9:0] h_count;
    reg [9:0] v_count;

    // assign display_hpos = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
    // assign display_vpos = (v_count >= VA_END) ? (VA_END - 1) : (v_count);
    

    initial begin
        assume(reset);        
        assume(line_read_address=='h40);
        assume(display_trigger_read==0);
        assume(current_state==state_set_SQI_mode);
        // assume(h_count == 150);
    end



    always @(posedge clk) begin 

        
        // assume(v_count < VCOUNT_MAX);
        // assume(h_count < HCOUNT_MAX);

        
        if(~((h_count < HA_STA) | (v_count > ACTIVE_LINES - 1))) begin
            assume(display_active);    
        end else begin
            assume(display_active==0);
        end

        if((h_count+READ_TRIGGER_BEFORE_ACTIVE_CLKS == HA_STA) && (v_count <= ACTIVE_LINES - 1)) begin            
        // if(~(( (h_count+10) == 160) | (v_count > 480 - 1))) begin
            assume(display_trigger_read)   ;
        end else begin
            assume(display_trigger_read==0)   ;
        end
        
        


        f_past_valid <= 1;

        if(f_past_valid) begin
        
            assume(reset==0);
            
            // if(~((h_count+ 10 == 160) | (v_count > 480 - 1))) begin
            // end
            // some_input_data <= some_input_data + 1'b1;
            if(display_trigger_read) begin
                some_input_data <= 'b0000;
            end else begin
                if(!$past(quarter_freq_clk) && quarter_freq_clk) begin
                    some_input_data <= some_input_data + 1; //~some_input_data;
                end
            end
            
            assume(sram_sio3_i==some_input_data[3]);
            assume(sram_sio2_i==some_input_data[2]);
            assume(sram_sio1_i==some_input_data[1]);
            assume(sram_sio0_i==some_input_data[0]);

            // assume({sram_sio3_i,sram_sio2_i,sram_sio1_i,sram_sio0_i}==some_input_data);

            

            if($past(h_count)==HCOUNT_MAX) begin
                assume(h_count==0);
                if($past(v_count)==VCOUNT_MAX) begin
                    assume(v_count==0);
                end else begin
                    assume(v_count==$past(v_count+1));
                end
            end else begin
                assume(h_count==$past(h_count+1));
                assume(v_count==$past(v_count));
            end
            
            if(h_count < HA_STA) begin
                assume(display_hpos==0);
            end else begin
                assume(display_hpos== (h_count - HA_STA) );
            end

            if(v_count >= VA_END) begin
                assume(display_vpos == (VA_END - 1) );
            end else begin
                assume( display_vpos == v_count);
            end
    


            
            if(sram_cs_n==1'b0 && sram_sck==1'b1) begin
	 			ASSERT_SRAM_INPUT_SET_BEFORE_CLOCK: 
	 				assert($past(sio_o)==sio_o); 			
	 		end


            // COVER_START_READ: cover(start_read);

            COVER_START_READ_LINE: cover(current_state==state_start_read_line);

            // COVER_FINISH_READING_LINE: cover($past(current_state==state_read_line) && current_state==state_idle);

            //cover()
        end

        if($fell(reset)) begin
			initial_reset_passed <= 1;
		end


		if(initial_reset_passed) begin
        end

    end

`endif


endmodule