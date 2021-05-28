// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtest_B.h for the primary calling header

#include "Vtest_B.h"           // For This
#include "Vtest_B__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vtest_B) {
    Vtest_B__Syms* __restrict vlSymsp = __VlSymsp = new Vtest_B__Syms(this, name());
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vtest_B::__Vconfigure(Vtest_B__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vtest_B::~Vtest_B() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vtest_B::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtest_B::eval\n"); );
    Vtest_B__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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

void Vtest_B::_eval_initial_loop(Vtest_B__Syms* __restrict vlSymsp) {
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

void Vtest_B::_initial__TOP__1(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_initial__TOP__1\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // INITIAL at test_B.v:141
    VL_WRITEF("\033[1;34m\ntest module starting\n\033[0m\n");
}

VL_INLINE_OPT void Vtest_B::_sequent__TOP__2(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_sequent__TOP__2\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__hack_wait_clocks,1,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__hack_clk,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter,5,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state,2,0);
    VL_SIG8(__Vdly__ram_cs_n,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step,4,0);
    VL_SIG8(__Vdly__ram_sck,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left,4,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left,4,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state,2,0);
    VL_SIG8(__Vdly__rom_cs_n,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step,4,0);
    VL_SIG8(__Vdly__rom_sck,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write,0,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left,4,0);
    VL_SIG8(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left,4,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address,14,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out,15,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer,15,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address,14,0);
    VL_SIG16(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out,15,0);
    VL_SIG(__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer,23,0);
    VL_SIG(__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer,23,0);
    // Body
    __Vdly__ram_cs_n = vlTOPp->ram_cs_n;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step;
    __Vdly__ram_sck = vlTOPp->ram_sck;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer;
    __Vdly__rom_cs_n = vlTOPp->rom_cs_n;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step;
    __Vdly__rom_sck = vlTOPp->rom_sck;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state;
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer;
    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer 
	= vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer;
    vlTOPp->__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer 
	= vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer;
    __Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter 
	= vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter;
    __Vdly__test_B__DOT__soc__DOT__hack_wait_clocks 
	= vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks;
    __Vdly__test_B__DOT__soc__DOT__hack_clk = vlTOPp->test_B__DOT__soc__DOT__hack_clk;
    // ALWAYS at ../../../src/spi_sram_encoder.v:122
    if (vlTOPp->reset) {
	__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 7U;
	vlTOPp->test_B__DOT__soc__DOT__ram_initialized = 0U;
	__Vdly__ram_cs_n = 1U;
	vlTOPp->test_B__DOT__ram_sio_oe = 1U;
	__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step = 0U;
	__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
	    = (0xf00000U | __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer);
	__Vdly__ram_sck = 0U;
    } else {
	__Vdly__ram_sck = (1U & (~ (IData)(vlTOPp->ram_sck)));
	if (vlTOPp->ram_sck) {
	    if ((7U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
		if (vlTOPp->ram_cs_n) {
		    __Vdly__ram_cs_n = 0U;
		}
		__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step 
		    = (0x1fU & ((IData)(1U) + (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)));
		if (((((((((0U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)) 
			   | (1U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
			  | (2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
			 | (3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
			| (4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
		       | (5U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
		      | (6U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) 
		     | (7U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)))) {
		    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			= ((0xefffffU & __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer) 
			   | (((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)) 
			       & ((1U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)) 
				  & ((2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)) 
				     | ((3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)) 
					| (4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step)))))) 
			      << 0x14U));
		} else {
		    if ((8U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step))) {
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 0U;
			__Vdly__ram_cs_n = 1U;
			vlTOPp->test_B__DOT__soc__DOT__ram_initialized = 1U;
		    }
		}
	    } else {
		if ((0U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
		    if (((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_request) 
			 & (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_busy)))) {
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 1U;
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address 
			    = (0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data));
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write 
			    = vlTOPp->test_B__DOT__soc__DOT__hack_writeM;
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out 
			    = vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out;
			vlTOPp->test_B__DOT__ram_sio_oe = 1U;
		    }
		} else {
		    if ((1U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
			__Vdly__ram_cs_n = 0U;
			__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 2U;
			if (vlTOPp->test_B__DOT__soc__DOT__hack_writeM) {
			    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer = 0x20000U;
			    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left = 8U;
			} else {
			    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer = 0x30000U;
			    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left = 8U;
			}
		    } else {
			if ((2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
			    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left))) {
				__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 3U;
				__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    = (0xfffe00U & 
				       ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address) 
					<< 0xaU));
				__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left = 0x18U;
			    } else {
				__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    = (0xffffffU & 
				       (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
					<< 4U));
				__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left 
				    = (0x1fU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left) 
						- (IData)(4U)));
			    }
			} else {
			    if ((3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
				if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left))) {
				    if (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write) {
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 5U;
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
					    = ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out) 
					       << 8U);
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left = 0x10U;
				    } else {
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 4U;
					vlTOPp->test_B__DOT__ram_sio_oe = 0U;
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left = 0x18U;
				    }
				} else {
				    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
					= (0xffffffU 
					   & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
					      << 4U));
				    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left 
					= (0x1fU & 
					   ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left) 
					    - (IData)(4U)));
				}
			    } else {
				if ((5U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
				    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left))) {
					__Vdly__ram_cs_n = 1U;
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 0U;
				    } else {
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
					    = (0xffffffU 
					       & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
						  << 4U));
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left 
					    = (0x1fU 
					       & ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left) 
						  - (IData)(4U)));
				    }
				} else {
				    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))) {
					__Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer 
					    = ((0xfff0U 
						& ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer) 
						   << 4U)) 
					       | (((IData)(vlTOPp->ram_sio3) 
						   << 3U) 
						  | (((IData)(vlTOPp->ram_sio2) 
						      << 2U) 
						     | (((IData)(vlTOPp->ram_sio1) 
							 << 1U) 
							| (IData)(vlTOPp->ram_sio0)))));
					if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left))) {
					    __Vdly__ram_cs_n = 1U;
					    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = 0U;
					} else {
					    __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left 
						= (0x1fU 
						   & ((IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left) 
						      - (IData)(4U)));
					}
				    }
				}
			    }
			}
		    }
		}
	    }
	}
    }
    // ALWAYS at ../../../src/spi_sram_encoder.v:122
    if (vlTOPp->reset) {
	__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 7U;
	vlTOPp->test_B__DOT__soc__DOT__rom_initialized = 0U;
	__Vdly__rom_cs_n = 1U;
	vlTOPp->test_B__DOT__rom_sio_oe = 1U;
	__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step = 0U;
	__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
	    = (0xf00000U | __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer);
	__Vdly__rom_sck = 0U;
    } else {
	__Vdly__rom_sck = (1U & (~ (IData)(vlTOPp->rom_sck)));
	if (vlTOPp->rom_sck) {
	    if ((7U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
		if (vlTOPp->rom_cs_n) {
		    __Vdly__rom_cs_n = 0U;
		}
		__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step 
		    = (0x1fU & ((IData)(1U) + (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)));
		if (((((((((0U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)) 
			   | (1U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
			  | (2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
			 | (3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
			| (4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
		       | (5U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
		      | (6U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) 
		     | (7U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)))) {
		    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			= ((0xefffffU & __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer) 
			   | (((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)) 
			       & ((1U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)) 
				  & ((2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)) 
				     | ((3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)) 
					| (4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step)))))) 
			      << 0x14U));
		} else {
		    if ((8U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step))) {
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 0U;
			__Vdly__rom_cs_n = 1U;
			vlTOPp->test_B__DOT__soc__DOT__rom_initialized = 1U;
		    }
		}
	    } else {
		if ((0U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
		    if (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_request) 
			 & (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_busy)))) {
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 1U;
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address 
			    = (0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data));
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write = 0U;
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out = 0U;
			vlTOPp->test_B__DOT__rom_sio_oe = 1U;
		    }
		} else {
		    if ((1U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
			__Vdly__rom_cs_n = 0U;
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 2U;
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer = 0x30000U;
			__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left = 8U;
		    } else {
			if ((2U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
			    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left))) {
				__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 3U;
				__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    = (0xfffe00U & 
				       ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address) 
					<< 0xaU));
				__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left = 0x18U;
			    } else {
				__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    = (0xffffffU & 
				       (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
					<< 4U));
				__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left 
				    = (0x1fU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left) 
						- (IData)(4U)));
			    }
			} else {
			    if ((3U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
				if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left))) {
				    if (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write) {
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 5U;
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
					    = ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out) 
					       << 8U);
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left = 0x10U;
				    } else {
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 4U;
					vlTOPp->test_B__DOT__rom_sio_oe = 0U;
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left = 0x18U;
				    }
				} else {
				    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
					= (0xffffffU 
					   & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
					      << 4U));
				    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left 
					= (0x1fU & 
					   ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left) 
					    - (IData)(4U)));
				}
			    } else {
				if ((5U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
				    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left))) {
					__Vdly__rom_cs_n = 1U;
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 0U;
				    } else {
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
					    = (0xffffffU 
					       & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
						  << 4U));
					__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left 
					    = (0x1fU 
					       & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left) 
						  - (IData)(4U)));
				    }
				} else {
				    if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))) {
					vlTOPp->__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer 
					    = ((0xfff0U 
						& ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
						   << 4U)) 
					       | (((IData)(vlTOPp->rom_sio3) 
						   << 3U) 
						  | (((IData)(vlTOPp->rom_sio2) 
						      << 2U) 
						     | (((IData)(vlTOPp->rom_sio1) 
							 << 1U) 
							| (IData)(vlTOPp->rom_sio0)))));
					if ((4U == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left))) {
					    __Vdly__rom_cs_n = 1U;
					    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = 0U;
					} else {
					    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left 
						= (0x1fU 
						   & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left) 
						      - (IData)(4U)));
					}
				    }
				}
			    }
			}
		    }
		}
	    }
	}
    }
    // ALWAYS at ../../../src/hack_soc.v:162
    if (vlTOPp->reset) {
	__Vdly__test_B__DOT__soc__DOT__hack_wait_clocks = 2U;
    } else {
	if ((((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks)) 
	      & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe)) 
	     & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk))) {
	    __Vdly__test_B__DOT__soc__DOT__hack_wait_clocks 
		= (3U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks) 
			 - (IData)(1U)));
	}
    }
    vlTOPp->ram_sck = __Vdly__ram_sck;
    vlTOPp->ram_cs_n = __Vdly__ram_cs_n;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer;
    vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer 
	= __Vdly__test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer;
    vlTOPp->rom_sck = __Vdly__rom_sck;
    vlTOPp->rom_cs_n = __Vdly__rom_cs_n;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state;
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
	= __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer;
    vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks 
	= __Vdly__test_B__DOT__soc__DOT__hack_wait_clocks;
    vlTOPp->test_B__DOT__soc__DOT__ram_busy = (0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state));
    vlTOPp->ram_sio2 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x16U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->ram_sio0 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x14U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->ram_sio3 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x17U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->ram_sio1 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x15U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->test_B__DOT__soc__DOT__rom_busy = (0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state));
    vlTOPp->rom_sio0 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x14U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->rom_sio1 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x15U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->rom_sio3 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x17U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->rom_sio2 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x16U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    // ALWAYS at ../../../src/hack_clock.v:13
    if (vlTOPp->reset) {
	__Vdly__test_B__DOT__soc__DOT__hack_clk = 0U;
	__Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter = 0U;
	vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe = 0U;
    } else {
	__Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter 
	    = (0x3fU & ((IData)(1U) + (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter)));
	vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe = 0U;
	if ((0x12U == (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter))) {
	    __Vdly__test_B__DOT__soc__DOT__hack_clk 
		= (1U & (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk)));
	    __Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter = 0U;
	    vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe = 1U;
	}
    }
    vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter 
	= __Vdly__test_B__DOT__soc__DOT__hack_clock_0__DOT__counter;
    vlTOPp->test_B__DOT__soc__DOT__hack_clk = __Vdly__test_B__DOT__soc__DOT__hack_clk;
}

