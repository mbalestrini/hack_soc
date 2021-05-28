import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0;
    
    await ClockCycles(dut.clk, 1)
    
    


@cocotb.test()
async def test_hack_soc(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 0
    dut.rom_sio3_i = 0

    dut.ram_sio0_i = 1
    dut.ram_sio1_i = 0
    dut.ram_sio2_i = 1
    dut.ram_sio3_i = 0


    await reset(dut)

    await FallingEdge(dut.hack_reset)

    #1110 0011 0000 1000

    # WAIT RAM READ
    while dut.ram_encoder_0.current_state!=0b100 :
        await ClockCycles(dut.clk, 1)
    # dummy byte
    await ClockCycles(dut.clk, 3)
    # first nibble
    dut.ram_sio0_i = 0
    dut.ram_sio1_i = 0
    dut.ram_sio2_i = 1
    dut.ram_sio3_i = 0

    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 1
    dut.rom_sio3_i = 0
    
    await ClockCycles(dut.clk, 2)
    # second nibble
    dut.ram_sio0_i = 1
    dut.ram_sio1_i = 1
    dut.ram_sio2_i = 0
    dut.ram_sio3_i = 0
    
    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 0
    dut.rom_sio3_i = 0
    
    await ClockCycles(dut.clk, 2)
    # third nibble
    dut.ram_sio0_i = 0
    dut.ram_sio1_i = 1
    dut.ram_sio2_i = 0
    dut.ram_sio3_i = 0
    
    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 0
    dut.rom_sio3_i = 0
    
    await ClockCycles(dut.clk, 2)
    # fourth nibble
    dut.ram_sio0_i = 1
    dut.ram_sio1_i = 0
    dut.ram_sio2_i = 0
    dut.ram_sio3_i = 0
    
    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 0
    dut.rom_sio3_i = 0
    


    await FallingEdge(dut.ram_busy)

    dut.rom_sio0_i = 0
    dut.rom_sio1_i = 0
    dut.rom_sio2_i = 0
    dut.rom_sio3_i = 0
    



    await ClockCycles(dut.clk, 160)

 #    # WRITE TO SRAM

 #    dut.address = 0xABCD
 #    dut.data_out = 0x5432
 #    dut.request = 1
 #    dut.write_enable = 1


 #    await ClockCycles(dut.clk, 2)
 #    assert(dut.busy)    

 #    dut.request = 0

 #    await ClockCycles(dut.clk, 2)
 #    # sram chip selected
 #    assert(dut.sram_cs_n==0)
 #    # READ INSTRUCTION HIGH NIBBLE
 #    assert(dut.sio_o==0)
    
 #    await ClockCycles(dut.clk, 2)
 #    # READ INSTRUCTION LOW NIBBLE
 #    assert(dut.sio_o==2)


 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [23:20]
 #    assert(dut.sio_o==0x0)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [19:16]
 #    assert(dut.sio_o==0x0)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [15:12]
 #    assert(dut.sio_o==0xA)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [11:8]
 #    assert(dut.sio_o==0xB)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [7:4]
 #    assert(dut.sio_o==0xC)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [3:0]
 #    assert(dut.sio_o==0xD)

    
 #    await ClockCycles(dut.clk, 2)
 #    # DATA BITS [15:12]
 #    assert(dut.sio_o==0x5)

 #    await ClockCycles(dut.clk, 2)
 #    # DATA BITS [11:8]
 #    assert(dut.sio_o==0x4)

 #    await ClockCycles(dut.clk, 2)
 #    # DATA BITS [7:4]
 #    assert(dut.sio_o==0x3)

 #    await ClockCycles(dut.clk, 2)
 #    # DATA BITS [3:0]
 #    assert(dut.sio_o==0x2)

 #    await ClockCycles(dut.clk, 2)
 #    # sram disabled
 #    assert(dut.sram_cs_n==1)



 #    await ClockCycles(dut.clk, 10)



 #    # READ FROM SRAM

 #    dut.address = 0xFEDC
 #    dut.request = 1
 #    dut.write_enable = 0

 #    await ClockCycles(dut.clk, 2)
 #    assert(dut.busy)    	

 #    dut.request = 0

 #    await ClockCycles(dut.clk, 2)
 #    # sram chip selected
 #    assert(dut.sram_cs_n==0)
	# # READ INSTRUCTION HIGH NIBBLE
 #    assert(dut.sio_o==0)
    
 #    await ClockCycles(dut.clk, 2)
 #    # READ INSTRUCTION LOW NIBBLE
 #    assert(dut.sio_o==3)

	
 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [23:20]
 #    assert(dut.sio_o==0)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [19:16]
 #    assert(dut.sio_o==0)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [15:12]
 #    assert(dut.sio_o==0xF)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [11:8]
 #    assert(dut.sio_o==0xE)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [7:4]
 #    assert(dut.sio_o==0xD)

 #    await ClockCycles(dut.clk, 2)
 #    # ADDRESS BITS [3:0]
 #    assert(dut.sio_o==0xC)


 #    # DUMMY BYTE
 #    await ClockCycles(dut.clk, 1)
 #    dut.sio_i = 0xF
 #    await ClockCycles(dut.clk, 1)
 #    await ClockCycles(dut.clk, 1)
 #    dut.sio_i = 0xF
 #    await ClockCycles(dut.clk, 1)
 #    await ClockCycles(dut.clk, 1)

 #    dut.sio_i = 0x1
 #    await ClockCycles(dut.clk, 2)
 #    dut.sio_i = 0x2
 #    await ClockCycles(dut.clk, 2)
 #    dut.sio_i = 0x3
 #    await ClockCycles(dut.clk, 2)
 #    dut.sio_i = 0x4
 #    await ClockCycles(dut.clk, 2)

 #    await ClockCycles(dut.clk, 1)
 #    assert(dut.data_in==0x1234)

 #    await ClockCycles(dut.clk, 2)
 #    assert(dut.sram_cs_n==1)



