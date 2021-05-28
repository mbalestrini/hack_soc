// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtest_B__Syms.h"


//======================

void Vtest_B::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&Vtest_B::traceInit, &Vtest_B::traceFull, &Vtest_B::traceChg, this);
}
void Vtest_B::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vtest_B* t=(Vtest_B*)userthis;
    Vtest_B__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vtest_B::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtest_B* t=(Vtest_B*)userthis;
    Vtest_B__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void Vtest_B::traceInitThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vtest_B::traceFullThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtest_B::traceInitThis__1(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+88,"clk",-1);
	vcdp->declBit  (c+89,"reset",-1);
	vcdp->declBit  (c+90,"ram_sck",-1);
	vcdp->declBit  (c+91,"ram_cs_n",-1);
	vcdp->declBit  (c+92,"ram_sio0",-1);
	vcdp->declBit  (c+93,"ram_sio1",-1);
	vcdp->declBit  (c+94,"ram_sio2",-1);
	vcdp->declBit  (c+95,"ram_sio3",-1);
	vcdp->declBit  (c+96,"rom_sck",-1);
	vcdp->declBit  (c+97,"rom_cs_n",-1);
	vcdp->declBit  (c+98,"rom_sio0",-1);
	vcdp->declBit  (c+99,"rom_sio1",-1);
	vcdp->declBit  (c+100,"rom_sio2",-1);
	vcdp->declBit  (c+101,"rom_sio3",-1);
	vcdp->declBit  (c+88,"test_B clk",-1);
	vcdp->declBit  (c+89,"test_B reset",-1);
	vcdp->declBit  (c+90,"test_B ram_sck",-1);
	vcdp->declBit  (c+91,"test_B ram_cs_n",-1);
	vcdp->declBit  (c+92,"test_B ram_sio0",-1);
	vcdp->declBit  (c+93,"test_B ram_sio1",-1);
	vcdp->declBit  (c+94,"test_B ram_sio2",-1);
	vcdp->declBit  (c+95,"test_B ram_sio3",-1);
	vcdp->declBit  (c+96,"test_B rom_sck",-1);
	vcdp->declBit  (c+97,"test_B rom_cs_n",-1);
	vcdp->declBit  (c+98,"test_B rom_sio0",-1);
	vcdp->declBit  (c+99,"test_B rom_sio1",-1);
	vcdp->declBit  (c+100,"test_B rom_sio2",-1);
	vcdp->declBit  (c+101,"test_B rom_sio3",-1);
	vcdp->declBit  (c+20,"test_B ram_sio_oe",-1);
	vcdp->declBit  (c+92,"test_B ram_sio0_i",-1);
	vcdp->declBit  (c+93,"test_B ram_sio1_i",-1);
	vcdp->declBit  (c+94,"test_B ram_sio2_i",-1);
	vcdp->declBit  (c+95,"test_B ram_sio3_i",-1);
	vcdp->declBit  (c+21,"test_B ram_sio0_o",-1);
	vcdp->declBit  (c+22,"test_B ram_sio1_o",-1);
	vcdp->declBit  (c+23,"test_B ram_sio2_o",-1);
	vcdp->declBit  (c+24,"test_B ram_sio3_o",-1);
	vcdp->declBit  (c+25,"test_B rom_sio_oe",-1);
	vcdp->declBit  (c+98,"test_B rom_sio0_i",-1);
	vcdp->declBit  (c+99,"test_B rom_sio1_i",-1);
	vcdp->declBit  (c+100,"test_B rom_sio2_i",-1);
	vcdp->declBit  (c+101,"test_B rom_sio3_i",-1);
	vcdp->declBit  (c+26,"test_B rom_sio0_o",-1);
	vcdp->declBit  (c+27,"test_B rom_sio1_o",-1);
	vcdp->declBit  (c+28,"test_B rom_sio2_o",-1);
	vcdp->declBit  (c+29,"test_B rom_sio3_o",-1);
	vcdp->declBus  (c+58,"test_B debug_pc",-1,14,0);
	vcdp->declBus  (c+59,"test_B debug_addressM",-1,14,0);
	vcdp->declBus  (c+64,"test_B debug_instruction",-1,15,0);
	vcdp->declBus  (c+60,"test_B debug_gpio",-1,15,0);
	vcdp->declBit  (c+88,"test_B soc clk",-1);
	vcdp->declBit  (c+89,"test_B soc reset",-1);
	vcdp->declBit  (c+91,"test_B soc ram_cs_n",-1);
	vcdp->declBit  (c+90,"test_B soc ram_sck",-1);
	vcdp->declBit  (c+20,"test_B soc ram_sio_oe",-1);
	vcdp->declBit  (c+92,"test_B soc ram_sio0_i",-1);
	vcdp->declBit  (c+93,"test_B soc ram_sio1_i",-1);
	vcdp->declBit  (c+94,"test_B soc ram_sio2_i",-1);
	vcdp->declBit  (c+95,"test_B soc ram_sio3_i",-1);
	vcdp->declBit  (c+21,"test_B soc ram_sio0_o",-1);
	vcdp->declBit  (c+22,"test_B soc ram_sio1_o",-1);
	vcdp->declBit  (c+23,"test_B soc ram_sio2_o",-1);
	vcdp->declBit  (c+24,"test_B soc ram_sio3_o",-1);
	vcdp->declBit  (c+97,"test_B soc rom_cs_n",-1);
	vcdp->declBit  (c+96,"test_B soc rom_sck",-1);
	vcdp->declBit  (c+25,"test_B soc rom_sio_oe",-1);
	vcdp->declBit  (c+98,"test_B soc rom_sio0_i",-1);
	vcdp->declBit  (c+99,"test_B soc rom_sio1_i",-1);
	vcdp->declBit  (c+100,"test_B soc rom_sio2_i",-1);
	vcdp->declBit  (c+101,"test_B soc rom_sio3_i",-1);
	vcdp->declBit  (c+26,"test_B soc rom_sio0_o",-1);
	vcdp->declBit  (c+27,"test_B soc rom_sio1_o",-1);
	vcdp->declBit  (c+28,"test_B soc rom_sio2_o",-1);
	vcdp->declBit  (c+29,"test_B soc rom_sio3_o",-1);
	vcdp->declBus  (c+58,"test_B soc debug_pc",-1,14,0);
	vcdp->declBus  (c+59,"test_B soc debug_addressM",-1,14,0);
	vcdp->declBus  (c+64,"test_B soc debug_instruction",-1,15,0);
	vcdp->declBus  (c+60,"test_B soc debug_gpio",-1,15,0);
	vcdp->declBus  (c+104,"test_B soc WORD_WIDTH",-1,31,0);
	vcdp->declBus  (c+105,"test_B soc RAM_WORDS",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc RAM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+105,"test_B soc ROM_WORDS",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc ROM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+104,"test_B soc INSTRUCTION_WIDTH",-1,31,0);
	vcdp->declBus  (c+30,"test_B soc hack_wait_clocks",-1,1,0);
	vcdp->declBit  (c+31,"test_B soc hack_clk_strobe",-1);
	vcdp->declBit  (c+32,"test_B soc hack_clk",-1);
	vcdp->declBit  (c+1,"test_B soc hack_reset",-1);
	vcdp->declBus  (c+59,"test_B soc hack_addressM",-1,14,0);
	vcdp->declBit  (c+6,"test_B soc hack_writeM",-1);
	vcdp->declBus  (c+33,"test_B soc hack_inM",-1,15,0);
	vcdp->declBus  (c+9,"test_B soc hack_outM",-1,15,0);
	vcdp->declBus  (c+64,"test_B soc hack_instruction",-1,15,0);
	vcdp->declBus  (c+58,"test_B soc hack_pc",-1,14,0);
	vcdp->declBit  (c+2,"test_B soc ram_request",-1);
	vcdp->declBit  (c+34,"test_B soc ram_busy",-1);
	vcdp->declBit  (c+35,"test_B soc ram_initialized",-1);
	vcdp->declBit  (c+3,"test_B soc rom_request",-1);
	vcdp->declBit  (c+36,"test_B soc rom_busy",-1);
	vcdp->declBit  (c+37,"test_B soc rom_initialized",-1);
	vcdp->declBus  (c+107,"test_B soc rom_data_out",-1,15,0);
	vcdp->declBit  (c+88,"test_B soc hack_clock_0 clk",-1);
	vcdp->declBit  (c+89,"test_B soc hack_clock_0 reset",-1);
	vcdp->declBit  (c+32,"test_B soc hack_clock_0 hack_clk",-1);
	vcdp->declBit  (c+31,"test_B soc hack_clock_0 strobe",-1);
	vcdp->declBus  (c+38,"test_B soc hack_clock_0 counter",-1,5,0);
	vcdp->declBit  (c+32,"test_B soc cpu clk",-1);
	vcdp->declBus  (c+33,"test_B soc cpu inM",-1,15,0);
	vcdp->declBus  (c+64,"test_B soc cpu instruction",-1,15,0);
	vcdp->declBit  (c+1,"test_B soc cpu reset",-1);
	vcdp->declBus  (c+9,"test_B soc cpu outM",-1,15,0);
	vcdp->declBit  (c+6,"test_B soc cpu writeM",-1);
	vcdp->declBus  (c+59,"test_B soc cpu addressM",-1,14,0);
	vcdp->declBus  (c+58,"test_B soc cpu pc",-1,14,0);
	vcdp->declBus  (c+104,"test_B soc cpu WORD_WIDTH",-1,31,0);
	vcdp->declBus  (c+105,"test_B soc cpu RAM_WORDS",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc cpu RAM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+105,"test_B soc cpu ROM_WORDS",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc cpu ROM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+104,"test_B soc cpu INSTRUCTION_WIDTH",-1,31,0);
	vcdp->declBus  (c+10,"test_B soc cpu areg_in",-1,15,0);
	vcdp->declBit  (c+7,"test_B soc cpu areg_load",-1);
	vcdp->declBus  (c+61,"test_B soc cpu areg_out",-1,15,0);
	vcdp->declBus  (c+9,"test_B soc cpu dreg_in",-1,15,0);
	vcdp->declBit  (c+65,"test_B soc cpu dreg_load",-1);
	vcdp->declBus  (c+62,"test_B soc cpu dreg_out",-1,15,0);
	vcdp->declBit  (c+11,"test_B soc cpu pc_load",-1);
	vcdp->declBit  (c+12,"test_B soc cpu pc_inc",-1);
	vcdp->declBus  (c+5,"test_B soc cpu pc_in",-1,15,0);
	vcdp->declBus  (c+63,"test_B soc cpu pc_output",-1,15,0);
	vcdp->declBus  (c+62,"test_B soc cpu alu_x",-1,15,0);
	vcdp->declBus  (c+57,"test_B soc cpu alu_y",-1,15,0);
	vcdp->declBit  (c+66,"test_B soc cpu alu_zx",-1);
	vcdp->declBit  (c+67,"test_B soc cpu alu_nx",-1);
	vcdp->declBit  (c+68,"test_B soc cpu alu_zy",-1);
	vcdp->declBit  (c+69,"test_B soc cpu alu_ny",-1);
	vcdp->declBit  (c+70,"test_B soc cpu alu_f",-1);
	vcdp->declBit  (c+71,"test_B soc cpu alu_no",-1);
	vcdp->declBus  (c+9,"test_B soc cpu alu_out",-1,15,0);
	vcdp->declBit  (c+13,"test_B soc cpu alu_zr",-1);
	vcdp->declBit  (c+14,"test_B soc cpu alu_ng",-1);
	vcdp->declBit  (c+72,"test_B soc cpu instruction_type_A",-1);
	vcdp->declBus  (c+73,"test_B soc cpu instruction_A_address",-1,14,0);
	vcdp->declBit  (c+74,"test_B soc cpu instruction_type_C",-1);
	vcdp->declBit  (c+75,"test_B soc cpu instruction_C_dest_a",-1);
	vcdp->declBit  (c+76,"test_B soc cpu instruction_C_dest_d",-1);
	vcdp->declBit  (c+77,"test_B soc cpu instruction_C_dest_m",-1);
	vcdp->declBit  (c+78,"test_B soc cpu instruction_C_source_m",-1);
	vcdp->declBit  (c+79,"test_B soc cpu instruction_C_noJump",-1);
	vcdp->declBit  (c+80,"test_B soc cpu instruction_C_jgt",-1);
	vcdp->declBit  (c+81,"test_B soc cpu instruction_C_jeq",-1);
	vcdp->declBit  (c+82,"test_B soc cpu instruction_C_jge",-1);
	vcdp->declBit  (c+83,"test_B soc cpu instruction_C_jlt",-1);
	vcdp->declBit  (c+84,"test_B soc cpu instruction_C_jne",-1);
	vcdp->declBit  (c+85,"test_B soc cpu instruction_C_jle",-1);
	vcdp->declBit  (c+86,"test_B soc cpu instruction_C_jmp",-1);
	vcdp->declBit  (c+8,"test_B soc cpu jump_condition_met",-1);
	vcdp->declBit  (c+32,"test_B soc cpu AReg clk",-1);
	vcdp->declBus  (c+10,"test_B soc cpu AReg in",-1,15,0);
	vcdp->declBit  (c+7,"test_B soc cpu AReg load",-1);
	vcdp->declBus  (c+61,"test_B soc cpu AReg out",-1,15,0);
	vcdp->declBus  (c+104,"test_B soc cpu AReg D_WIDTH",-1,31,0);
	vcdp->declBus  (c+61,"test_B soc cpu AReg data",-1,15,0);
	vcdp->declBit  (c+32,"test_B soc cpu DReg clk",-1);
	vcdp->declBus  (c+9,"test_B soc cpu DReg in",-1,15,0);
	vcdp->declBit  (c+65,"test_B soc cpu DReg load",-1);
	vcdp->declBus  (c+62,"test_B soc cpu DReg out",-1,15,0);
	vcdp->declBus  (c+104,"test_B soc cpu DReg D_WIDTH",-1,31,0);
	vcdp->declBus  (c+62,"test_B soc cpu DReg data",-1,15,0);
	vcdp->declBit  (c+32,"test_B soc cpu PC clk",-1);
	vcdp->declBit  (c+1,"test_B soc cpu PC reset",-1);
	vcdp->declBus  (c+5,"test_B soc cpu PC in",-1,15,0);
	vcdp->declBit  (c+11,"test_B soc cpu PC load",-1);
	vcdp->declBit  (c+12,"test_B soc cpu PC inc",-1);
	vcdp->declBus  (c+63,"test_B soc cpu PC out",-1,15,0);
	vcdp->declBus  (c+104,"test_B soc cpu PC D_WIDTH",-1,31,0);
	vcdp->declBus  (c+4,"test_B soc cpu PC pc_in",-1,15,0);
	vcdp->declBus  (c+63,"test_B soc cpu PC pc_out",-1,15,0);
	vcdp->declBit  (c+108,"test_B soc cpu PC pc_load",-1);
	vcdp->declBit  (c+32,"test_B soc cpu PC REG clk",-1);
	vcdp->declBus  (c+4,"test_B soc cpu PC REG in",-1,15,0);
	vcdp->declBit  (c+108,"test_B soc cpu PC REG load",-1);
	vcdp->declBus  (c+63,"test_B soc cpu PC REG out",-1,15,0);
	vcdp->declBus  (c+104,"test_B soc cpu PC REG D_WIDTH",-1,31,0);
	vcdp->declBus  (c+63,"test_B soc cpu PC REG data",-1,15,0);
	vcdp->declBus  (c+62,"test_B soc cpu ALU x",-1,15,0);
	vcdp->declBus  (c+57,"test_B soc cpu ALU y",-1,15,0);
	vcdp->declBit  (c+66,"test_B soc cpu ALU zx",-1);
	vcdp->declBit  (c+67,"test_B soc cpu ALU nx",-1);
	vcdp->declBit  (c+68,"test_B soc cpu ALU zy",-1);
	vcdp->declBit  (c+69,"test_B soc cpu ALU ny",-1);
	vcdp->declBit  (c+70,"test_B soc cpu ALU f",-1);
	vcdp->declBit  (c+71,"test_B soc cpu ALU no",-1);
	vcdp->declBus  (c+9,"test_B soc cpu ALU out",-1,15,0);
	vcdp->declBit  (c+13,"test_B soc cpu ALU zr",-1);
	vcdp->declBit  (c+14,"test_B soc cpu ALU ng",-1);
	vcdp->declBus  (c+104,"test_B soc cpu ALU D_WIDTH",-1,31,0);
	vcdp->declBus  (c+15,"test_B soc cpu ALU vzx",-1,15,0);
	vcdp->declBus  (c+16,"test_B soc cpu ALU vnx",-1,15,0);
	vcdp->declBus  (c+17,"test_B soc cpu ALU vzy",-1,15,0);
	vcdp->declBus  (c+18,"test_B soc cpu ALU vny",-1,15,0);
	vcdp->declBus  (c+19,"test_B soc cpu ALU vf",-1,15,0);
	vcdp->declBus  (c+108,"test_B soc cpu DMuxJMP in",-1,0,0);
	vcdp->declBus  (c+87,"test_B soc cpu DMuxJMP sel",-1,2,0);
	vcdp->declBus  (c+79,"test_B soc cpu DMuxJMP a",-1,0,0);
	vcdp->declBus  (c+80,"test_B soc cpu DMuxJMP b",-1,0,0);
	vcdp->declBus  (c+81,"test_B soc cpu DMuxJMP c",-1,0,0);
	vcdp->declBus  (c+82,"test_B soc cpu DMuxJMP d",-1,0,0);
	vcdp->declBus  (c+83,"test_B soc cpu DMuxJMP e",-1,0,0);
	vcdp->declBus  (c+84,"test_B soc cpu DMuxJMP f",-1,0,0);
	vcdp->declBus  (c+85,"test_B soc cpu DMuxJMP g",-1,0,0);
	vcdp->declBus  (c+86,"test_B soc cpu DMuxJMP h",-1,0,0);
	vcdp->declBus  (c+109,"test_B soc cpu DMuxJMP D_WIDTH",-1,31,0);
	vcdp->declBus  (c+104,"test_B soc ram_encoder_0 WORD_WIDTH",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc ram_encoder_0 ADDRESS_WIDTH",-1,31,0);
	vcdp->declBit  (c+88,"test_B soc ram_encoder_0 clk",-1);
	vcdp->declBit  (c+89,"test_B soc ram_encoder_0 reset",-1);
	vcdp->declBit  (c+2,"test_B soc ram_encoder_0 request",-1);
	vcdp->declBit  (c+34,"test_B soc ram_encoder_0 busy",-1);
	vcdp->declBit  (c+35,"test_B soc ram_encoder_0 initialized",-1);
	vcdp->declBus  (c+59,"test_B soc ram_encoder_0 address",-1,14,0);
	vcdp->declBit  (c+6,"test_B soc ram_encoder_0 write_enable",-1);
	vcdp->declBus  (c+33,"test_B soc ram_encoder_0 data_in",-1,15,0);
	vcdp->declBus  (c+9,"test_B soc ram_encoder_0 data_out",-1,15,0);
	vcdp->declBit  (c+91,"test_B soc ram_encoder_0 sram_cs_n",-1);
	vcdp->declBit  (c+90,"test_B soc ram_encoder_0 sram_sck",-1);
	vcdp->declBit  (c+20,"test_B soc ram_encoder_0 sram_sio_oe",-1);
	vcdp->declBit  (c+92,"test_B soc ram_encoder_0 sram_sio0_i",-1);
	vcdp->declBit  (c+93,"test_B soc ram_encoder_0 sram_sio1_i",-1);
	vcdp->declBit  (c+94,"test_B soc ram_encoder_0 sram_sio2_i",-1);
	vcdp->declBit  (c+95,"test_B soc ram_encoder_0 sram_sio3_i",-1);
	vcdp->declBit  (c+21,"test_B soc ram_encoder_0 sram_sio0_o",-1);
	vcdp->declBit  (c+22,"test_B soc ram_encoder_0 sram_sio1_o",-1);
	vcdp->declBit  (c+23,"test_B soc ram_encoder_0 sram_sio2_o",-1);
	vcdp->declBit  (c+24,"test_B soc ram_encoder_0 sram_sio3_o",-1);
	vcdp->declBus  (c+110,"test_B soc ram_encoder_0 SRAM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+111,"test_B soc ram_encoder_0 SRAM_INSTRUCTION_WIDTH",-1,31,0);
	vcdp->declBus  (c+112,"test_B soc ram_encoder_0 OUTPUT_BUFFER_WIDTH",-1,31,0);
	vcdp->declBus  (c+104,"test_B soc ram_encoder_0 INPUT_BUFFER_WIDTH",-1,31,0);
	vcdp->declBus  (c+111,"test_B soc ram_encoder_0 INPUT_DUMMY_WIDTH",-1,31,0);
	vcdp->declBus  (c+113,"test_B soc ram_encoder_0 BITS_PER_CLK",-1,31,0);
	vcdp->declBus  (c+114,"test_B soc ram_encoder_0 state_idle",-1,2,0);
	vcdp->declBus  (c+115,"test_B soc ram_encoder_0 state_start",-1,2,0);
	vcdp->declBus  (c+116,"test_B soc ram_encoder_0 state_instruction",-1,2,0);
	vcdp->declBus  (c+117,"test_B soc ram_encoder_0 state_address",-1,2,0);
	vcdp->declBus  (c+118,"test_B soc ram_encoder_0 state_read",-1,2,0);
	vcdp->declBus  (c+119,"test_B soc ram_encoder_0 state_write",-1,2,0);
	vcdp->declBus  (c+120,"test_B soc ram_encoder_0 state_reset",-1,2,0);
	vcdp->declBus  (c+121,"test_B soc ram_encoder_0 state_set_SQI_mode",-1,2,0);
	vcdp->declBus  (c+39,"test_B soc ram_encoder_0 current_state",-1,2,0);
	vcdp->declBus  (c+40,"test_B soc ram_encoder_0 initializing_step",-1,4,0);
	vcdp->declBus  (c+41,"test_B soc ram_encoder_0 request_address",-1,14,0);
	vcdp->declBus  (c+42,"test_B soc ram_encoder_0 request_data_out",-1,15,0);
	vcdp->declBit  (c+43,"test_B soc ram_encoder_0 request_write",-1);
	vcdp->declBus  (c+44,"test_B soc ram_encoder_0 output_buffer",-1,23,0);
	vcdp->declBus  (c+45,"test_B soc ram_encoder_0 output_bits_left",-1,4,0);
	vcdp->declBus  (c+33,"test_B soc ram_encoder_0 input_buffer",-1,15,0);
	vcdp->declBus  (c+46,"test_B soc ram_encoder_0 input_bits_left",-1,4,0);
	vcdp->declBus  (c+102,"test_B soc ram_encoder_0 sio_i",-1,3,0);
	vcdp->declBus  (c+47,"test_B soc ram_encoder_0 sio_o",-1,3,0);
	vcdp->declBus  (c+104,"test_B soc rom_encoder_0 WORD_WIDTH",-1,31,0);
	vcdp->declBus  (c+106,"test_B soc rom_encoder_0 ADDRESS_WIDTH",-1,31,0);
	vcdp->declBit  (c+88,"test_B soc rom_encoder_0 clk",-1);
	vcdp->declBit  (c+89,"test_B soc rom_encoder_0 reset",-1);
	vcdp->declBit  (c+3,"test_B soc rom_encoder_0 request",-1);
	vcdp->declBit  (c+36,"test_B soc rom_encoder_0 busy",-1);
	vcdp->declBit  (c+37,"test_B soc rom_encoder_0 initialized",-1);
	vcdp->declBus  (c+58,"test_B soc rom_encoder_0 address",-1,14,0);
	vcdp->declBit  (c+122,"test_B soc rom_encoder_0 write_enable",-1);
	vcdp->declBus  (c+64,"test_B soc rom_encoder_0 data_in",-1,15,0);
	vcdp->declBus  (c+107,"test_B soc rom_encoder_0 data_out",-1,15,0);
	vcdp->declBit  (c+97,"test_B soc rom_encoder_0 sram_cs_n",-1);
	vcdp->declBit  (c+96,"test_B soc rom_encoder_0 sram_sck",-1);
	vcdp->declBit  (c+25,"test_B soc rom_encoder_0 sram_sio_oe",-1);
	vcdp->declBit  (c+98,"test_B soc rom_encoder_0 sram_sio0_i",-1);
	vcdp->declBit  (c+99,"test_B soc rom_encoder_0 sram_sio1_i",-1);
	vcdp->declBit  (c+100,"test_B soc rom_encoder_0 sram_sio2_i",-1);
	vcdp->declBit  (c+101,"test_B soc rom_encoder_0 sram_sio3_i",-1);
	vcdp->declBit  (c+26,"test_B soc rom_encoder_0 sram_sio0_o",-1);
	vcdp->declBit  (c+27,"test_B soc rom_encoder_0 sram_sio1_o",-1);
	vcdp->declBit  (c+28,"test_B soc rom_encoder_0 sram_sio2_o",-1);
	vcdp->declBit  (c+29,"test_B soc rom_encoder_0 sram_sio3_o",-1);
	vcdp->declBus  (c+110,"test_B soc rom_encoder_0 SRAM_ADDRESS_WIDTH",-1,31,0);
	vcdp->declBus  (c+111,"test_B soc rom_encoder_0 SRAM_INSTRUCTION_WIDTH",-1,31,0);
	vcdp->declBus  (c+112,"test_B soc rom_encoder_0 OUTPUT_BUFFER_WIDTH",-1,31,0);
	vcdp->declBus  (c+104,"test_B soc rom_encoder_0 INPUT_BUFFER_WIDTH",-1,31,0);
	vcdp->declBus  (c+111,"test_B soc rom_encoder_0 INPUT_DUMMY_WIDTH",-1,31,0);
	vcdp->declBus  (c+113,"test_B soc rom_encoder_0 BITS_PER_CLK",-1,31,0);
	vcdp->declBus  (c+114,"test_B soc rom_encoder_0 state_idle",-1,2,0);
	vcdp->declBus  (c+115,"test_B soc rom_encoder_0 state_start",-1,2,0);
	vcdp->declBus  (c+116,"test_B soc rom_encoder_0 state_instruction",-1,2,0);
	vcdp->declBus  (c+117,"test_B soc rom_encoder_0 state_address",-1,2,0);
	vcdp->declBus  (c+118,"test_B soc rom_encoder_0 state_read",-1,2,0);
	vcdp->declBus  (c+119,"test_B soc rom_encoder_0 state_write",-1,2,0);
	vcdp->declBus  (c+120,"test_B soc rom_encoder_0 state_reset",-1,2,0);
	vcdp->declBus  (c+121,"test_B soc rom_encoder_0 state_set_SQI_mode",-1,2,0);
	vcdp->declBus  (c+48,"test_B soc rom_encoder_0 current_state",-1,2,0);
	vcdp->declBus  (c+49,"test_B soc rom_encoder_0 initializing_step",-1,4,0);
	vcdp->declBus  (c+50,"test_B soc rom_encoder_0 request_address",-1,14,0);
	vcdp->declBus  (c+51,"test_B soc rom_encoder_0 request_data_out",-1,15,0);
	vcdp->declBit  (c+52,"test_B soc rom_encoder_0 request_write",-1);
	vcdp->declBus  (c+53,"test_B soc rom_encoder_0 output_buffer",-1,23,0);
	vcdp->declBus  (c+54,"test_B soc rom_encoder_0 output_bits_left",-1,4,0);
	vcdp->declBus  (c+64,"test_B soc rom_encoder_0 input_buffer",-1,15,0);
	vcdp->declBus  (c+55,"test_B soc rom_encoder_0 input_bits_left",-1,4,0);
	vcdp->declBus  (c+103,"test_B soc rom_encoder_0 sio_i",-1,3,0);
	vcdp->declBus  (c+56,"test_B soc rom_encoder_0 sio_o",-1,3,0);
    }
}

