// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtest_A.h for the primary calling header

#include "Vtest_A.h"           // For This
#include "Vtest_A__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vtest_A) {
    Vtest_A__Syms* __restrict vlSymsp = __VlSymsp = new Vtest_A__Syms(this, name());
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vtest_A::__Vconfigure(Vtest_A__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vtest_A::~Vtest_A() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vtest_A::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtest_A::eval\n"); );
    Vtest_A__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	vlSymsp->__Vm_activity = true;
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
    }
}

void Vtest_A::_eval_initial_loop(Vtest_A__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
    }
}

//--------------------
// Internal Methods

void Vtest_A::_initial__TOP__1(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_initial__TOP__1\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // INITIAL at test_A.v:13
    VL_WRITEF("test module starting\n");
    VL_FINISH_MT("test_A.v",16,"");
}

VL_INLINE_OPT void Vtest_A::_sequent__TOP__2(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_sequent__TOP__2\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIG(__Vdly__test_A__DOT__internal_reg,31,0);
    // Body
    __Vdly__test_A__DOT__internal_reg = vlTOPp->test_A__DOT__internal_reg;
    // ALWAYS at test_A.v:26
    __Vdly__test_A__DOT__internal_reg = ((IData)(vlTOPp->reset)
					  ? 0U : (vlTOPp->test_A__DOT__internal_reg 
						  + (IData)(vlTOPp->data_in)));
    vlTOPp->test_A__DOT__internal_reg = __Vdly__test_A__DOT__internal_reg;
    vlTOPp->data_out = (1U & vlTOPp->test_A__DOT__internal_reg);
}

void Vtest_A::_settle__TOP__3(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_settle__TOP__3\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data_out = (1U & vlTOPp->test_A__DOT__internal_reg);
}

void Vtest_A::_eval(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_eval\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->_sequent__TOP__2(vlSymsp);
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

void Vtest_A::_eval_initial(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_eval_initial\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__1(vlSymsp);
}

void Vtest_A::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::final\n"); );
    // Variables
    Vtest_A__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vtest_A::_eval_settle(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_eval_settle\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

VL_INLINE_OPT QData Vtest_A::_change_request(Vtest_A__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_change_request\n"); );
    Vtest_A* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vtest_A::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
	Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
	Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((data_in & 0xfeU))) {
	Verilated::overWidthError("data_in");}
}
#endif // VL_DEBUG

void Vtest_A::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_A::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    data_in = VL_RAND_RESET_I(1);
    data_out = VL_RAND_RESET_I(1);
    test_A__DOT__internal_reg = VL_RAND_RESET_I(32);
    __Vclklast__TOP__clk = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}
