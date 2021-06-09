#define H_PIXELS 640
#define V_LINES 480

#define H_BACK_PORCH_CLOCKS  48
#define H_SYNC_CLOCKS  96
#define H_FRONT_PORCH_CLOCKS  16
#define V_BACK_PORCH_LINES  33//1
#define V_SYNC_LINES  2
#define V_FRONT_PORCH  10//26;   


#define HS_STA  (H_FRONT_PORCH_CLOCKS)              // horizontal sync start
#define HS_END  (H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS)         // horizontal sync end
#define HA_STA  (H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS + H_BACK_PORCH_CLOCKS)    // horizontal active pixel start
#define VS_STA  (V_LINES + V_FRONT_PORCH)        // vertical sync start
#define VS_END  (V_LINES + V_FRONT_PORCH + V_SYNC_LINES)    // vertical sync end
#define VA_END  (V_LINES)             // vertical active pixel end
#define LINE    (H_PIXELS + H_FRONT_PORCH_CLOCKS + H_SYNC_CLOCKS + H_BACK_PORCH_CLOCKS)             // complete line (pixels)
#define SCREEN  (V_LINES + V_FRONT_PORCH + V_SYNC_LINES + V_BACK_PORCH_LINES)             // complete screen (lines)




class Screen {
    public:    
	bool in_vsync;
	bool in_hsync;
	int clocks;
};