void Vtest_B::_settle__TOP__3(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_settle__TOP__3\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__ram_busy = (0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state));
    vlTOPp->test_B__DOT__soc__DOT__rom_busy = (0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state));
    vlTOPp->rom_sio0 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x14U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->ram_sio2 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x16U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->rom_sio1 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x15U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->ram_sio0 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x14U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->rom_sio3 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x17U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->ram_sio3 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x17U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->ram_sio1 = ((((IData)(vlTOPp->test_B__DOT__ram_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
			     >> 0x15U)) & (IData)(vlTOPp->test_B__DOT__ram_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__ram_sio_oe));
    vlTOPp->rom_sio2 = ((((IData)(vlTOPp->test_B__DOT__rom_sio_oe) 
			  & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
			     >> 0x16U)) & (IData)(vlTOPp->test_B__DOT__rom_sio_oe)) 
			& (IData)(vlTOPp->test_B__DOT__rom_sio_oe));
    vlTOPp->test_B__DOT__soc__DOT__ram_request = ((
						   (0U 
						    == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state)) 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk)) 
						  & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
    vlTOPp->test_B__DOT__soc__DOT__rom_request = ((
						   (0U 
						    == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state)) 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk)) 
						  & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
    vlTOPp->test_B__DOT__soc__DOT__hack_reset = (1U 
						 & ((((0U 
						       != (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks)) 
						      | (IData)(vlTOPp->reset)) 
						     | (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_initialized))) 
						    | (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_initialized))));
    vlTOPp->test_B__DOT__soc__DOT__hack_writeM = (1U 
						  & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
						      >> 0xfU) 
						     & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
							>> 3U)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx 
	= (0xffffU & ((0x800U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? 0U : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load 
	= (1U & ((~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
		     >> 0xfU)) | (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				   >> 0xfU) & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
					       >> 5U))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy 
	= (0xffffU & ((0x200U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? 0U : ((0x1000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
			        ? (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer)
			        : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx 
	= (0xffffU & ((0x400U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny 
	= (0xffffU & ((0x100U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf 
	= (0xffffU & ((0x80U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx) 
			  + (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny))
		       : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx) 
			  & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out 
	= (0xffffU & ((0x40U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in 
	= ((0x8000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
	    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)
	    : (0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load 
	= (1U & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
		  >> 0xfU) & (((((((((1U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U) & 
				    (~ ((~ (IData)(
						   (0U 
						    != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
					| ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					   >> 0xfU)))) 
				   | (((2U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				        ? 1U : 0U) 
				      & (~ (IData)(
						   (0U 
						    != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))))) 
				  | (((3U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				       ? 1U : 0U) & 
				     ((~ (IData)((0U 
						  != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
				      | (~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					    >> 0xfU))))) 
				 | (((4U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U) & 
				    ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
				     >> 0xfU))) | (
						   ((5U 
						     == 
						     (7U 
						      & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
						     ? 1U
						     : 0U) 
						   & (0U 
						      != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
			       | (((6U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				    ? 1U : 0U) & ((~ (IData)(
							     (0U 
							      != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
						  | ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
						     >> 0xfU)))) 
			      | ((7U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				  ? 1U : 0U))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__pc_in 
	= (0xffffU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__hack_reset)
		       ? 0U : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
			        ? ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load)
				    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in)
				    : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))
			        : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
				    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data)
				    : ((IData)(1U) 
				       + (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data))))));
}

VL_INLINE_OPT void Vtest_B::_combo__TOP__4(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_combo__TOP__4\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__ram_request = ((
						   (0U 
						    == (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state)) 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk)) 
						  & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
    vlTOPp->test_B__DOT__soc__DOT__rom_request = ((
						   (0U 
						    == (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state)) 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk)) 
						  & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
}

VL_INLINE_OPT void Vtest_B::_sequent__TOP__5(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_sequent__TOP__5\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at ../../../src/register.v:11
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data 
	= vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__pc_in;
    // ALWAYS at ../../../src/hack_soc.v:182
    if (vlTOPp->test_B__DOT__soc__DOT__hack_reset) {
	vlTOPp->test_B__DOT__debug_gpio = 0U;
    } else {
	if (((0U == (0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))) 
	     & (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_writeM))) {
	    vlTOPp->test_B__DOT__debug_gpio = vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out;
	}
    }
    // ALWAYS at ../../../src/register.v:11
    if ((1U & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
		>> 0xfU) & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
			    >> 4U)))) {
	vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data 
	    = vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out;
    }
    // ALWAYS at ../../../src/register.v:11
    if (vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load) {
	vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data 
	    = vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in;
    }
}

VL_INLINE_OPT void Vtest_B::_combo__TOP__6(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_combo__TOP__6\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__hack_reset = (1U 
						 & ((((0U 
						       != (IData)(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks)) 
						      | (IData)(vlTOPp->reset)) 
						     | (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_initialized))) 
						    | (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_initialized))));
}

VL_INLINE_OPT void Vtest_B::_sequent__TOP__7(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_sequent__TOP__7\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer 
	= vlTOPp->__Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer;
    vlTOPp->test_B__DOT__soc__DOT__hack_writeM = (1U 
						  & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
						      >> 0xfU) 
						     & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
							>> 3U)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load 
	= (1U & ((~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
		     >> 0xfU)) | (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				   >> 0xfU) & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
					       >> 5U))));
}

VL_INLINE_OPT void Vtest_B::_multiclk__TOP__8(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_multiclk__TOP__8\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx 
	= (0xffffU & ((0x800U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? 0U : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy 
	= (0xffffU & ((0x200U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? 0U : ((0x1000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
			        ? (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer)
			        : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx 
	= (0xffffU & ((0x400U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny 
	= (0xffffU & ((0x100U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf 
	= (0xffffU & ((0x80U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx) 
			  + (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny))
		       : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx) 
			  & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny))));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out 
	= (0xffffU & ((0x40U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
		       ? (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf))
		       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in 
	= ((0x8000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
	    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)
	    : (0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)));
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load 
	= (1U & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
		  >> 0xfU) & (((((((((1U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U) & 
				    (~ ((~ (IData)(
						   (0U 
						    != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
					| ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					   >> 0xfU)))) 
				   | (((2U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				        ? 1U : 0U) 
				      & (~ (IData)(
						   (0U 
						    != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))))) 
				  | (((3U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				       ? 1U : 0U) & 
				     ((~ (IData)((0U 
						  != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
				      | (~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
					    >> 0xfU))))) 
				 | (((4U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				      ? 1U : 0U) & 
				    ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
				     >> 0xfU))) | (
						   ((5U 
						     == 
						     (7U 
						      & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
						     ? 1U
						     : 0U) 
						   & (0U 
						      != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
			       | (((6U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				    ? 1U : 0U) & ((~ (IData)(
							     (0U 
							      != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
						  | ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
						     >> 0xfU)))) 
			      | ((7U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				  ? 1U : 0U))));
}

VL_INLINE_OPT void Vtest_B::_combo__TOP__9(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_combo__TOP__9\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__pc_in 
	= (0xffffU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__hack_reset)
		       ? 0U : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
			        ? ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load)
				    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in)
				    : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))
			        : ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)
				    ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data)
				    : ((IData)(1U) 
				       + (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data))))));
}

void Vtest_B::_eval(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_eval\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->_sequent__TOP__2(vlSymsp);
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__4(vlSymsp);
    vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
    if (((IData)(vlTOPp->__VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk)))) {
	vlTOPp->_sequent__TOP__5(vlSymsp);
	vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__6(vlSymsp);
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->_sequent__TOP__7(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk))))) {
	vlTOPp->_multiclk__TOP__8(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__9(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk 
	= vlTOPp->__VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk;
    vlTOPp->__VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk 
	= vlTOPp->test_B__DOT__soc__DOT__hack_clk;
}

void Vtest_B::_eval_initial(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_eval_initial\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__1(vlSymsp);
}

void Vtest_B::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::final\n"); );
    // Variables
    Vtest_B__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vtest_B::_eval_settle(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_eval_settle\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

VL_INLINE_OPT QData Vtest_B::_change_request(Vtest_B__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_change_request\n"); );
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->test_B__DOT__soc__DOT__hack_clk ^ vlTOPp->__Vchglast__TOP__test_B__DOT__soc__DOT__hack_clk));
    VL_DEBUG_IF( if(__req && ((vlTOPp->test_B__DOT__soc__DOT__hack_clk ^ vlTOPp->__Vchglast__TOP__test_B__DOT__soc__DOT__hack_clk))) VL_DBG_MSGF("        CHANGE: ../../../src/hack_soc.v:54: test_B.soc.hack_clk\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__test_B__DOT__soc__DOT__hack_clk 
	= vlTOPp->test_B__DOT__soc__DOT__hack_clk;
    return __req;
}

#ifdef VL_DEBUG
void Vtest_B::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
	Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
	Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((ram_sio0 & 0xfeU))) {
	Verilated::overWidthError("ram_sio0");}
    if (VL_UNLIKELY((ram_sio1 & 0xfeU))) {
	Verilated::overWidthError("ram_sio1");}
    if (VL_UNLIKELY((ram_sio2 & 0xfeU))) {
	Verilated::overWidthError("ram_sio2");}
    if (VL_UNLIKELY((ram_sio3 & 0xfeU))) {
	Verilated::overWidthError("ram_sio3");}
    if (VL_UNLIKELY((rom_sio0 & 0xfeU))) {
	Verilated::overWidthError("rom_sio0");}
    if (VL_UNLIKELY((rom_sio1 & 0xfeU))) {
	Verilated::overWidthError("rom_sio1");}
    if (VL_UNLIKELY((rom_sio2 & 0xfeU))) {
	Verilated::overWidthError("rom_sio2");}
    if (VL_UNLIKELY((rom_sio3 & 0xfeU))) {
	Verilated::overWidthError("rom_sio3");}
}
#endif // VL_DEBUG

void Vtest_B::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtest_B::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    ram_sck = VL_RAND_RESET_I(1);
    ram_cs_n = VL_RAND_RESET_I(1);
    ram_sio0 = VL_RAND_RESET_I(1);
    ram_sio1 = VL_RAND_RESET_I(1);
    ram_sio2 = VL_RAND_RESET_I(1);
    ram_sio3 = VL_RAND_RESET_I(1);
    rom_sck = VL_RAND_RESET_I(1);
    rom_cs_n = VL_RAND_RESET_I(1);
    rom_sio0 = VL_RAND_RESET_I(1);
    rom_sio1 = VL_RAND_RESET_I(1);
    rom_sio2 = VL_RAND_RESET_I(1);
    rom_sio3 = VL_RAND_RESET_I(1);
    test_B__DOT__ram_sio_oe = VL_RAND_RESET_I(1);
    test_B__DOT__rom_sio_oe = VL_RAND_RESET_I(1);
    test_B__DOT__debug_gpio = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__hack_wait_clocks = VL_RAND_RESET_I(2);
    test_B__DOT__soc__DOT__hack_clk_strobe = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__hack_clk = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__hack_reset = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__hack_writeM = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__ram_request = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__ram_busy = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__ram_initialized = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__rom_request = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__rom_busy = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__rom_initialized = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__hack_clock_0__DOT__counter = VL_RAND_RESET_I(6);
    test_B__DOT__soc__DOT__cpu__DOT__areg_in = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__areg_load = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__cpu__DOT__pc_load = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__cpu__DOT__alu_out = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__pc_in = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state = VL_RAND_RESET_I(3);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step = VL_RAND_RESET_I(5);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address = VL_RAND_RESET_I(15);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer = VL_RAND_RESET_I(24);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left = VL_RAND_RESET_I(5);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left = VL_RAND_RESET_I(5);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state = VL_RAND_RESET_I(3);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step = VL_RAND_RESET_I(5);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address = VL_RAND_RESET_I(15);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write = VL_RAND_RESET_I(1);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer = VL_RAND_RESET_I(24);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left = VL_RAND_RESET_I(5);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer = VL_RAND_RESET_I(16);
    test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left = VL_RAND_RESET_I(5);
    __Vdly__test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer = VL_RAND_RESET_I(16);
    __VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk = VL_RAND_RESET_I(1);
    __Vclklast__TOP__clk = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__test_B__DOT__soc__DOT__hack_clk = VL_RAND_RESET_I(1);
    __Vchglast__TOP__test_B__DOT__soc__DOT__hack_clk = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}
