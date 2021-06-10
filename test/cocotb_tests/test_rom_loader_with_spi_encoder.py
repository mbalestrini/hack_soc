import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, with_timeout
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0
    
    await ClockCycles(dut.clk, 1)
    
    


@cocotb.test()
async def test_rom_loader_with_spi_encoder(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())



    file_data = []
    f = open("hack_programs/test_assignment_and_jump.hack", "r")
    for x in f:
        file_data.append(int(x,2))
    f.close()


    output_data = []
    for i in range(0,20):
        output_data.append(1-i)

    dut.manual_rom_loader_load <= 0
    dut.manual_rom_loader_data <= 0
    dut.manual_test <= 0


    await reset(dut)

    print("Started AUTOMATIC (INTERNAL VERIOG LOAD) TEST")

    # AUTOMATIC (INTERNAL VERIOG LOAD) TEST    
    await with_timeout(RisingEdge(dut.file_to_rom_done), 250, "ms")


    # Check correct data written
    idx = 0
    for value in file_data:
        assert(dut.rom.MemoryBlock[idx] == (value & 0xff))        
        idx = idx + 1




    print("Started MANUAL TEST")
    # MANUAL TEST
    dut.manual_test <= 1
    await ClockCycles(dut.clk, 10)


    #dut.manual_rom_loader_reset <= 0
    await ClockCycles(dut.clk, 1)
    
    if(dut.rom_initialized==0):
        await RisingEdge(dut.rom_initialized)

    await ClockCycles(dut.clk, 1)
    

    # Start loading ROM 
    dut.manual_rom_loader_load <= 1

    # Write first batch
    for value in output_data:
        dut.manual_rom_loader_data <= value
        dut.manual_rom_loader_sck <= 1
        await ClockCycles(dut.clk, 1)
        await with_timeout(RisingEdge(dut.rom_loader_ack), 250, "ms")
        dut.manual_rom_loader_sck <= 0
        # dut.manual_rom_loader_load <= 0
        await ClockCycles(dut.clk, 1)
        
    # dut.manual_rom_loader_load <= 0
    await ClockCycles(dut.clk, 1)

    print(" first batch written")
    await ClockCycles(dut.clk, 30)

    # Write second batch    
    for value in output_data:        
        dut.manual_rom_loader_data <= value
        dut.manual_rom_loader_sck <= 1

        await ClockCycles(dut.clk, 1)
        await with_timeout(RisingEdge(dut.rom_loader_ack), 250, "ms")
        dut.manual_rom_loader_sck <= 0
        # await RisingEdge(dut.rom_loader_ack)
        await ClockCycles(dut.clk, 1)
        
    # Stop loading ROM 
    dut.manual_rom_loader_load <= 0
    await ClockCycles(dut.clk, 2)
    print(" second batch written")



    print(" starting bach check")
    # Check correct data written
    idx = 0
    for x in range(0,2):
        for value in output_data:
            
            assert(dut.rom.MemoryBlock[idx] == ((value>>8) & 0xff))
            assert(dut.rom.MemoryBlock[idx+1] == (value & 0xff))
            idx = idx + 2


    await ClockCycles(dut.clk, 100)
    #await ClockCycles(dut.soc.hack_clk, 100)

    

