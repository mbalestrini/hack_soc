import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0
    
    await ClockCycles(dut.clk, 1)
    




@cocotb.test()
async def test_hack_soc_with_spi_video(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    await reset(dut)

    await FallingEdge(dut.soc.hack_reset);

    await ClockCycles(dut.clk, 7000)
