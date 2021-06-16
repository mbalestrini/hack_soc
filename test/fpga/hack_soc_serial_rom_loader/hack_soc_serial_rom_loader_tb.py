import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0
    
    await ClockCycles(dut.clk, 1)
    
async def send_word(dut, data):
    dut.hack_soc_fpga.uart_1.received = 1
    dut.hack_soc_fpga.uart_1.rx_byte = data>>8
    await ClockCycles(dut.clk, 1)
    dut.hack_soc_fpga.uart_1.received = 0
    await ClockCycles(dut.clk, 100)

    dut.hack_soc_fpga.uart_1.received = 1
    dut.hack_soc_fpga.uart_1.rx_byte = data & 0xFF
    await ClockCycles(dut.clk, 1)
    dut.hack_soc_fpga.uart_1.received = 0
    await ClockCycles(dut.clk, 100)



@cocotb.test()
async def hack_soc_serial_rom_loader_tb(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    dut.BTN1 = 0
    dut.BTN3 = 0
    await reset(dut)

    await ClockCycles(dut.hack_soc_fpga.soc.hack_clk, 10)


    await (send_word(dut, 0x6001))
    await (send_word(dut, 0xEE88))

    await (send_word(dut, 0x4000))
    await (send_word(dut, 0xEE88))

    await (send_word(dut, 0x0000))
    await (send_word(dut, 0xEA87))




    dut.BTN1 = 1
    await RisingEdge(dut.hack_soc_fpga.debounced_btn1)
    await ClockCycles(dut.hack_soc_fpga.soc.hack_clk, 10)






    # await ClockCycles(dut.soc.hack_clk, 2000)


    # # Program to loaded in ROM: test_assignment_and_jump.hack

    # # Wait for HACK_PC to reset
    # await FallingEdge(dut.soc.hack_reset);

    # # Wait for program counter to reach 7 (
    # while (int(dut.soc.hack_pc.value) < 8):
    #     await ClockCycles(dut.soc.hack_clk, 1)

    # # Read Hack Memory[1]
    # current_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);
    # #print("ram[1] start value:", dut.ram.MemoryByte00002.value, dut.ram.MemoryByte00003.value, hex(current_ram_value));

    # for i in range(0, 70):
    #     # await ClockCycles(dut.soc.hack_clk, 1)
        
    #     new_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);
    #     # print("ram[1] new value:", hex(new_ram_value), new_ram_value==current_ram_value);
        
    #     # wait for Hack Memory[1] to change 
    #     while (current_ram_value==new_ram_value):
    #         await ClockCycles(dut.soc.hack_clk, 1)
    #         new_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);

    #     # Assert that the new value of Memory[1] 
    #     assert(new_ram_value==current_ram_value+1)
    #     current_ram_value = new_ram_value





    # # Test reset

    # # Fill some of the ROM with garbage
    # dut.rom.MemoryByte00000.value = 0xff
    # dut.rom.MemoryByte00001.value = 0xff
    # dut.rom.MemoryByte00002.value = 0xff
    # dut.rom.MemoryByte00003.value = 0xff
    # dut.rom.MemoryByte00004.value = 0xff
    # dut.rom.MemoryByte00005.value = 0xff

    # await ClockCycles(dut.soc.hack_clk, 20)

    # # Reset
    # await reset(dut)

    # # Repeat check with less values

    #  # Wait for HACK_PC to reset
    # await FallingEdge(dut.soc.hack_reset);

    # # Wait for program counter to reach 6 (
    # while (int(dut.soc.hack_pc.value) < 6):
    #     await ClockCycles(dut.soc.hack_clk, 1)

    # # Read Hack Memory[1]
    # current_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);
    # #print("ram[1] start value:", dut.ram.MemoryByte00002.value, dut.ram.MemoryByte00003.value, hex(current_ram_value));

    # for i in range(0, 10):
    #     # await ClockCycles(dut.soc.hack_clk, 1)
        
    #     new_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);
    #     # print("ram[1] new value:", hex(new_ram_value), new_ram_value==current_ram_value);
        
    #     # wait for Hack Memory[1] to change 
    #     while (current_ram_value==new_ram_value):
    #         await ClockCycles(dut.soc.hack_clk, 1)
    #         new_ram_value = (int(dut.ram.MemoryByte00002.value)<<8) + int(dut.ram.MemoryByte00003.value);

    #     # Assert that the new value of Memory[1] 
    #     assert(new_ram_value==current_ram_value+1)
    #     current_ram_value = new_ram_value



    # await ClockCycles(dut.soc.hack_clk, 100)

    # await ClockCycles(dut.clk, 2000)
    # await ClockCycles(dut.soc.hack_clk, 300)

    

