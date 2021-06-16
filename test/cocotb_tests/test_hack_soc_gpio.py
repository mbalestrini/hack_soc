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
async def test_hack_soc_gpio(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    # dut.soc.gpio_i = 0b1101

    await reset(dut)
    # await ClockCycles(dut.clk, 2000)

    dut.soc.gpio_i = 0b1101
    await ClockCycles(dut.soc.hack_clk, 15)
    assert(dut.soc.gpio_o.value==dut.soc.gpio_i.value)

    dut.soc.gpio_i = 0b1111
    await ClockCycles(dut.soc.hack_clk, 15)
    assert(dut.soc.gpio_o.value==dut.soc.gpio_i.value)

    
    dut.soc.gpio_i = 0b1000
    await ClockCycles(dut.soc.hack_clk, 15)
    assert(dut.soc.gpio_o.value==dut.soc.gpio_i.value)


