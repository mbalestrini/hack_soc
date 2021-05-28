// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtest_A__Syms.h"


//======================

void Vtest_A::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&Vtest_A::traceInit, &Vtest_A::traceFull, &Vtest_A::traceChg, this);
}
void Vtest_A::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vtest_A* t=(Vtest_A*)userthis;
    Vtest_A__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vtest_A::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtest_A* t=(Vtest_A*)userthis;
    Vtest_A__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void Vtest_A::traceInitThis(Vtest_A__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vtest_A::traceFullThis(Vtest_A__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtest_A::traceInitThis__1(Vtest_A__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+2,"clk",-1);
	vcdp->declBit  (c+3,"reset",-1);
	vcdp->declBit  (c+4,"data_in",-1);
	vcdp->declBit  (c+5,"data_out",-1);
	vcdp->declBit  (c+2,"test_A clk",-1);
	vcdp->declBit  (c+3,"test_A reset",-1);
	vcdp->declBit  (c+4,"test_A data_in",-1);
	vcdp->declBit  (c+5,"test_A data_out",-1);
	vcdp->declBus  (c+1,"test_A internal_reg",-1,31,0);
    }
}

void Vtest_A::traceFullThis__1(Vtest_A__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->test_A__DOT__internal_reg),32);
	vcdp->fullBit  (c+2,(vlTOPp->clk));
	vcdp->fullBit  (c+3,(vlTOPp->reset));
	vcdp->fullBit  (c+4,(vlTOPp->data_in));
	vcdp->fullBit  (c+5,(vlTOPp->data_out));
    }
}
