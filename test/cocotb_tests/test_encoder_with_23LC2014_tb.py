import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 


def nibble_dut_sio(dut):
    return (int(dut.sram_sio3)<<3) + (int(dut.sram_sio2)<<2) + (int(dut.sram_sio1)<<1) + int(dut.sram_sio0)

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0
    
    # Wait initialization
    #await ClockCycles(dut.clk, 30)
    
    
    #await ClockCycles(dut.clk, 20)


@cocotb.test()
async def test_encoder_with_23LC2014_tb(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())
    dut.request = 0
    dut.hack_outM = 0    
    await reset(dut)
  
    await(RisingEdge(dut.initialized))
    

    # *** WRITE TO SRAM ***
    dut.hack_addressM = 0xFEDC
    dut.hack_writeM = 1
    dut.hack_outM = 0x1234
    await(ClockCycles(dut.clk, 1))

    dut.request = 1

    await(RisingEdge(dut.busy))
    await(ClockCycles(dut.clk, 1))

    # assert(dut.busy)      
    
    dut.request = 0

    await ClockCycles(dut.clk, 2)
    # sram chip selected
    # assert(dut.sram_cs_n==0)
    # WRITE INSTRUCTION HIGH NIBBLE
    # assert(nibble_dut_sio(dut)==0)
    
    await ClockCycles(dut.clk, 2)
    # WRITE INSTRUCTION LOW NIBBLE
    # assert(nibble_dut_sio(dut)==2)


    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [23:20]
    # assert(nibble_dut_sio(dut)==0x0)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [19:16]
    # assert(nibble_dut_sio(dut)==0x0)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [15:12]
    # assert(nibble_dut_sio(dut)==0xF)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [11:8]
    # assert(nibble_dut_sio(dut)==0xE)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [7:4]
    # assert(nibble_dut_sio(dut)==0xD)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [3:0]
    # assert(nibble_dut_sio(dut)==0xC)

    
    await ClockCycles(dut.clk, 2)
    # DATA BITS [15:12]
    # assert(nibble_dut_sio(dut)==0x1)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [11:8]
    # assert(nibble_dut_sio(dut)==0x2)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [7:4]
    # assert(nibble_dut_sio(dut)==0x3)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [3:0]
    # assert(nibble_dut_sio(dut)==0x4)

    await ClockCycles(dut.clk, 2)
    # sram disabled
    # assert(dut.sram_cs_n==1)



    await ClockCycles(dut.clk, 10)






    # *** READ FROM SRAM ***

    dut.hack_addressM = 0xFEDC
    dut.hack_writeM = 0
    dut.hack_outM = 0
    await(ClockCycles(dut.clk, 1))

    dut.request = 1
    

    await ClockCycles(dut.clk, 2)
    # assert(dut.busy)      
    
    dut.request = 0
    
    await ClockCycles(dut.clk, 2)
    # sram chip selected
    # assert(dut.sram_cs_n==0)
    # READ INSTRUCTION HIGH NIBBLE
    # assert(nibble_dut_sio(dut)==0)
    
    await ClockCycles(dut.clk, 2)
    # READ INSTRUCTION LOW NIBBLE

    # assert(nibble_dut_sio(dut)==3)

    
    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [23:20]
    # assert(nibble_dut_sio(dut)==0)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [19:16]
    # assert(nibble_dut_sio(dut)==0)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [15:12]
    # assert(nibble_dut_sio(dut)==0xF)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [11:8]
    # assert(nibble_dut_sio(dut)==0xE)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [7:4]
    # assert(nibble_dut_sio(dut)==0xD)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [3:0]
    # assert(nibble_dut_sio(dut)==0xC)


    # # DUMMY BYTE
    await ClockCycles(dut.clk, 1)
    # dut.sio_i = 0xF
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    # dut.sio_i = 0xF
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)

    # dut.sram_sio0 = 1
    # dut.sram_sio1 = 0
    # dut.sram_sio2 = 0
    # dut.sram_sio3 = 0
    await ClockCycles(dut.clk, 2)
    # dut.sram_sio0 = 0
    # dut.sram_sio1 = 1
    # dut.sram_sio2 = 0
    # dut.sram_sio3 = 0    
    await ClockCycles(dut.clk, 2)
    # dut.sram_sio0 = 1
    # dut.sram_sio1 = 1
    # dut.sram_sio2 = 0
    # dut.sram_sio3 = 0
    await ClockCycles(dut.clk, 2)
    # dut.sram_sio0 = 0
    # dut.sram_sio1 = 0
    # dut.sram_sio2 = 1
    # dut.sram_sio3 = 0
    await ClockCycles(dut.clk, 2)

    await ClockCycles(dut.clk, 1)
    assert(dut.hack_inM==0x1234)

    await ClockCycles(dut.clk, 2)
    # assert(dut.sram_cs_n==1)




    # dut.hack_addressM = 0xABCD
    # dut.hack_writeM = 1
    # dut.hack_outM = 0x5432    
    # dut.request = 1
    

    # await ClockCycles(dut.clk, 2)
    # assert(dut.busy)    	
    # # sram chip selected
    # assert(dut.sram_cs_n==0)

    # dut.request = 0

    # # WRITE TO SRAM

    # await ClockCycles(dut.clk, 2)
    # # READ INSTRUCTION HIGH NIBBLE
    # assert(dut.sio_o==0)
    
    # await ClockCycles(dut.clk, 2)
    # # READ INSTRUCTION LOW NIBBLE
    # assert(dut.sio_o==2)


    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [23:20]
    # assert(dut.sio_o==0x0)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [19:16]
    # assert(dut.sio_o==0x0)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [15:12]
    # assert(dut.sio_o==0xA)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [11:8]
    # assert(dut.sio_o==0xB)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [7:4]
    # assert(dut.sio_o==0xC)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [3:0]
    # assert(dut.sio_o==0xD)

    
    # await ClockCycles(dut.clk, 2)
    # # DATA BITS [15:12]
    # assert(dut.sio_o==0x5)

    # await ClockCycles(dut.clk, 2)
    # # DATA BITS [11:8]
    # assert(dut.sio_o==0x4)

    # await ClockCycles(dut.clk, 2)
    # # DATA BITS [7:4]
    # assert(dut.sio_o==0x3)

    # await ClockCycles(dut.clk, 2)
    # # DATA BITS [3:0]
    # assert(dut.sio_o==0x2)

    # await ClockCycles(dut.clk, 2)
    # # sram disabled
    # assert(dut.sram_cs_n==1)



    # await ClockCycles(dut.clk, 10)

    

    # dut.address = 0xFEDC
    # dut.request = 1
    # dut.write_enable = 0

    # # READ FROM SRAM

    # await ClockCycles(dut.clk, 2)
    # assert(dut.busy)    	
    # # sram chip selected
    # assert(dut.sram_cs_n==0)

    # dut.request = 0
    
    # await ClockCycles(dut.clk, 2)
    # # READ INSTRUCTION HIGH NIBBLE
    # assert(dut.sio_o==0)
    
    # await ClockCycles(dut.clk, 2)
    # # READ INSTRUCTION LOW NIBBLE
    # assert(dut.sio_o==3)

	
    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [23:20]
    # assert(dut.sio_o==0)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [19:16]
    # assert(dut.sio_o==0)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [15:12]
    # assert(dut.sio_o==0xF)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [11:8]
    # assert(dut.sio_o==0xE)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [7:4]
    # assert(dut.sio_o==0xD)

    # await ClockCycles(dut.clk, 2)
    # # ADDRESS BITS [3:0]
    # assert(dut.sio_o==0xC)


    # # DUMMY BYTE
    # await ClockCycles(dut.clk, 1)
    # dut.sio_i = 0xF
    # await ClockCycles(dut.clk, 1)
    # await ClockCycles(dut.clk, 1)
    # dut.sio_i = 0xF
    # await ClockCycles(dut.clk, 1)
    # await ClockCycles(dut.clk, 1)

    # dut.sio_i = 0x1
    # await ClockCycles(dut.clk, 2)
    # dut.sio_i = 0x2
    # await ClockCycles(dut.clk, 2)
    # dut.sio_i = 0x3
    # await ClockCycles(dut.clk, 2)
    # dut.sio_i = 0x4
    # await ClockCycles(dut.clk, 2)

    # await ClockCycles(dut.clk, 1)
    # assert(dut.data_in==0x1234)

    # await ClockCycles(dut.clk, 2)
    # assert(dut.sram_cs_n==1)


    await ClockCycles(dut.clk, 60)

