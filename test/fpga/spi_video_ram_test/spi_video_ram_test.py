import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.RESET_N  <= 0
    await ClockCycles(dut.EXTERNAL_CLK, 20)
    dut.RESET_N <= 1
    
    await ClockCycles(dut.EXTERNAL_CLK, 1)
    


@cocotb.test()
async def spi_video_ram_test(dut):	
    clock = Clock(dut.EXTERNAL_CLK, 10, units="us")
    cocotb.fork(clock.start())

    random.seed(0)

    await reset(dut)


    while (dut.writing_to_vram_mode==1):
        await ClockCycles(dut.EXTERNAL_CLK, 1)

    await ClockCycles(dut.EXTERNAL_CLK, 1)

    for i in range(0, 10):
        await RisingEdge(dut.display_active)
        dut.SRAM_SIO0 = 0
        dut.SRAM_SIO1 = 0
        dut.SRAM_SIO2 = 0
        dut.SRAM_SIO3 = 1


    await ClockCycles(dut.EXTERNAL_CLK, 2000)
    

    