void Vtest_B::traceFullThis__1(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBit  (c+1,(vlTOPp->test_B__DOT__soc__DOT__hack_reset));
	vcdp->fullBit  (c+2,(vlTOPp->test_B__DOT__soc__DOT__ram_request));
	vcdp->fullBit  (c+3,(vlTOPp->test_B__DOT__soc__DOT__rom_request));
	vcdp->fullBus  (c+4,((0xffffU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__hack_reset)
					  ? 0U : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
						   ? 
						  ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load)
						    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in)
						    : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))
						   : 
						  ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
						    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data)
						    : 
						   ((IData)(1U) 
						    + (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data))))))),16);
	vcdp->fullBus  (c+5,(((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load)
			       ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in)
			       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),16);
	vcdp->fullBit  (c+6,(vlTOPp->test_B__DOT__soc__DOT__hack_writeM));
	vcdp->fullBit  (c+7,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load));
	vcdp->fullBit  (c+8,((1U & (((((((((1U == (7U 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					    ? 1U : 0U) 
					  & (~ ((~ (IData)(
							   (0U 
							    != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
						| ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
						   >> 0xfU)))) 
					 | (((2U == 
					      (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					      ? 1U : 0U) 
					    & (~ (IData)(
							 (0U 
							  != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))))) 
					| (((3U == 
					     (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					     ? 1U : 0U) 
					   & ((~ (IData)(
							 (0U 
							  != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
					      | (~ 
						 ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
						  >> 0xfU))))) 
				       | (((4U == (7U 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					    ? 1U : 0U) 
					  & ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					     >> 0xfU))) 
				      | (((5U == (7U 
						  & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					   ? 1U : 0U) 
					 & (0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
				     | (((6U == (7U 
						 & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					  ? 1U : 0U) 
					& ((~ (IData)(
						      (0U 
						       != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
					   | ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					      >> 0xfU)))) 
				    | ((7U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				        ? 1U : 0U)))));
	vcdp->fullBus  (c+9,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out),16);
	vcdp->fullBus  (c+10,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in),16);
	vcdp->fullBit  (c+11,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load));
	vcdp->fullBit  (c+12,((1U & (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)))));
	vcdp->fullBit  (c+13,((1U & (~ (IData)((0U 
						!= (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))))));
	vcdp->fullBit  (c+14,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
				     >> 0xfU))));
	vcdp->fullBus  (c+15,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx),16);
	vcdp->fullBus  (c+16,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx),16);
	vcdp->fullBus  (c+17,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy),16);
	vcdp->fullBus  (c+18,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny),16);
	vcdp->fullBus  (c+19,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf),16);
	vcdp->fullBit  (c+20,(vlTOPp->test_B__DOT__ram_sio_oe));
	vcdp->fullBit  (c+21,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				     >> 0x14U))));
	vcdp->fullBit  (c+22,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				     >> 0x15U))));
	vcdp->fullBit  (c+23,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				     >> 0x16U))));
	vcdp->fullBit  (c+24,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				     >> 0x17U))));
	vcdp->fullBit  (c+25,(vlTOPp->test_B__DOT__rom_sio_oe));
	vcdp->fullBit  (c+26,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				     >> 0x14U))));
	vcdp->fullBit  (c+27,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				     >> 0x15U))));
	vcdp->fullBit  (c+28,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				     >> 0x16U))));
	vcdp->fullBit  (c+29,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				     >> 0x17U))));
	vcdp->fullBus  (c+30,(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks),2);
	vcdp->fullBit  (c+31,(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
	vcdp->fullBit  (c+32,(vlTOPp->test_B__DOT__soc__DOT__hack_clk));
	vcdp->fullBus  (c+33,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer),16);
	vcdp->fullBit  (c+34,((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))));
	vcdp->fullBit  (c+35,(vlTOPp->test_B__DOT__soc__DOT__ram_initialized));
	vcdp->fullBit  (c+36,((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))));
	vcdp->fullBit  (c+37,(vlTOPp->test_B__DOT__soc__DOT__rom_initialized));
	vcdp->fullBus  (c+38,(vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter),6);
	vcdp->fullBus  (c+39,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state),3);
	vcdp->fullBus  (c+40,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step),5);
	vcdp->fullBus  (c+41,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address),15);
	vcdp->fullBus  (c+42,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out),16);
	vcdp->fullBit  (c+43,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write));
	vcdp->fullBus  (c+44,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer),24);
	vcdp->fullBus  (c+45,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left),5);
	vcdp->fullBus  (c+46,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left),5);
	vcdp->fullBus  (c+47,((0xfU & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				       >> 0x14U))),4);
	vcdp->fullBus  (c+48,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state),3);
	vcdp->fullBus  (c+49,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step),5);
	vcdp->fullBus  (c+50,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address),15);
	vcdp->fullBus  (c+51,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out),16);
	vcdp->fullBit  (c+52,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write));
	vcdp->fullBus  (c+53,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer),24);
	vcdp->fullBus  (c+54,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left),5);
	vcdp->fullBus  (c+55,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left),5);
	vcdp->fullBus  (c+56,((0xfU & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				       >> 0x14U))),4);
	vcdp->fullBus  (c+57,(((0x1000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
			        ? (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer)
			        : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),16);
	vcdp->fullBus  (c+58,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data))),15);
	vcdp->fullBus  (c+59,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),15);
	vcdp->fullBus  (c+60,(vlTOPp->test_B__DOT__debug_gpio),16);
	vcdp->fullBus  (c+61,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data),16);
	vcdp->fullBus  (c+62,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data),16);
	vcdp->fullBus  (c+63,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data),16);
	vcdp->fullBus  (c+64,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer),16);
	vcdp->fullBit  (c+65,((1U & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				      >> 0xfU) & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
						  >> 4U)))));
	vcdp->fullBit  (c+66,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 0xbU))));
	vcdp->fullBit  (c+67,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 0xaU))));
	vcdp->fullBit  (c+68,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 9U))));
	vcdp->fullBit  (c+69,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 8U))));
	vcdp->fullBit  (c+70,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 7U))));
	vcdp->fullBit  (c+71,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 6U))));
	vcdp->fullBit  (c+72,((1U & (~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
					>> 0xfU)))));
	vcdp->fullBus  (c+73,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))),15);
	vcdp->fullBit  (c+74,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 0xfU))));
	vcdp->fullBit  (c+75,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 5U))));
	vcdp->fullBit  (c+76,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 4U))));
	vcdp->fullBit  (c+77,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 3U))));
	vcdp->fullBit  (c+78,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 0xcU))));
	vcdp->fullBit  (c+79,((1U & ((0U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+80,((1U & ((1U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+81,((1U & ((2U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+82,((1U & ((3U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+83,((1U & ((4U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+84,((1U & ((5U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+85,((1U & ((6U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBit  (c+86,((1U & ((7U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U))));
	vcdp->fullBus  (c+87,((7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))),3);
	vcdp->fullBit  (c+88,(vlTOPp->clk));
	vcdp->fullBit  (c+89,(vlTOPp->reset));
	vcdp->fullBit  (c+90,(vlTOPp->ram_sck));
	vcdp->fullBit  (c+91,(vlTOPp->ram_cs_n));
	vcdp->fullBit  (c+92,(vlTOPp->ram_sio0));
	vcdp->fullBit  (c+93,(vlTOPp->ram_sio1));
	vcdp->fullBit  (c+94,(vlTOPp->ram_sio2));
	vcdp->fullBit  (c+95,(vlTOPp->ram_sio3));
	vcdp->fullBit  (c+96,(vlTOPp->rom_sck));
	vcdp->fullBit  (c+97,(vlTOPp->rom_cs_n));
	vcdp->fullBit  (c+98,(vlTOPp->rom_sio0));
	vcdp->fullBit  (c+99,(vlTOPp->rom_sio1));
	vcdp->fullBit  (c+100,(vlTOPp->rom_sio2));
	vcdp->fullBit  (c+101,(vlTOPp->rom_sio3));
	vcdp->fullBus  (c+102,((((IData)(vlTOPp->ram_sio3) 
				 << 3U) | (((IData)(vlTOPp->ram_sio2) 
					    << 2U) 
					   | (((IData)(vlTOPp->ram_sio1) 
					       << 1U) 
					      | (IData)(vlTOPp->ram_sio0))))),4);
	vcdp->fullBus  (c+103,((((IData)(vlTOPp->rom_sio3) 
				 << 3U) | (((IData)(vlTOPp->rom_sio2) 
					    << 2U) 
					   | (((IData)(vlTOPp->rom_sio1) 
					       << 1U) 
					      | (IData)(vlTOPp->rom_sio0))))),4);
	vcdp->fullBus  (c+104,(0x10U),32);
	vcdp->fullBus  (c+105,(0x8000U),32);
	vcdp->fullBus  (c+106,(0xfU),32);
	vcdp->fullBus  (c+107,(0U),16);
	vcdp->fullBit  (c+108,(1U));
	vcdp->fullBus  (c+109,(1U),32);
	vcdp->fullBus  (c+110,(0x18U),32);
	vcdp->fullBus  (c+111,(8U),32);
	vcdp->fullBus  (c+112,(0x18U),32);
	vcdp->fullBus  (c+113,(4U),32);
	vcdp->fullBus  (c+114,(0U),3);
	vcdp->fullBus  (c+115,(1U),3);
	vcdp->fullBus  (c+116,(2U),3);
	vcdp->fullBus  (c+117,(3U),3);
	vcdp->fullBus  (c+118,(4U),3);
	vcdp->fullBus  (c+119,(5U),3);
	vcdp->fullBus  (c+120,(6U),3);
	vcdp->fullBus  (c+121,(7U),3);
	vcdp->fullBit  (c+122,(0U));
    }
}
