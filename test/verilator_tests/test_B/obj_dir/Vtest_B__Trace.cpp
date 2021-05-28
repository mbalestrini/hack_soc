// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtest_B__Syms.h"


//======================

void Vtest_B::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtest_B* t=(Vtest_B*)userthis;
    Vtest_B__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis (vlSymsp, vcdp, code);
    }
}

//======================


void Vtest_B::traceChgThis(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 2U))))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & ((((vlTOPp->__Vm_traceActivity 
				  | (vlTOPp->__Vm_traceActivity 
				     >> 2U)) | (vlTOPp->__Vm_traceActivity 
						>> 3U)) 
				| (vlTOPp->__Vm_traceActivity 
				   >> 4U)) | (vlTOPp->__Vm_traceActivity 
					      >> 5U))))) {
	    vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (((vlTOPp->__Vm_traceActivity 
				 | (vlTOPp->__Vm_traceActivity 
				    >> 3U)) | (vlTOPp->__Vm_traceActivity 
					       >> 4U)) 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 5U))))) {
	    vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 4U))))) {
	    vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
				| (vlTOPp->__Vm_traceActivity 
				   >> 4U)) | (vlTOPp->__Vm_traceActivity 
					      >> 5U))))) {
	    vlTOPp->traceChgThis__6(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 5U))))) {
	    vlTOPp->traceChgThis__7(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__8(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (((vlTOPp->__Vm_traceActivity 
				 >> 1U) | (vlTOPp->__Vm_traceActivity 
					   >> 3U)) 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 4U))))) {
	    vlTOPp->traceChgThis__9(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((8U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x10U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__11(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__12(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtest_B::traceChgThis__2(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+1,(vlTOPp->test_B__DOT__soc__DOT__hack_reset));
	vcdp->chgBit  (c+2,(vlTOPp->test_B__DOT__soc__DOT__ram_request));
	vcdp->chgBit  (c+3,(vlTOPp->test_B__DOT__soc__DOT__rom_request));
    }
}

void Vtest_B::traceChgThis__3(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+4,((0xffffU & ((IData)(vlTOPp->test_B__DOT__soc__DOT__hack_reset)
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
    }
}

void Vtest_B::traceChgThis__4(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+5,(((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load)
			      ? (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in)
			      : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),16);
    }
}

void Vtest_B::traceChgThis__5(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+6,(vlTOPp->test_B__DOT__soc__DOT__hack_writeM));
	vcdp->chgBit  (c+7,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_load));
    }
}

void Vtest_B::traceChgThis__6(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+8,((1U & (((((((((1U == (7U 
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
				       | (((3U == (7U 
						   & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
					    ? 1U : 0U) 
					  & ((~ (IData)(
							(0U 
							 != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))) 
					     | (~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
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
    }
}

void Vtest_B::traceChgThis__7(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+9,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out),16);
	vcdp->chgBus  (c+10,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__areg_in),16);
	vcdp->chgBit  (c+11,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load));
	vcdp->chgBit  (c+12,((1U & (~ (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__pc_load)))));
	vcdp->chgBit  (c+13,((1U & (~ (IData)((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out)))))));
	vcdp->chgBit  (c+14,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__alu_out) 
				    >> 0xfU))));
	vcdp->chgBus  (c+15,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzx),16);
	vcdp->chgBus  (c+16,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vnx),16);
	vcdp->chgBus  (c+17,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vzy),16);
	vcdp->chgBus  (c+18,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vny),16);
	vcdp->chgBus  (c+19,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__ALU__DOT__vf),16);
    }
}

void Vtest_B::traceChgThis__8(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+20,(vlTOPp->test_B__DOT__ram_sio_oe));
	vcdp->chgBit  (c+21,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    >> 0x14U))));
	vcdp->chgBit  (c+22,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    >> 0x15U))));
	vcdp->chgBit  (c+23,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    >> 0x16U))));
	vcdp->chgBit  (c+24,((1U & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				    >> 0x17U))));
	vcdp->chgBit  (c+25,(vlTOPp->test_B__DOT__rom_sio_oe));
	vcdp->chgBit  (c+26,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    >> 0x14U))));
	vcdp->chgBit  (c+27,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    >> 0x15U))));
	vcdp->chgBit  (c+28,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    >> 0x16U))));
	vcdp->chgBit  (c+29,((1U & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				    >> 0x17U))));
	vcdp->chgBus  (c+30,(vlTOPp->test_B__DOT__soc__DOT__hack_wait_clocks),2);
	vcdp->chgBit  (c+31,(vlTOPp->test_B__DOT__soc__DOT__hack_clk_strobe));
	vcdp->chgBit  (c+32,(vlTOPp->test_B__DOT__soc__DOT__hack_clk));
	vcdp->chgBus  (c+33,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer),16);
	vcdp->chgBit  (c+34,((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state))));
	vcdp->chgBit  (c+35,(vlTOPp->test_B__DOT__soc__DOT__ram_initialized));
	vcdp->chgBit  (c+36,((0U != (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state))));
	vcdp->chgBit  (c+37,(vlTOPp->test_B__DOT__soc__DOT__rom_initialized));
	vcdp->chgBus  (c+38,(vlTOPp->test_B__DOT__soc__DOT__hack_clock_0__DOT__counter),6);
	vcdp->chgBus  (c+39,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__current_state),3);
	vcdp->chgBus  (c+40,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__initializing_step),5);
	vcdp->chgBus  (c+41,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_address),15);
	vcdp->chgBus  (c+42,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_data_out),16);
	vcdp->chgBit  (c+43,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__request_write));
	vcdp->chgBus  (c+44,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer),24);
	vcdp->chgBus  (c+45,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_bits_left),5);
	vcdp->chgBus  (c+46,(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_bits_left),5);
	vcdp->chgBus  (c+47,((0xfU & (vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__output_buffer 
				      >> 0x14U))),4);
	vcdp->chgBus  (c+48,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__current_state),3);
	vcdp->chgBus  (c+49,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__initializing_step),5);
	vcdp->chgBus  (c+50,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_address),15);
	vcdp->chgBus  (c+51,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_data_out),16);
	vcdp->chgBit  (c+52,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__request_write));
	vcdp->chgBus  (c+53,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer),24);
	vcdp->chgBus  (c+54,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_bits_left),5);
	vcdp->chgBus  (c+55,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_bits_left),5);
	vcdp->chgBus  (c+56,((0xfU & (vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__output_buffer 
				      >> 0x14U))),4);
    }
}

