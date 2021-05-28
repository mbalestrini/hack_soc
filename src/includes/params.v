parameter WORD_WIDTH = 16; 
parameter RAM_WORDS = 32768; // 2^A_WIDTH
parameter RAM_ADDRESS_WIDTH = $clog2(RAM_WORDS);
parameter ROM_WORDS = 32768; // 2^A_WIDTH
parameter ROM_ADDRESS_WIDTH = $clog2(ROM_WORDS);
parameter INSTRUCTION_WIDTH = WORD_WIDTH;
