import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0;
    
    await ClockCycles(dut.clk, 21)
    assert(dut.initialized==1)
    


@cocotb.test()
async def test_spi_sram_encoder(dut):	
    clock = Clock(dut.clk, 10, units="us")
    sram_clock = Clock(dut.sram_sck, 20, units="us")
    cocotb.fork(clock.start())
    cocotb.fork(sram_clock.start())
    dut.request = 0
    await reset(dut)


    # WRITE TO SRAM
    HACK_ADDRESS = 0xABCD
    SRAM_MAPPED_ADDRESS = (HACK_ADDRESS<<1) 

    dut.address = HACK_ADDRESS
    dut.data_out = 0x5432
    dut.request = 1
    dut.write_enable = 1


    await ClockCycles(dut.clk, 2)
    assert(dut.busy)    

    dut.request = 0

    await ClockCycles(dut.clk, 2)
    # sram chip selected
    assert(dut.sram_cs_n==0)
    # READ INSTRUCTION HIGH NIBBLE
    assert(dut.sio_o==0)
    
    await ClockCycles(dut.clk, 2)
    # READ INSTRUCTION LOW NIBBLE
    assert(dut.sio_o==2)

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [23:20]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>20) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [19:16]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>16) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [15:12]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>12) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [11:8]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>8) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [7:4]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>4) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [3:0]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS) & 0xf))

    
    await ClockCycles(dut.clk, 2)
    # DATA BITS [15:12]
    assert(dut.sio_o==0x5)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [11:8]
    assert(dut.sio_o==0x4)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [7:4]
    assert(dut.sio_o==0x3)

    await ClockCycles(dut.clk, 2)
    # DATA BITS [3:0]
    assert(dut.sio_o==0x2)

    await ClockCycles(dut.clk, 2)
    # sram disabled
    assert(dut.sram_cs_n==1)



    await ClockCycles(dut.clk, 10)



    # READ FROM SRAM
    HACK_ADDRESS = 0xFEDC
    SRAM_MAPPED_ADDRESS = (HACK_ADDRESS<<1) 

    dut.address = 0xFEDC
    dut.request = 1
    dut.write_enable = 0

    await ClockCycles(dut.clk, 2)
    assert(dut.busy)    	

    dut.request = 0

    await ClockCycles(dut.clk, 2)
    # sram chip selected
    assert(dut.sram_cs_n==0)
	# READ INSTRUCTION HIGH NIBBLE
    assert(dut.sio_o==0)
    
    await ClockCycles(dut.clk, 2)
    # READ INSTRUCTION LOW NIBBLE
    assert(dut.sio_o==3)

	
    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [23:20]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>20) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [19:16]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>16) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [15:12]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>12) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [11:8]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>8) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [7:4]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS>>4) & 0xf))

    await ClockCycles(dut.clk, 2)
    # ADDRESS BITS [3:0]
    assert(dut.sio_o==((SRAM_MAPPED_ADDRESS) & 0xf))


    # DUMMY BYTE
    await ClockCycles(dut.clk, 1)
    dut.sio_i = 0xF
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    dut.sio_i = 0xF
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)

    dut.sio_i = 0x1
    await ClockCycles(dut.clk, 2)
    dut.sio_i = 0x2
    await ClockCycles(dut.clk, 2)
    dut.sio_i = 0x3
    await ClockCycles(dut.clk, 2)
    dut.sio_i = 0x4
    await ClockCycles(dut.clk, 2)

    await ClockCycles(dut.clk, 1)
    assert(dut.data_in==0x1234)

    await ClockCycles(dut.clk, 2)
    assert(dut.sram_cs_n==1)


    await ClockCycles(dut.clk, 60)