void Vtest_B::traceChgThis__9(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+57,(((0x1000U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))
			       ? (IData)(vlTOPp->test_B__DOT__soc__DOT__ram_encoder_0__DOT__input_buffer)
			       : (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),16);
    }
}

void Vtest_B::traceChgThis__10(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+58,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data))),15);
	vcdp->chgBus  (c+59,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data))),15);
	vcdp->chgBus  (c+60,(vlTOPp->test_B__DOT__debug_gpio),16);
	vcdp->chgBus  (c+61,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__AReg__DOT__data),16);
	vcdp->chgBus  (c+62,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__DReg__DOT__data),16);
	vcdp->chgBus  (c+63,(vlTOPp->test_B__DOT__soc__DOT__cpu__DOT__PC__DOT__REG__DOT__data),16);
    }
}

void Vtest_B::traceChgThis__11(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+64,(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer),16);
	vcdp->chgBit  (c+65,((1U & (((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				     >> 0xfU) & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
						 >> 4U)))));
	vcdp->chgBit  (c+66,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 0xbU))));
	vcdp->chgBit  (c+67,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 0xaU))));
	vcdp->chgBit  (c+68,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 9U))));
	vcdp->chgBit  (c+69,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 8U))));
	vcdp->chgBit  (c+70,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 7U))));
	vcdp->chgBit  (c+71,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 6U))));
	vcdp->chgBit  (c+72,((1U & (~ ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				       >> 0xfU)))));
	vcdp->chgBus  (c+73,((0x7fffU & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))),15);
	vcdp->chgBit  (c+74,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 0xfU))));
	vcdp->chgBit  (c+75,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 5U))));
	vcdp->chgBit  (c+76,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 4U))));
	vcdp->chgBit  (c+77,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 3U))));
	vcdp->chgBit  (c+78,((1U & ((IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer) 
				    >> 0xcU))));
	vcdp->chgBit  (c+79,((1U & ((0U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+80,((1U & ((1U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+81,((1U & ((2U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+82,((1U & ((3U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+83,((1U & ((4U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+84,((1U & ((5U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+85,((1U & ((6U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBit  (c+86,((1U & ((7U == (7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer)))
				     ? 1U : 0U))));
	vcdp->chgBus  (c+87,((7U & (IData)(vlTOPp->test_B__DOT__soc__DOT__rom_encoder_0__DOT__input_buffer))),3);
    }
}

void Vtest_B::traceChgThis__12(Vtest_B__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtest_B* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+88,(vlTOPp->clk));
	vcdp->chgBit  (c+89,(vlTOPp->reset));
	vcdp->chgBit  (c+90,(vlTOPp->ram_sck));
	vcdp->chgBit  (c+91,(vlTOPp->ram_cs_n));
	vcdp->chgBit  (c+92,(vlTOPp->ram_sio0));
	vcdp->chgBit  (c+93,(vlTOPp->ram_sio1));
	vcdp->chgBit  (c+94,(vlTOPp->ram_sio2));
	vcdp->chgBit  (c+95,(vlTOPp->ram_sio3));
	vcdp->chgBit  (c+96,(vlTOPp->rom_sck));
	vcdp->chgBit  (c+97,(vlTOPp->rom_cs_n));
	vcdp->chgBit  (c+98,(vlTOPp->rom_sio0));
	vcdp->chgBit  (c+99,(vlTOPp->rom_sio1));
	vcdp->chgBit  (c+100,(vlTOPp->rom_sio2));
	vcdp->chgBit  (c+101,(vlTOPp->rom_sio3));
	vcdp->chgBus  (c+102,((((IData)(vlTOPp->ram_sio3) 
				<< 3U) | (((IData)(vlTOPp->ram_sio2) 
					   << 2U) | 
					  (((IData)(vlTOPp->ram_sio1) 
					    << 1U) 
					   | (IData)(vlTOPp->ram_sio0))))),4);
	vcdp->chgBus  (c+103,((((IData)(vlTOPp->rom_sio3) 
				<< 3U) | (((IData)(vlTOPp->rom_sio2) 
					   << 2U) | 
					  (((IData)(vlTOPp->rom_sio1) 
					    << 1U) 
					   | (IData)(vlTOPp->rom_sio0))))),4);
    }
}
