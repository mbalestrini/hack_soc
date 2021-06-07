parameter WORD_WIDTH = 16; 
parameter RAM_WORDS = 32768; // 2^A_WIDTH
parameter RAM_ADDRESS_WIDTH = $clog2(RAM_WORDS);
parameter ROM_WORDS = 32768; // 2^A_WIDTH
parameter ROM_ADDRESS_WIDTH = $clog2(ROM_WORDS);
parameter INSTRUCTION_WIDTH = WORD_WIDTH;

parameter VRAM_WORDS = 8192;
parameter VRAM_ADDRESS_WIDTH = $clog2(VRAM_WORDS);

parameter HACK_ADDRESS_VRAM_START = 16384;
parameter HACK_ADDRESS_VRAM_END = 24575;
parameter HACK_ADDRESS_KEYBOARD = 'h6000;
parameter HACK_ADDRESS_GPIO = 'h6001;

parameter SRAM_ADDRESS_WIDTH = 24;

parameter HACK_GPIO_WIDTH = 16;

parameter HACK_SCREEN_WIDTH = 512;
parameter HACK_SCREEN_HEIGHT = 256;
parameter HACK_SCREEN_H_OFFSET = 64;//64;
parameter HACK_SCREEN_V_OFFSET = 112;

