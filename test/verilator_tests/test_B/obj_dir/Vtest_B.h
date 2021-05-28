// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vtest_B_H_
#define _Vtest_B_H_

#include "verilated_heavy.h"

class Vtest_B__Syms;
class VerilatedVcd;

//----------

VL_MODULE(Vtest_B) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(ram_sck,0,0);
    VL_OUT8(ram_cs_n,0,0);
    VL_INOUT8(ram_sio0,0,0);
    VL_INOUT8(ram_sio1,0,0);
    VL_INOUT8(ram_sio2,0,0);
    VL_INOUT8(ram_sio3,0,0);
    VL_OUT8(rom_sck,0,0);
    VL_OUT8(rom_cs_n,0,0);
    VL_INOUT8(rom_sio0,0,0);
    VL_INOUT8(rom_sio1,0,0);
    VL_INOUT8(rom_sio2,0,0);
    VL_INOUT8(rom_sio3,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(test_B__DOT__soc__DOT__hack_clk,0,0);
    VL_SIG8(test_B__DOT__ram_sio_oe,0,0);
    VL_SIG8(test_B__DOT__rom_sio_oe,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__hack_wait_clocks,1,0);
    VL_SIG8(test_B__DOT__soc__DOT__hack_clk_strobe,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__hack_reset,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__hack_writeM,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_request,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_busy,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_initialized,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_request,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_busy,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_initialized,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__hack_clock_0__DOT__counter,5,0);
    VL_SIG8(test_B__DOT__soc__DOT__cpu__DOT__areg_load,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__cpu__DOT__pc_load,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state,2,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step,4,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left,4,0);
    VL_SIG8(test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left,4,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state,2,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step,4,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write,0,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left,4,0);
    VL_SIG8(test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left,4,0);
    VL_SIG16(test_B__DOT__debug_gpio,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__areg_in,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__alu_out,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__pc_in,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address,14,0);
    VL_SIG16(test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address,14,0);
    VL_SIG16(test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out,15,0);
    VL_SIG16(test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer,15,0);
    VL_SIG(test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer,23,0);
    VL_SIG(test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer,23,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(__VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk,0,0);
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk,0,0);
    VL_SIG8(__Vchglast__TOP__test_B__DOT__soc__DOT__hack_clk,0,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer,15,0);
    VL_SIG(__Vm_traceActivity,31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtest_B__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Vtest_B& operator= (const Vtest_B&);  ///< Copying not allowed
    Vtest_B(const Vtest_B&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vtest_B(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtest_B();
    /// Trace signals in the model; called by application code
    void trace (VerilatedVcdC* tfp, int levels, int options=0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtest_B__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtest_B__Syms* symsp, bool first);
  private:
    static QData _change_request(Vtest_B__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__4(Vtest_B__Syms* __restrict vlSymsp);
    static void _combo__TOP__6(Vtest_B__Syms* __restrict vlSymsp);
    static void _combo__TOP__9(Vtest_B__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    static void _eval(Vtest_B__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vtest_B__Syms* __restrict vlSymsp);
    static void _eval_settle(Vtest_B__Syms* __restrict vlSymsp);
    static void _initial__TOP__1(Vtest_B__Syms* __restrict vlSymsp);
    static void _multiclk__TOP__8(Vtest_B__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(Vtest_B__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(Vtest_B__Syms* __restrict vlSymsp);
    static void _sequent__TOP__7(Vtest_B__Syms* __restrict vlSymsp);
    static void _settle__TOP__3(Vtest_B__Syms* __restrict vlSymsp);
    static void traceChgThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis__1(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis__1(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInit (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg  (VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif // guard
