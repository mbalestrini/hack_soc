`default_nettype none
`timescale 1ns/10ps


module video_generator_640x480 (
        input wire i_clk,           // base clock
        input wire i_pix_stb,       // pixel clock strobe
        input wire i_rst,           // reset: restarts frame
        
        output wire o_hs,           // horizontal sync
        output wire o_vs,           // vertical sync
        
        output wire o_blanking,     // high during blanking interval
        output wire o_active,       // high during active pixel drawing
        output wire o_screenend,    // high for one tick at the end of screen
        output wire o_animate,      // high for one tick at end of active drawing
        output wire [9:0] o_x,      // current pixel x position
        output wire [9:0] o_y       // current pixel y position
    );
    
    localparam H_PIXELS = 640;
    localparam V_LINES = 480;
    
    // Numeros para 640x460@60, video clock 25.175 MHz
    // http://tinyvga.com/vga-timing/640x480@60Hz
    // VGA timings https://projectf.io/posts/video-timings-vga-720p-1080p/#vga-640x480-60-hz
    
    // Pixel Clock       25.175 MHz
    // TMDS Clock       251.750 MHz
    // Pixel Time          39.7 ns ±0.5%
    // Horizontal Freq.  31.469 kHz
    // Line Time           31.8 μs
    // Vertical Freq.    59.940 Hz
    // Frame Time          16.7 ms



    // 640x480 @ 75
    localparam H_BACK_PORCH_CLOCKS = 120;
    localparam H_SYNC_CLOCKS = 64;
    localparam H_FRONT_PORCH_CLOCKS = 16;
    localparam V_BACK_PORCH_LINES = 16;//1;
    localparam V_SYNC_LINES = 3;
    localparam V_FRONT_PORCH = 1;//26;    
    

    // 640x480 @ 60
    // localparam H_BACK_PORCH_CLOCKS = 48;
    // localparam H_SYNC_CLOCKS = 96;
    // localparam H_FRONT_PORCH_CLOCKS = 16;
    // localparam V_BACK_PORCH_LINES = 33;//1;
    // localparam V_SYNC_LINES = 2;
    // localparam V_FRONT_PORCH = 10;//26;    
    
    localparam HS_STA = H_FRONT_PORCH_CLOCKS;              // horizontal sync start
    localparam HS_END = H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS;         // horizontal sync end
    localparam HA_STA = H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS + H_BACK_PORCH_CLOCKS;    // horizontal active pixel start
    localparam VS_STA = V_LINES + V_FRONT_PORCH;        // vertical sync start
    localparam VS_END = V_LINES + V_FRONT_PORCH + V_SYNC_LINES;    // vertical sync end
    localparam VA_END = V_LINES;             // vertical active pixel end
    localparam LINE   = H_PIXELS + H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS + H_BACK_PORCH_CLOCKS;             // complete line (pixels)
    localparam SCREEN = V_LINES + V_FRONT_PORCH + V_SYNC_LINES + V_BACK_PORCH_LINES;             // complete screen (lines)
    
    // localparam HS_STA = 16;              // horizontal sync start
    // localparam HS_END = 16 + 96;         // horizontal sync end
    // localparam HA_STA = 16 + 96 + 48;    // horizontal active pixel start
    // localparam VS_STA = 480 + 11;        // vertical sync start
    // localparam VS_END = 480 + 11 + 2;    // vertical sync end
    // localparam VA_END = 480;             // vertical active pixel end
    // localparam LINE   = 800;             // complete line (pixels)
    // localparam SCREEN = 524;             // complete screen (lines)

    reg [9:0] h_count;  // line position
    reg [9:0] v_count;  // screen position
    
    // generate sync signals (active low for 640x480)
    assign o_hs = ~((h_count >= HS_STA) & (h_count < HS_END));
    assign o_vs = ~((v_count >= VS_STA) & (v_count < VS_END));
    
    // keep x and y bound within the active pixels
    assign o_x = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
    assign o_y = (v_count >= VA_END) ? (VA_END - 1) : (v_count);
    
    // blanking: high within the blanking period
    assign o_blanking = ((h_count < HA_STA) | (v_count > VA_END - 1));
    
    // active: high during active pixel drawing
    assign o_active = ~((h_count < HA_STA) | (v_count > VA_END - 1)); 
    
    // screenend: high for one tick at the end of the screen
    assign o_screenend = ((v_count == SCREEN - 1) & (h_count == LINE));
    
    // animate: high for one tick at the end of the final active pixel line
    assign o_animate = ((v_count == VA_END - 1) & (h_count == LINE));
    
    always @ (posedge i_pix_stb)
    begin
        if (i_rst)  // reset to start of frame
        begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            // if (i_pix_stb)  // once per pixel
            begin
                if (h_count == LINE)  // end of line
                begin
                    h_count <= 0;
                    v_count <= v_count + 1;
                end
                else 
                    h_count <= h_count + 1;
        
                if (v_count == SCREEN)  // end of screen
                    v_count <= 0;
            end    
        end
        
    end
endmodule
